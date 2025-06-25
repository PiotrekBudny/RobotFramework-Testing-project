*** Settings ***
Library           RequestsLibrary
Resource          api_keywords.robot
Variables         api_variables.py

*** Test Cases ***
Will Return Product list with Get All Products method
    [Tags]    Functionality
    [Setup]    Create API Session
    
    ${expected_response_code_int}=    Evaluate    int('200')  
    ${expcted_reponse_products_list_length}=    Set Variable    34

    ${response}=    Get All Products List

    ${json}=    Convert to Json Object    ${response}
    Status Should Be    200    ${response}
    Should Be Equal    ${json['responseCode']}    ${expected_response_code_int}
    Length Should Be    ${json['products']}    ${expcted_reponse_products_list_length}

Should Confirm User Is Not Found When User Detals Are Invalid
    [Tags]    Functionality
    [Setup]    Create API Session

    ${email}=    Set Variable    invalidMail@invalidMail.pl
    ${user_password}=    Set Variable    invalidPassword
    ${expected_response_code}=    Set Variable    404
    ${expected_response_message}=   Set Variable    User not found!   
    
    ${response}=    Verify Login    ${email}    ${user_password}
    ${json}=    Convert to Json Object    ${response}

    Status Should Be    200    ${response}
    Should Be Equal As Integers    ${json['responseCode']}    ${expected_response_code}
    Should Be Equal    ${json['message']}    ${expected_response_message}



