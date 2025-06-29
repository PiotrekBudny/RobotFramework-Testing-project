*** Settings ***
Library    SeleniumLibrary
Library    Collections
Variables    locators.py
Library    ../../resources/Utils.py
*** Keywords ***
Click Purchase Button
    Wait Until Element Is Visible    ${shopping_cart_purchase_button_locator}
    Click Element    ${shopping_cart_purchase_button_locator}

Get Products And Prices From Shopping Cart
    ${title_index}    ${price_index}=    Establish Title And Price Table Index
    Wait Until Element Is Visible    ${shopping_cart_table_row_locator}
    ${rows}=    Get WebElements    ${shopping_cart_table_row_locator}

    ${products}=    Create List
    
    ${count}=    Get Length    ${rows}
    
    FOR    ${idx}   IN RANGE    ${count}
        ${row_number}=     Evaluate    ${idx} + 1
        ${cells_xpath}=    Build Cells Xpath    ${shopping_cart_table_row_locator}    ${row_number}
        ${cells}=    Get WebElements    ${cells_xpath}
        ${title_cell}=    Get From List    ${cells}    ${title_index}
        ${price_cell}=    Get From List    ${cells}    ${price_index}
        ${title}=    Get Text    ${title_cell}
        ${price}=    Get Text    ${price_cell}
        @{pair}=    Create List    ${title}    ${price}
        Append To List    ${products}    ${pair}
    END

    RETURN    @{products}

Establish Title And Price Table Index
    Wait Until Element Is Visible    ${shopping_cart_table_header_locator}
    @{headers}=    Get WebElements    ${shopping_cart_table_header_locator}
    ${title_index}=    Set Variable    -1
    ${price_index}=    Set Variable    -1
    
    FOR    ${header_index}    ${header_value}    IN ENUMERATE    @{headers}
        ${text}=    Get Text    ${header_value}
        Run Keyword If    '${text}'=='Title'    Set Test Variable    ${title_index}    ${header_index}
        Run Keyword If    '${text}'=='Price'    Set Test Variable    ${price_index}    ${header_index}
    END           
    
    RETURN    ${title_index}    ${price_index}