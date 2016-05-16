typedef struct expr{
    symbole *resultat; // pointeur sur resultat
    symbole* left;
    int op;
    symbole* right;
    struct expr *suivant; //pointeur sur le sym suivant
}
