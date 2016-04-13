#include <sym.h>
typedef enum {INT,VOID} type_t;
typedef struct symbole{
    char *nom;
    type_t type;
    int taille;
    int valeur;
    int position;
    struct symbole *suivant;
}

#define TAILLE 103
symbole *table[TAILLE];

int hash(char *nom){
    int i,r;
    int TAILLE = strlen(nom)
    r = 0;
    for(i = 0;i < TAILLE;i++){
        r = ((r << 8) + nom[i]) % TAILLE;
    }
    return r;
}

void table_reset(){
    int i;
        for(i = 0,i < TAILLE ;i++){
            table[i] = NULL;
        }
}
symbole *inserer(char *nom){
    int h;
    symbole *s;
    symbole *precedent;
    h = hash(nom);
    s = table[h];
    precedent = NULL;
    while(s != NULL){
        if (strcmp(s ->nom,nom) == 0){
            return s;
        }
        precedent = s;
        s = s->suivant;
    }
    if (precedent == NULL){
        table[h] = (symbole *) malloc(sizeof((symbole));
        s = table[h];
    }
    else{
        precedent->suivant = (symbole *) malloc(sizeof(symbole));
        s = precedent->suivant;
    }
    s->nom = strdup(nom);
    s->suivant = NULL;
    return s;
}
#endif // HASH
