*** Settings ***
Library    RequestsLibrary

*** Keywords ***
Valid Get All Products List Response Was Returned
    [Arguments]    ${response}
    ${expected_response_code_int}=    Evaluate    int('200')  
    ${expcted_reponse_products_list_length}=    Set Variable    34
     ${json}=    Convert to Json Object    ${response}
    Status Should Be    200    ${response}
    Should Be Equal    ${json['responseCode']}    ${expected_response_code_int}
    Length Should Be    ${json['products']}    ${expcted_reponse_products_list_length}

Not Existing User Response Was Returned
    [Arguments]    ${response}
    ${expected_response_code}=    Set Variable    404
    ${expected_response_message}=   Set Variable    User not found!
    ${json}=    Convert to Json Object    ${response}

    Status Should Be    200    ${response}
    Should Be Equal As Integers    ${json['responseCode']}    ${expected_response_code}
    Should Be Equal    ${json['message']}    ${expected_response_message}

User Created Response Was Returned
    [Arguments]    ${response}
    ${expected_response_code}=    Set Variable    201
    ${expected_response_message}=   Set Variable    User created!
    ${json}=    Convert to Json Object    ${response}

    Status Should Be    200    ${response}
    Should Be Equal As Integers    ${json['responseCode']}    ${expected_response_code}
    Should Be Equal    ${json['message']}    ${expected_response_message}

User Exists Response Was Returned
    [Arguments]    ${response}
    ${expected_response_code}=    Set Variable    200
    ${expected_response_message}=   Set Variable    User exists!
    ${json}=    Convert to Json Object    ${response}

    Status Should Be    200    ${response}
    Should Be Equal As Integers    ${json['responseCode']}    ${expected_response_code}
    Should Be Equal    ${json['message']}    ${expected_response_message}

Convert to Json Object
    [Arguments]    ${response}
    ${json}=    Evaluate    $response.json()
    [Return]    ${json}