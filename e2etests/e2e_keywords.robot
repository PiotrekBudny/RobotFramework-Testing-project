*** Settings ***
Variables    e2e_variables.py
Library    SeleniumLibrary
Library    Collections

*** Keywords ***
Open Browser Before Test
    Open Browser    ${BASE_URL}    Chrome
    Maximize Browser Window

Close Browser After Test
    Close All Browsers