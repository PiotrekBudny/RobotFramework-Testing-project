*** Settings ***
Library    SeleniumLibrary
Library    Collections
Variables    locators.py
Library    ../../resources/Utils.py

*** Keywords ***
Place Order
    [Arguments]    ${name}    ${card}
    Wait Until Element Is Visible    ${order_modal_purchase_button_locator}
    Input Text    ${order_modal_name_locator}    ${name}
    Input Text    ${order_modal_country_locator}    Poland
    Input Text    ${order_modal_city_locator}    Warsaw
    Input Text    ${order_modal_card_locator}    ${card}
    Input Text    ${order_modal_month_locator}    10
    Input Text    ${order_modal_year_locator}    1920
    
    Click Element    ${order_modal_purchase_button_locator}