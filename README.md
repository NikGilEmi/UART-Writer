# UART-Writer
Le projet consiste à envoyer un nombre entre 0 et 255 via le protocole UART.
Tout d'abord il faut télécharger les différents fichiers et avoir quartus de téléchargé.
Les différents fichiers se trouvent dans la partie "Hardware" et "Software".
La première étape consiste à venir programmer le FPGA de votre carte. Pour cela connéctez le cable du coté de l'alimentation puis allez sur quartus ouvrez l'outil programmer, séléctionnez le socsystem et cliquer sur start.
Si il est mis successful alors le FGPA est bien programmé. 
La deuxième étape est la programmation du cpu, pour cela branchez le cable de connexion de l'autre côté de la carte (du coté du cable ethernet).Ensuite allumez putty selectionnez serial mettez 115200 pour la vitesse de communication et metez le port sur lequel la carte est connéctée à votre ordinateur (allez voir des gestionnaire des périphériques).
Puis une fois connecté à la carte tapez ifconfig pour obtenir l'adresse ip de la carte.
Ensuite ouvrez une fenêtre SoC shell mettez vous dans le repertoire de la partie software ( où il y a le main C et le Makefile) avec la commande cd ...
Après vous devez tapez make pour créer l'éxécutable qui va être éxécuter sur la carte ( le nom de m'éxécutable créé est en haut à gauche dans le fichier Makefile) (il va afficher nothing to be done for build si tout est ok) et vous pouvez vérifier avec la commande ls que le fichier a bien été créer.
Puis il faut le télécharger sur la crate pour se faire vous devez utiliser la commande scp "nom du programme" root@"ip adress":/home/root.
Puis une confimation est demandée tapez yes.
Ensuite il vus faut retourner dans l'interface putty et taper ls pour voir si votre éxécutable est bien sur la carte.
La dernière étape est l'éxécution du programme, vous devez taper dans la console putty ./"nom du programme" "donnée à envoyer"
le programme enverra la donnée à envoyer vers la pin GPIO_0[1].

Made by :
Nikko Verquin
Gil Paternostre
Emilien Flas
