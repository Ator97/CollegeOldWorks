#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "LinkedDataManager.h"
#include "LinkedUserManager.h"



void validaUser(LinkedUserManager * lum, LinkedDataManager * ldm); //Validador de usuarios
void adminBoard(LinkedDataManager * ldm, LinkedUserManager * lum); //Area de manejor del adminsitrador
void userBoard(LinkedDataManager * ldm, LinkedUserManager * lum, char *nombre); //Area del manejador del usuario
void readUsersFile(LinkedUserManager * lum); //Lector de datos de los usuarios.
void readDataFile(LinkedDataManager * ldm); //Lector de datos de los discos.

int main(int argc, char const *argv[])
{
	LinkedDataManager *datamanager = newLinkedDataManager(); //Crea la lista de datos de disco
	LinkedUserManager *lum = newLinkedUserManager(); //Crea la lista de datos del usuario
	
	readDataFile(datamanager);  //Lectura de archivos, se agreta a listas toda la info de los discos
	readUsersFile(lum); //Lectura de archivos, se agrega a listas toa la infoe de los usuarios
	char *user_name;
	char *user_pass; //Varibles para usuarios
	int age;
	int n =0;
	int m;
	printf("\nBienvenido al Mix Op");
	do{
	printf("1-.Crear usuario\n");
	printf("2-.Entrar al sistema\n");
	printf("3-.Salir\n");
	scanf("%d",&n);
	switch(n){

		case 1:
			printf("\nDame el nombre:");
			scanf("%s",user_name);
			m = searchA(lum, user_name);
			if (m ==-1){
				printf("\nDame la contrasena:");
				scanf("%s",user_pass);			//Creación de usuario
				printf("\nDame la edad:");
				scanf("%d",&age);
				appendA(lum,user_name,user_pass,age,0,0);
				printf("\nUsuario creado exitosamente\n");
			}else{
				printf("El usuario ya existe, contacte con el administrador\n");
			}

			break;
		case 2:
			validUser(lum,user_name, user_pass);
			break;
		case 3:
			printf("\nGracias por su preferencia\n");
			break;
		default:
			printf("\nEscoga una opción valida\n");
			break;
	}

	}while(n != 3);
	return 0;
}

void validaUser(LinkedUserManager * lum, LinkedDataManager * ldm){

	int vu = 0; //Variable para saber el tipo de usuario
	int n  = 0; //Contador de ves antes de que el sistema bote al usuario
	char *user_pass;
	char *user_name;
	do{
		printf("Dame tu usuario: ");
		scanf("%s", user_name); 
		printf("\nDame tu contrasena");     //Obtencion de datos de logeo
		scanf("%s", user_pass);
		vu = validUser(lum, user_name, user_pass); //implementar
		if (vu ==0){
			printf("Error, usuario o contrasena no reconocidos\n");
		}
	n++;
	}while(n != 3 || vu > 0); //Si el usuario se equivoca  le da tres oportunidades

	if (vu == 1){//Si el usuario es administrar entra a su panel
		adminBoard(ldm,lum);
	}
	if (vu == 2){ //Si el usuario es normal entra su panel
		userBoard(ldm,lum,user_name);
	}
}
void adminBoard(LinkedDataManager * ldm, LinkedUserManager * lum){

	int n; //Casos
	int d; //Existencia o Validaciones provenientes e los .h
	char *nombre;  //Nombre, tanto de usuario como de disco
	char *contrasena; //Contraseña (edicion)
	char * new_name;
	char * artista;
	int number;   //Edad de los usuarios y cantidad de discos
	float p; //Precios de discos
	printf("\nPanel de control\n");	
	printf("Opciones de usuario\n");
	printf("1-.Editar usuario\n");
	printf("2-.Agregar usuario\n");
	printf("3-.Eliminar usuario\n");
	printf("Opciones de discos\n");
	printf("4-.Mostrar discos\n");
	printf("5-.Buscar disco por nombre\n");
	printf("6-.Buscar disco(s) por precio\n");
	printf("7-.Agregar disco\n");
	printf("8-.Eliminar disco\n");
	printf("9-.Editar disco\n");
	printf("10-.Salir\n\n");
	scanf("%d", &n);
	switch(n){
		case 1:
			printf("Dame el nombre el usuario a editar:");
			scanf("%s", nombre);
			d = searchA(lum, nombre);
			if (d != -1 ){
				printf("\nDame el nuevo nombre de usuario");
				scanf("%s", new_name);
				printf("\nDame la contrasena nueva");
				scanf("%s",contrasena);
				printf("\nDame la edad nueva:");
				scanf("%d", &number);
				editA(lum, nombre,new_name,contrasena,number);
			}
			else{
				printf("\nEl usuario no existe");
			}
			break;
		case 2:
			printf("Dame el nombre el usuario a agregar:");
			scanf("%s", nombre);
			d = searchA(lum, nombre);
			if (d == -1){
				printf("\nDame la contrasena ");
				scanf("%s",contrasena);
				printf("\nDame la edad:");
				scanf("%d", &number);
				appendA(lum, nombre,contrasena,number,0,0);
			}
			else{
				printf("\nEl usuario ya existe");
			}
			break;
		case 3:
			printf("\nDame el nombre del usuario a eliminar:");
			scanf("%s",nombre);
			removA(lum,nombre);
			break;
		case 4:
			printT(ldm);
			break;
		case 5:
			printf("\nDame el nombre del disco");
			scanf("%s",nombre);
			printN(ldm, nombre); //PrintN debe usar search
			break;
		case 6:
			printf("\nDame el precio del disco a buscar");
			scanf("%f",&p);
			printP(ldm,p); //PrintP debe usar search
			break;
		case 7:
			printf("\nDame el nombre del disco: ");
			scanf("%s", nombre);
			d = search(ldm, nombre);
			if (d == -1){
				printf("\nDame el nombre del artista: ");
				scanf("%s", artista);
				printf("\nDame el precio del disco");
				scanf("%f",&p);
				printf("\nDame la cantidad de discos");
				scanf("%d",&number);
				append(ldm,artista,nombre, p,number);
			}else{
				printf("\nEl disco ya existe");
			}
			break;
		case 8:
			printf("\nDame el nombre del disco a eliminar");
			scanf("%s", nombre);
			d = search(ldm, nombre);
			if (d != -1){
				remov(ldm, nombre);
			}else{
				printf("\nEl disco no existe");
			}
			break;
		case 9:
			printf("\nDame el nombre del disco: ");
			scanf("%s", nombre);
			d = search(ldm, nombre);
			if (d == -1){
				printf("\nDame el nuevo nombre del disco");
				scanf("%s",new_name);
				printf("\nDame el nombre del artista: ");
				scanf("%s", artista);
				printf("\nDame el precio del disco");
				scanf("%f",&p);
				printf("\nDame la cantidad de discos");
				scanf("%d",&number);
				edit(ldm, nombre, artista, p, number);
			}else{
				printf("\nEl disco no existe");
			}
			break;
		case 10:
			printf("Regresando al menu principal\n");
			break;
		default:
			printf("Elije una opción válida\n");
			break;
	}
}
void userBoard(LinkedDataManager * ldm, LinkedUserManager * lum, char *nombre){

	char *nombreD;
	char *contrasena;
	int number;
	float p;
	int n;
	printf("\nOpciones de discos\n");
	printf("1-.Mostrar discos\n");
	printf("2-.Bsucar disco por nombre\n");
	printf("3-.Buscar disco(s) por precio\n");
	printf("4-.Comprar\n");
	printf("\nOpcioens de cuenta\n");
	printf("5-.Cambiar mis datos\n");
	printf("6-.Salir\n");
	scanf("%d",&n);
	switch(n){
		case 1: 
			printT(ldm); //PrintN debe usar search
			break;
		case 2:
			printf("\nDame el nombre del disco");
			scanf("%s",nombre);
			printN(ldm, nombreD); //PrintN debe usar search
			break;
		case 3:
			printf("\nDame el precio del disco a buscar");
			scanf("%f",&p);
			printP(ldm,p); //PrintP debe usar search
			break;
		case 4:
			////
			break;
		case 5:
			printf("\nDame tu nueva contraseña");	
			scanf("%s",contrasena);
			printf("\nDame tu edad :");
			scanf("%d",&number);
			editU(lum,nombre,contrasena,number);
			break;
		case 6:
			printf("\nRegresando al menú principal");
			break;
		default:
			printf("\nSeleciona una opción válida");
			break;	
	}
}

void readDataFile(LinkedDataManager * ldm){

	FILE *f;
	char artist[50];
	char name_disco[50];
	float price;
	int stock;

	f = fopen("user.db", "r");

	while(!feof(f)){
		fscanf(f,"%99[0-9a-zA-Z ]s|%99[0-9a-zA-Z ]s|%f|%d",artist,name_disco,&price,&stock);
		append(ldm,artist,name_disco,price,stock);
	}
	fclose(f);
}

void readUsersFile(LinkedUserManager * lum){
	FILE *f;
	char name[50];
	char contrasena[50];
	int age;
	int buy;
	int disc;

	f = fopen("user.db", "r");

	while(!feof(f)){
		fscanf(f,"%99[0-9a-zA-Z ]s|%99[0-9a-zA-Z ]s|%d|%d|%d",name,contrasena,&age,&buy,&disc);
		appendA(lum,name,contrasena,age,buy,disc);
	}
	fclose(f);
}