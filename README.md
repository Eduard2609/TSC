# TSC
Repository pentru laboratorul de TSC


-Prezenta este obligatorie
-Fiecare laborator trebuie incarcat pe git
-Link-urile de pe Slack trebuie citite
-La acest laborator se va lucra in Ubuntu si ModelSim
-Prezenta la curs ajuta

-test

1) In your shell, add your user name:
	git config --global user.name "your_username"2) Add your email address:
	git config --global user.email "your_email_address@example.com"3) To check the configuration, run:
	git config --global --list

    4) git config --global credential.helper store

    verificare git stauts :
    git status


Tema 1
adaugare un fir numit Res (sumare 6 biti, inmultire 10)

Tema 2
in istr_register_test.sv avem wpointer si rpointer care sunt valori incrementale, trebuie sa le facem random intre 0 si 31
plus inca un parametru care sa spuna random case care daca ia valoare 0 va fi cazul incremental - incremental, daca ia valoare 1 va fi cazul incremetnal - random, daca ia 2 va fi random - incremental si daca e 3 random random
plus inca un parametru numit number of transaction (5,7,11)

Tema 3 
Functie check results care va prelua rezultatul din instruct_word si va calcula resultatul aspetpat si il va compara cu cel primit 
op a si op b -> resultat asteptat
daca toate au trecut  dam print la test passed
daca dom astea una a picat, dam test fail
