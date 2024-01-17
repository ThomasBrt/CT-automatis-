*** Settings ***
Documentation       Ceci est un cas de test automatisé.
Library    SeleniumLibrary

*** Variables ***
${url}    https://katalon-demo-cura.herokuapp.com
${browser}    firefox
${facility}    Hongkong CURA Healthcare Center
${readmission}    true
${readmissionExpected}    Yes
${program}    Medicaid
${visitDate}    02/07/2022
${comment}    un commentaire

*** Test Cases ***
Take an appointment
    #### Parcours de connexion ####
    #On ralentit l'exécution pour chaque nouvelle action
    Set Selenium Implicit Wait    2 seconds

    #Ouvrir le navigateur
    Open Browser    ${url}   ${browser}
    #Fenêtre en plein écran
    Maximize Browser Window
    
    #Accéder au formulaire de connexion
    Click Element    id:btn-make-appointment

    #Remplir les champs du formulaire
    Input Text    name:username    John Doe
    Input Text    name:password    ThisIsNotAPassword

    #Bouton Se connecter
    Click Button  id:btn-login  #xpath=//button[@id="btn-login"]

    #### Formulaire appointment ####
    #Sélectionner une facility
    Element Should Be Visible    id:combo_facility
    Click Element    id:combo_facility
    Select From List By Value    id:combo_facility    ${facility}
    #Cocher Apply readmission et un programme
    Element Should Be Visible    id:chk_hospotal_readmission
    Select Checkbox    id:chk_hospotal_readmission
    Select Radio Button    programs    ${program}
    # Remplir Visit date
    Input Text    id:txt_visit_date    ${visitDate}
    #Entrer un commentaire
    Input Text    id:txt_comment    ${comment}
    #Bouton Book appointment
    Click Button    id:btn-book-appointment

    #### Vérification des sorties ####
    Element Text Should Be    id:facility    ${facility}
    Element Text Should Be    id:hospital_readmission    ${readmissionExpected}
    Element Text Should Be    id:program    ${program}
    Element Text Should Be    id:visit_date    ${visitDate}
    Element Text Should Be    id:comment    ${comment}
    
    Sleep    5

    Close Browser


    
