# Projet mobile : Flutter
## Développement réalisé 
### US#1: [MVP] Interface de login
* Critère 1 à 6

### US#2: [MVP] Liste de vêtements
* Critère 1 à 6

### US#3: [MVP] Détail d’un vêtement 
* Critère 1 et 2

### US#4: [MVP] Le panier
* Critère 1 à 2

### US#5 : [MVP] Profil utilisateur 
* Critère 1 à 4

### US#6 : Filtrer sur la liste des vêtements
* Tous les critères sont remplis

## Ajouts supplémentaires et Observations
* Dans la page de détails du vêtement, il faut faire attention a bien sélectionner la taille pour actier l'action de sélection et le changement d'état de l'objet.
* Register avec confirmation de mot de passe ajouté
* J'ai essayé d'ajouté le login via google mais pour le moment l'appel à l'API google fonctionne mais pas l'enregistrement en base.
* Dans la page profil, l'utilisateur peut ajouter une image en l'uploadant depuis son téléphone, il peut changer sa date d'anniversaire dpeuis un bouton calendar.
* J'ai ajouté le "Forgot password" mais je n'ai pas testé encore sur une adresse mail réelle. (je n'utilise que des mails fictifs)
* Il est possible d'observer en mode Run debug un bug graphique avec le message "overflowed by 1.00 pixels on the bottom".  Cela ai du au fait que j'ai utilsier un élément "Column" au lieu d'un "listView" pour faire apparaître mes vêtement ou certains champs sur le profil. Pour résoudre ce bug, il y a 2 solutions possibles : 
  * Ajouter dans mon "Scaffold" le champs " resizeToAvoidBottomInset: false", cela fonctionne pour la page de login et de register mais pas le reste.
  * Sinon je dois placer mes "Column" de la façon suivante :

    <code>Scaffold(

    resizeToAvoidBottomInset: false, // set it to false

    body: SingleChildScrollView(child: Column()),
    
    )</code> Cependant cela efface l'afichage des vêtement. Donc je l'ai laissé ainsi.

* Il se peut aussi que dans le panier le message "invalid argument" apparaisse en haut du panier quanbd celui-ci est vide. C'est juste un message du mode debug.