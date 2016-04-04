#ifndef HASH.h
#define HASH.h
#define TAILLE 103
symbole *table[TAILLE];

typedef struct symbole{
    char *nom;
    int valeur;
    struc symbole *suivant;
}

int hash(har *nom){
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
