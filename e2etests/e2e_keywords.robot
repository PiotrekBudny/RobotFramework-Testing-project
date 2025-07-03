*** Settings ***
Variables    e2e_variables.py
Library    SeleniumLibrary
Library    Collections

*** Keywords ***
Open Browser Before Test 
    Open Browser    ${BASE_URL}    headlesschrome

Close Browser After Test
    Close All Browsers