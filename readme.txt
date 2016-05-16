flex Ainsi-c.l
bison -d cfe.y
gcc .c .c -o nom -ll
il faut créer un make file

sources :
-http://www.gaudry.be/langages-lsd10-source-rf-project/source/ast.c.html
-http://www.cs.virginia.edu/~jch8f/research/bdc/cgram.html
-http://foja.dcs.fmph.uniba.sk/kompilatory/docs/compiler.pdf

/***COURS****/
%eax + %ecx -> %eax
ddl %ecx %eax

%eax - %ecx -> eax
subl %ecx %eax

%eax * %ecx -> %eax
mull %ecx

%eax / %ecx -> eax

cltd idive %ecx

S -> I,S {$$ code.insert($1.code)} | E {$$ code init()}

I -> c .= E
affiche la valeur de E


I -> dent = E  (haut de la pile)
E.code
popl %eax
movl %eax ident.nom
pushhl %eax (remettre la valeur dans la pile)

pushl $chaine
call printf
addl $4 %esp


I -> E (quand on appel E, le résultat est dans ex
E.code
pushl $chaine 
call printf
add $4 %esp

E -> E1 + T
code E1 (haut de la pile)
code T (au dessus de E1)
popl %eax
popl %ecx
addl %eax %eax
pushl %eax

I -> ident = E
E.code
movl %eax ident.nom
pushl %eax
pushl %eax
pushl $chaine -> (%d)
call printf
add $4 %esp
popl %eax

I-> E
E.code
pushl %eax
pushl $chaine
call printf
addl $4 %esp
popl %eax
E -> E1 + T
E1.code
pushl %eax
T.code
popl %ecx (val E1)
addl %ecx %eax

de meme pour - * /
le reste ne change pas.




