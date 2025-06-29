*** Settings ***
Library    RequestsLibrary
Variables    api_variables.py

*** Variables ***
${ProductListUrl}    /productsList
${VerifyLoginUrl}    /verifyLogin
${CreateAccountUrl}    /createAccount
${DeleteAccountUrl}    /deleteAccount

*** Keywords ***
Create API Session
    Create Session    apiSession    ${BASE_URL}

Perform Get All Products List Request
    ${response}=    GET On Session    apiSession    ${ProductListUrl}
    RETURN    ${response}

Perform Verify Login Request
    [Arguments]    ${email}    ${user_password}
    ${headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${formData}=    Create Dictionary    email=${email}    password=${user_password}
    ${response}=    POST On Session    apiSession    ${VerifyLoginUrl}    data=${formData}    headers=${headers}    
    RETURN    ${response}

Perform Create Account Request
    [Arguments]    ${formData}
    ${headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${response}=    POST On Session    apiSession    ${CreateAccountUrl}    data=${formData}    headers=${headers}    
    RETURN    ${response}

Perform Delete Account Request
    [Arguments]    ${email}    ${password}
    ${headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${formData}=    Create Dictionary    email=${email}    password=${password}
    ${response}=    DELETE On Session    apiSession    ${DeleteAccountUrl}    data=${formData}    headers=${headers}
    RETURN    ${response}