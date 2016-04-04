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



