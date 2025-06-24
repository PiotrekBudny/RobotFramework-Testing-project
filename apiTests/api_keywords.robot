*** Settings ***
Library    RequestsLibrary
Variables    api_variables.py

*** Variables ***
${ProductListUrl}    /productsList
${VerifyLoginUrl}    /verifyLogin

*** Keywords ***
Create API Session
    Create Session    apiSession    ${BASE_URL}

Create API Session With form HEADERS
    &{HEADERS}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded
    Create Session    apiSessionWithHeaders    ${BASE_URL}    headers=${HEADERS}

Get All Products List
    ${response}=    GET On Session    apiSession    ${ProductListUrl}
    [Return]    ${response}

Verify Login
    [Arguments]    ${user_name}    ${user_password}
    ${formData}=    Create Dictionary    username=${user_name}    password=${user_password}
    ${response}=    POST On Session    apiSessionWithHeaders    ${VerifyLoginUrl}    data=${formData}
    [Return]    ${response}

Convert to Json Object
    [Arguments]    ${response}
    ${json}=    Evaluate    $response.json()
    [Return]    ${json}