//Interfaz LinkedDataManager

struct Node
{
	char *artist;
	char *name_disc;
	float price;
	int stock;
	int sells;
	struct Node *next;
};

typedef struct Node Node;

typedef struct
{
	Node *head;
} LinkedDataManager;

LinkedDataManager * newLinkedDataManager();
//Declación de funciones.
int search(LinkedDataManager * ldm, char *name_disc);
void append(LinkedDataManager * ldm, char *artist, char *name_disc,float price, int stock);
void remov(LinkedDataManager * ldm, char *name_disc);
void printN(LinkedDataManager * ldm, char *name_disc);
void printP(LinkedDataManager * ldm, float price);
void printT(LinkedDataManager * ldm);
void edit(LinkedDataManager * ldm, char *artist, char *name_disc,float price, int stock);

void recycleLinkedDataManager(LinkedDataManager * ldm);

//Auxiliares
int isEmpty(LinkedDataManager * ldm);
Node *newNode(char *artist, char *name_disc,float price, int stock);
void guardaInventario(LinkedDataManager * ldm);