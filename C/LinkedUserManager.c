//Implementacion LinkedUserManager
#include "LinkedUserManager.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

LinkedUserManager * newLinkedUserManager ()
{
	LinkedUserManager * newlum = (LinkedUserManager *)malloc(sizeof(LinkedUserManager));
	newlum->head = NULL;
	return newlum;
}
int cont = 0;

//Search
int search(LinkedUserManager * lum, char *nombre){

	int cont=0;
	if(isEmptyU(lum)){
		printf("No hay usuarios.");
		return -1;
	}
	NodeU * cursor=lum->head;
	//Busca el caracter en la lista
	while(cursor!=NULL){
		if(strcmp(cursor->nombre, nombre ) != 0)
			return cont;
		cont++;
		cursor=cursor->next;
	}
	if(cursor==NULL){//Si no está en la luma devuelve -1
		return -1;
	}
	else{
		return cont;
	}
}

//Inserciones
void appendA(LinkedUserManager * lum, char *nombre, char *contrasena, int age,int buy,int disco){
	//Creamos un nuevo nodo para la luma
	NodeU * n =newNodeU(nombre, contrasena,age,buy,disco);
	//Si esta vacía entonces:
	if(isEmptyU(lum))
		//El tope es igual al nuevo nodo
		lum->head=n;
	else{
		NodeU * cursor=lum->head;
		while(cursor->next!=NULL)//Busca el último elemento de la luma
			cursor=cursor->next;
		//El siguiente del nuevo nodo es el siguiente del último.
		n->next=cursor->next;
		//El siguiente del último ahora es el nuevo nodo.
		cursor->next=n;
	}
	cont++;
}

//Eliminación
void removA(LinkedUserManager * lum, char *nombre){
	int pos,i;
	pos=search(lum,nombre);
	if(pos==-1){
		//Si no existe el anterior a la posición solicitada entonces lo indica al usuario.
		printf("Imposible eliminar. No existe el usuario\n" );
		return;
	}
	NodeU * cursor=lum->head;
	//Recorremos la luma en busca de el anterior a la posición solicitada
	for(i=0;i<pos-1;i++){
		cursor=cursor->next;
	}
	//Guardamos la dirección del nuevo nodo en una variable auxiliar para después hacer free
	NodeU * aux=cursor->next;
	//El cursor que es el anterior de la posición encontrada por el search de la letra ahora su siguiente es dos veces el siguiente ya que se salta el nodo que vamos a borrar
	cursor->next=cursor->next->next;
	//Liberamos el nodo que ya no se usará
	cont--;
	free(aux);
}

//Muestreo

void printT(LinkedUserManager * lum, char *nombre){
	NodeU * cursor=lum->head;
	int i;
	for (i = 0; i<cont; i++){
	printf("\n-------------------------------------\n");
	printf("Nombre de usuario: %s\n",cursor->nombre );
	printf("Edad del usuario : %d\n",cursor->age );
	printf("Numero de compras: %d\n",cursor->buy );
	printf("Numero de discos comprados: %d\n",cursor->disco );

	cursor=cursor->next;
	}
}
//Edición
void editA(LinkedUserManager * lum, char *nombre, char *nombre_nuevo, char *contrasena,int age){
	int pos,i;
	pos=search(lum,nombre);
	if(pos==-1){
		//Si no existe el anterior a la posición solicitada entonces lo indica al usuario.
		printf("Imposible editar. El usuario no existe \n");
		return;
	}
	NodeU * cursor=lum->head;
	//Recorremos la luma en busca de el anterior a la posición solicitada
	for(i=0;i<pos-1;i++){
		cursor=cursor->next;
	}
	cursor->nombre = nombre_nuevo;
	cursor->contrasena = contrasena;
	cursor->age = age;
}


void editU(LinkedUserManager * lum, char *nombre, char *contrasena,int age){
	int pos,i;
	pos=search(lum,nombre);
	if(pos==-1){
		//Si no existe el anterior a la posición solicitada entonces lo indica al usuario.
		printf("Imposible editar. El usuario no existe \n");
		return;
	}
	NodeU * cursor=lum->head;
	//Recorremos la luma en busca de el anterior a la posición solicitada
	for(i=0;i<pos-1;i++){
		cursor=cursor->next;
	}
	cursor->contrasena = contrasena;
	cursor->age = age;
}

int validUser(LinkedUserManager * lum, char * nombre,char *contrasena){

	if(isEmptyU(lum)){
		printf("No hay usuarios.");
		return -1;
	}
	NodeU * cursor=lum->head;
	//Busca el caracter en la lista
	if((strcmp(nombre,"admin" ) != 0)&& strcmp(contrasena,"admin"))
		return 1;

	while(cursor!=NULL){
		if((strcmp(cursor->nombre, nombre ) != 0)&& strcmp(cursor->contrasena, contrasena))
			return 2;
		cursor=cursor->next;
	}
	if(cursor==NULL){//Si no está en la luma devuelve -1
		return -1;
	}
}

//Funciones auxuliares
void recycleLinkedUserManagerU(LinkedUserManager *lum){
	NodeU *cursor,*aux;
	cursor = lum->head;
	while(cursor != NULL){
		aux = cursor->next;
		free(cursor);
		cursor = aux;
	}
	free(lum);
}

int isEmptyU(LinkedUserManager *lum){
	return lum->head == NULL;
}

NodeU *newNodeU(char *nombre, char * contrasena, int age, int buy, int disco){
	NodeU *new = (NodeU *)malloc(sizeof(NodeU));
	new->nombre = nombre;
	new->contrasena = contrasena;
	new->age = age;
	new->buy = buy;
	new->disco = disco;
	new->next = NULL;
	return new;
}

void guardaInventarioU(LinkedUserManager * lum) {

	FILE * f = fopen("dbwalmert.db","w");
	if (!f) {
		printf("Error al guardar el inventario. Verifique el archivo.\n");
		return;
	}
	NodeU * cursor=lum->head;
	while(cursor != NULL){
		fprintf(f,"%s|%s|%d|%d|%d\n",cursor->nombre, cursor->contrasena,cursor->age, cursor->buy, cursor->disco);
		cursor = cursor->next;
	}
	fclose(f);
}
