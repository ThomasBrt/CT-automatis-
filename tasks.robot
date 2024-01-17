*** Settings ***
Documentation       Template robot main suite.


*** Tasks ***
Minimal task
    Log    Done.


*** Comments ***
1 : Bouton d'accès au menu latéral : //a[@id="menu-toggle"]
2 : Bouton d'accès au Login : //a[@href="profile.php#login"] ou //a[.="Login"] 
3 : Lien Twitter : //i[contains(@class, "fa-twitter")]/..
4 : Lien de contact mail Katalon : //a[@href="mailto:info@katalon.com]
5 : Titre de la page qui contient «CURA Healthcare Service» : //h1[.="CURA Healthcare Service"] ou //h1

