//Implementacion LinkedDataManager
#include "LinkedDataManager.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
	char *artist;
	char *name_disc;
	float price;
	int sells;
	int stock;
	struct Node *next;
*/
LinkedDataManager * newLinkedDataManager(){
	LinkedDataManager * newldm = (LinkedDataManager *)malloc(sizeof(LinkedDataManager));
	newldm->head = NULL;
	return newldm;
}
int cont = 0;

//Search
int search(LinkedDataManager * ldm, char *name_disc){

	int cont=0;
	if(isEmpty(ldm)){
		printf("No existen discos.");
		return -1;
	}
	Node * cursor=ldm->head;
	//Busca el caracter en la ldma
	while(cursor!=NULL){
		if(strcmp(cursor->name_disc, name_disc ) != 0)
			return cont;
		cont++;
		cursor=cursor->next;
	}
	if(cursor==NULL){//Si no está en la ldma devuelve -1{
		return -1;
	}
	else{
		return cont;
	}
}

//Inserciones
void append(LinkedDataManager * ldm, char *artist, char *name_disc,float price, int stock){
	//Creamos un nuevo nodo para la ldma
	Node * n =newNode(artist, name_disc, price,stock);
	//Si esta vacía entonces:
	if(isEmpty(ldm))
		//El tope es igual al nuevo nodo
		ldm->head=n;
	else{
		Node * cursor=ldm->head;
		while(cursor->next!=NULL)//Busca el último elemento de la ldma
			cursor=cursor->next;
		//El siguiente del nuevo nodo es el siguiente del último.
		n->next=cursor->next;
		//El siguiente del último ahora es el nuevo nodo.
		cursor->next=n;
	}
	cont++;
}

//Eliminación
void remov(LinkedDataManager * ldm, char *name_disc){
	int pos,i;
	pos=search(ldm,name_disc);
	if(pos==-1){
		//Si no existe el anterior a la posición solicitada entonces lo indica al usuario.
		printf("Imposible eliminar, el disco no existe.\n");
		return;
	}
	Node * cursor=ldm->head;
	//Recorremos la ldma en busca de el anterior a la posición solicitada
	for(i=0;i<pos-1;i++){
		cursor=cursor->next;
	}
	//Guardamos la dirección del nuevo nodo en una variable auxiliar para después hacer free
	Node * aux=cursor->next;
	//El cursor que es el anterior de la posición encontrada por el search de la letra ahora su siguiente es dos veces el siguiente ya que se salta el nodo que vamos a borrar
	cursor->next=cursor->next->next;
	//Liberamos el nodo que ya no se usará
	cont--;
	free(aux);
}

//Muestreo
void printN(LinkedDataManager * ldm, char *name_disc){
	int pos,i;
	pos=search(ldm,name_disc);
	if(pos==-1){
		//Si no existe el anterior a la posición solicitada entonces lo indica al usuario.
		printf("Imposible imprimir. El disco no existe.\n");
		return;
	}
	Node * cursor=ldm->head;
	//Recorremos la ldma en busca de el anterior a la posición solicitada
	for(i=0;i<pos-1;i++){
		cursor=cursor->next;
	}

	printf("Nombre del artista: %s\n",cursor->artist );
	printf("Nombre del disco: %s\n",cursor->name_disc );
	printf("Precio del disco: %f\n",cursor->price );
	printf("Ventas del disco: %d\n",cursor->sells );
	printf("Exisencias: %d\n",cursor->stock );
	printf("-----------------------------\n" );
}

void printP(LinkedDataManager * ldm, float price){
	int pos=0, i;
	Node * cursor=ldm->head;
	//Recorremos la ldma en busca de el anterior a la posición solicitada
	for(i=0;i<pos-1;i++){
		if(cursor->price == price){
			printf("Nombre del artista: %s\n",cursor->artist );
			printf("Nombre del disco: %s\n",cursor->name_disc );
			printf("Precio del disco: %f\n",cursor->price );
			printf("Ventas del disco: %d\n",cursor->sells );
			printf("Exisencias: %d\n",cursor->stock );
			printf("-----------------------------\n" );	
		}
		cursor=cursor->next;
	}
}

void printT(LinkedDataManager * ldm){
	Node * cursor=ldm->head;
	int i;
	for (i = 0; i<cont; i++){
		printf("Nombre del artista: %s\n",cursor->artist );
		printf("Nombre del disco: %s\n",cursor->name_disc );
		printf("Precio del disco: %f\n",cursor->price );
		printf("Ventas del disco: %d\n",cursor->sells );
		printf("Exisencias: %d\n",cursor->stock );
		printf("-----------------------------\n");

		cursor=cursor->next;
	}
}
//Edición
void edit(LinkedDataManager * ldm, char *artist, char *name_disc,float price, int stock){
	int pos,i;
	pos=search(ldm,name_disc);
	if(pos==-1){
		//Si no existe el anterior a la posición solicitada entonces lo indica al usuario.
		printf("Imposible modificar, no existe el disco.\n");
		return;
	}
	Node * cursor=ldm->head;
	//Recorremos la ldma en busca de el anterior a la posición solicitada
	for(i=0;i<pos-1;i++)
		cursor=cursor->next;

	cursor->artist= artist;
	cursor->name_disc= name_disc;
	cursor->price = price;
	cursor->stock = stock;
	printf("\nModificaicon exitosa \n");
}

//Funciones auxuliares
void recycleLinkedDataManager(LinkedDataManager *ldm){

	Node *cursor,*aux;
	cursor = ldm->head;
	while(cursor != NULL){
		aux = cursor->next;
		free(cursor);
		cursor = aux;
	}
	free(ldm);
}

int isEmpty(LinkedDataManager *ldm){
	return ldm->head == NULL;
}

Node *newNode(char *artist, char *name_disc,float price, int stock){

	Node *new = (Node *)malloc(sizeof(Node));
	new->artist= artist;
	new->name_disc= name_disc;
	new->price = price;
	new->stock = stock;
	new->sells = 0;
	new->next = NULL;
	return new;
}

void guardaInventario(LinkedDataManager * ldm) {

	FILE * f = fopen("data.db","w");
	if (!f) {
		printf("Error al guardar el inventario. Verifique el archivo.\n");
		return;
	}
	Node * cursor=ldm->head;
	while(cursor != NULL){
		fprintf(f,"%s|%s|%f|%d|%d\n",cursor->artist, cursor->name_disc, cursor->price, cursor->stock, cursor->sells);
		cursor = cursor->next;
	}
	fclose(f);
}