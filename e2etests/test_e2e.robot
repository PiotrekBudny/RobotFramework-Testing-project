*** Settings ***
Library    SeleniumLibrary
Resource    e2e_keywords.robot
Resource    Pages/MainPage/MainPage.robot
Resource    Pages/ShopItemPage/ShopItemPage.robot

*** Settings ***
Variables         e2e_variables.py

*** Test Cases ***
Can Successfully Select And Order A Single Item In Store
    [Setup]    Open Browser Before Test
    ${shop_item_name_to_buy}=    Set Variable    Samsung galaxy s6    
    Click Link For Shop Item With Name    ${shop_item_name_to_buy}
    ${shop_item_name_on_page}=    Fetch Shop Item Name
    Should Be Equal As Strings    ${shop_item_name_on_page}    ${shop_item_name_to_buy}
    [Teardown]    Close Browser After Test