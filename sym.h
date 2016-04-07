#ifndef sym.h
#define TAILLE 103
typedef struct symbole{
    char *nom;
    int valeur;
    struc symbole *suivant;
}
int hash(char *nom);
void table_reset();
symbole *inserer(char *nom);


#endif //
