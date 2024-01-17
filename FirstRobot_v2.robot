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

*** Keywords ***
Slow execution
    #On ralentit l'exécution pour chaque nouvelle action
    Set Selenium Implicit Wait    2 seconds
Open browser to Login Page
    #### Parcours de connexion ####
    #Ouvrir le navigateur
    Open Browser    ${url}   ${browser}
    #Fenêtre en plein écran
    Maximize Browser Window  
Login to Book Appointment
    [Arguments]    ${login}    ${password}
    #Accéder au formulaire de connexion
    Click Element    id:btn-make-appointment
    #Remplir les champs du formulaire
    Input Text    name:username    ${login}
    Input Text    name:password    ${password}
    #Bouton Se connecter
    Click Button  id:btn-login  #xpath=//button[@id="btn-login"]
Book Appointment
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
    Element Should Be Visible     id:facility
    Element Should Be Visible    id:hospital_readmission
    Element Should Be Visible    id:program
    Element Should Be Visible    id:visit_date
    Element Should Be Visible    id:comment

    Element Text Should Be    id:facility    ${facility}
    Element Text Should Be    id:hospital_readmission    ${readmissionExpected}
    Element Text Should Be    id:program    ${program}
    Element Text Should Be    id:visit_date    ${visitDate}
    Element Text Should Be    id:comment    ${comment}
End of Test and Close browser
    #### Freeze puis fermeture du navigateur ####
    Sleep    5
    Close Browser


*** Test Cases ***
Login Page test
    Slow execution
    Open browser to Login Page
    End of Test and Close browser

#Cas passant
Book appointment test with existing user 
    Slow execution
    Open browser to Login Page
    Login to Book Appointment    John Doe    ThisIsNotAPassword
    Book Appointment
    End of Test and Close browser

#Cas non-passant
Book appointment test with existing user 
    Slow execution
    Open browser to Login Page
    Login to Book Appointment    yolo    yolo
    Book Appointment
    End of Test and Close browser



    
