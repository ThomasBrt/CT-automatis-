*** Settings ***
Documentation    Ceci est un second cas de test automatisé.
Resource    FirstRobot.resource
Test Setup    Slow execution
Test Teardown    End of Test and Close browser

*** Test Cases ***
Login Page test
    [Tags]    login
    Open browser to Login Page
    End of Test and Close browser

Book appointment test with existing user
    [Tags]    book_appointment
    Open browser to Login Page
    Login to Book Appointment    John Doe    ThisIsNotAPassword    &{JDD1}{facility}    &{JDD2}{program}
    Book Appointment


