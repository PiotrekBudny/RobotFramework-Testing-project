*** Settings ***
Library    SeleniumLibrary
Library    resources/Utils.py
Resource    e2e_keywords.robot
Resource    Pages/MainPage/MainPage.robot
Resource    Pages/ShopItemPage/ShopItemPage.robot
Resource    Pages/NavBar/NavBar.robot
Resource    Pages/ShoppingCartPage/ShoppingCart.robot
Resource    Pages/PlaceOrderModal/PlaceOrderModal.robot
Resource    Pages/OrderSummaryModal/OrderSummary.robot
Resource    e2e_assertions.robot

*** Settings ***
Variables         e2e_variables.py

*** Test Cases ***
Can Successfully Select And Order A Single Item In Store
    [Setup]    Open Browser Before Test
    
    #Arranging the test
    ${expected_shop_item_name}=    Set Variable    Samsung galaxy s6  
    ${expected_shop_item_price}=    Set Variable    360
    ${expected_customer_name}=    Set Variable    John Doe
    ${expected_customer_card_number}=    Set Variable    1234 5678 9012 3456
    ${expected_order_summary_message}=    Set Variable    Thank you for your purchase!
    ${expected_payment_date}=    Get Previous Month Date String
    ${expected_order_summary_details}=    Build Expected Order Summary    ${expected_customer_card_number}    ${expected_customer_name}    ${expected_shop_item_price}    ${expected_payment_date}
    #Acting the test
    Click Link For Shop Item With Name    ${expected_shop_item_name}
    ${actual_shop_item_name}    ${acutal_shop_item_price}=    Fetch Shop Item Data From Product Page
    Add item to the cart
    Go To Shopping cart
    ${products_in_cart}=    Get Products And Prices From Shopping Cart
    Log    ${products_in_cart}
    ${item_title_in_cart}    ${item_price_in_cart}=    Get Shopping Item From Cart    ${products_in_cart}    1
    Click Purchase Button
    Place Order    ${expected_customer_name}    ${expected_customer_card_number}
    ${order_summary_message}=    Get Order Summary Message
    ${order_summary_details}=    Get Order Summary Details   
    Click Order Summary Ok Button
    # Asserting the test
    Assert Shop Item Data    ${expected_shop_item_name}    ${expected_shop_item_price}    ${actual_shop_item_name}    ${acutal_shop_item_price}    
    Assert Shop Item Data    ${expected_shop_item_name}    ${expected_shop_item_price}   ${item_title_in_cart}    ${item_price_in_cart}
    Assert That Order Summary Displays Successfull Message    ${expected_order_summary_message}    ${order_summary_message}
    Assert That Order Summary Displays Details    ${expected_order_summary_details}    ${order_summary_details}    
    [Teardown]    Close Browser After Test