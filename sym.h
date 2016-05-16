
struct symrec{
    char* name; //nom du symbole
    //int offset; //emplacement du symbole
    struct symrec *suivant; //lien vers le suivant
};
typedef struct symrec symrec;

symrec *identificateur;
symrec *sym_table = (symrec *)0; //pointeur sur la table des symboles

//op

symrec *putsym(char* sym_name)
//ajoute une symbole dans la table
{
    symrec *pointeur;
    pointeur = (symrec *)malloc(sizeof(symrec));
    pointeur->name = (char*)malloc(strlen(sym_name)+1);
    strcpy(pointeur->name,sym_name);
    //pointeur->offset = data_location();
    pointeur->suivant = (struct symrec*)sym_table;
    sym_table = pointeur;
    return pointeur;

}

symrec* getsym(char* sym_name)
{
    //sert à chercher un symbole dans la liste a partir
    //de son nom
    symrec* pointeur;
    for(pointeur = sym_table;pointeur != (symrec *)0; pointeur = (symrec *)pointeur->suivant)
        if(strcmp(pointeur->name,sym_name) == 0)
        return pointeur;
    return 0;
}

Ajout(char *sym_name){ //ajoute le symbole si non existant , sinon retourne une erreur
		symrec *s;
		s = getsym(sym_name);
		if (s == 0)
			s = putsym(sym_name);
		else{
			printf("%s est deja defini\n",sym_name);
		}
	}


