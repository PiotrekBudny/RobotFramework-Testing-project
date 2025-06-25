*** Settings ***
Library    RequestsLibrary
Variables    api_variables.py

*** Variables ***
${ProductListUrl}    /productsList
${VerifyLoginUrl}    /verifyLogin

*** Keywords ***
Create API Session
    Create Session    apiSession    ${BASE_URL}

Get All Products List
    ${response}=    GET On Session    apiSession    ${ProductListUrl}
    [Return]    ${response}

Verify Login
    [Arguments]    ${email}    ${user_password}
    ${headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    ${formData}=    Create Dictionary    email=${email}    password=${user_password}
    ${response}=    POST On Session    apiSession    ${VerifyLoginUrl}    data=${formData}    headers=${headers}    
    [Return]    ${response}

Convert to Json Object
    [Arguments]    ${response}
    ${json}=    Evaluate    $response.json()
    [Return]    ${json}