*** Settings ***
Library    SeleniumLibrary
Library    Collections
Variables    locators.py
Library    ../../resources/Utils.py

*** Keywords ***
Get Order Summary Message
    Wait Until Element Is Visible    ${order_summary_modal_message_locator}
    ${message}=    Get Text    ${order_summary_modal_message_locator}
    RETURN    ${message}

Get Order Summary Details
    Wait Until Element Is Visible    ${order_summary_modal_details_locator}
    ${details}=    Get Text    ${order_summary_modal_details_locator}
    RETURN    ${details}

Click Order Summary Ok Button
    Wait Until Element Is Visible    ${order_summary_modal_ok_message_locator}
    Click Element    ${order_summary_modal_ok_message_locator}
