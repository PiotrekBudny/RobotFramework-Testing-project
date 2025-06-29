*** Settings ***
Library    SeleniumLibrary
Library    String
Variables    locators.py

*** Keywords ***
Fetch Shop Item Data From Product Page
    Wait Until Element Is Visible    ${H2_Name_Locator}
    ${product_name}=    Get Text    ${H2_Name_Locator}
    ${product_price_value}=    Get Text    ${price_tag_locator}
    ${clean_price}=    Remove String Using Regexp    ${product_price_value}    [^0-9.]
    RETURN    ${product_name}    ${clean_price}

Add item to the cart
    Wait Until Element Is Visible    ${H2_Name_Locator}
    Click Link    ${add_to_cart_button_locator}    
    