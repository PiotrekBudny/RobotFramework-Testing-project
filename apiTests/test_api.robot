*** Settings ***
Library           RequestsLibrary
Library           resources/DataGenerator.py
Library           resources/UserRequestBuilder.py
Resource          api_keywords.robot
Resource          api_assertion_keywords.robot
Variables         api_variables.py

*** Test Cases ***
Will Return Product list with Get All Products method
    [Tags]    Functionality
    [Setup]    Create API Session
    
    ${expected_response_code_int}=    Evaluate    int('200')  
    ${expcted_reponse_products_list_length}=    Set Variable    34

    ${response}=    Perform Get All Products List Request

    Valid Get All Products List Response Was Returned    ${response}

Should Confirm User Is Not Found When User Detals Are Invalid
    [Tags]    Functionality
    [Setup]    Create API Session

    ${email}=    Set Variable    invalidMail@invalidMail.pl
    ${user_password}=    Set Variable    invalidPassword
    
    ${response}=    Perform Verify Login Request    ${email}    ${user_password}
    Not Existing User Response Was Returned    ${response}

Can successfully register user account
    [Tags]    Functionality
    [Setup]    Create API Session
    
    ${email}=    Generate Email
    ${user_password}=    Generate Password
    ${user_request}=    Build User Registration Form Data    ${email}   ${user_password}

    ${create_account_response}=    Perform Create Account Request    ${user_request}
    ${verify_login_response}=    Perform Verify Login Request    ${email}    ${user_password}
    
    User Created Response Was Returned    ${create_account_response}
    User Exists Response Was Returned    ${verify_login_response}

    [Teardown]    Perform Delete Account Request    ${email}    ${user_password}
