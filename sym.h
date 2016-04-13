
#define TAILLE 103
typedef type_t;
typedef struct symbole{
    char *nom;
    type_t type ;
    int taille;
    int valeur;
    int position;
    struct symbole *suivant;
}symbole;
int hash(char *nom);
void table_reset();
symbole *inserer(char *nom);

