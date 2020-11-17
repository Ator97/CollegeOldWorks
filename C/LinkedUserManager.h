//Interfaz LinkedUserManager

struct NodeU
{
	char *nombre;
	char *contrasena;
	int age;
	int buy;
	int disco;
	struct NodeU *next;
};

typedef struct NodeU NodeU;

typedef struct
{
	NodeU *head;
} LinkedUserManager;

LinkedUserManager * newLinkedUserManager();
//Declación de funciones.
int searchA(LinkedUserManager * lum, char *nombre);
void appendA(LinkedUserManager * lum, char *nombre, char *contrasena, int age,int buy, int disco);
void removA(LinkedUserManager * lum, char *nombre);
void printTA(LinkedUserManager * lum, char *nombre);
void editA(LinkedUserManager * lum, char *nombre, char *nombre_nuevo,char *contrasena,int age);
void editU(LinkedUserManager * lum, char *nombre, char * contrasena, int age);
int validUser(LinkedUserManager * lum, char * nombre,char *contrasena);
void recycleLinkedUserManagerU(LinkedUserManager * lum);
//Auxiliares
int isEmptyU(LinkedUserManager * lum);
NodeU *newNodeU(char *nombre, char *contrasena, int age);
void guardaInventarioU(LinkedUserManager * lum);

