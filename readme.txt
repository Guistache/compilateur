flex Ainsi-c.l
bison -d cfe.y
gcc .c .c -o nom -ll
il faut créer un make file



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


I -> E
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




