*** Settings ***
Resource    Pages/ShopItemPage/ShopItemPage.robot
Library    resources/Utils.py
*** Keywords ***
Assert Shop Item Data
    [Arguments]    ${expected_shop_item_name}    ${expected_shop_item_price}    ${actual_shop_item_name}    ${actual_shop_item_price}
    Should Be Equal As Strings    ${expected_shop_item_name}    ${actual_shop_item_name}
    Should Be Equal As Integers    ${expected_shop_item_price}    ${actual_shop_item_price}

Assert That Order Summary Displays Successfull Message
    [Arguments]    ${expected_order_summary_message}    ${order_summary_message}
    Should Be Equal As Strings    ${expected_order_summary_message}    ${order_summary_message}

Assert That Order Summary Displays Details
    [Arguments]    ${expected_order_summary_details}    ${order_summary_details}
    ${order_summary_details_dict}=    Extract Order Summary    ${order_summary_details}
    Should Be Equal As Strings    ${expected_order_summary_details}[Card Number]    ${order_summary_details_dict}[Card Number]
    Should Be Equal As Strings    ${expected_order_summary_details}[Name]    ${order_summary_details_dict}[Name]
    Should Be Equal As Strings    ${expected_order_summary_details}[Amount]    ${order_summary_details_dict}[Amount]
    Should Be Equal As Strings    ${expected_order_summary_details}[Date]    ${order_summary_details_dict}[Date]
    Should Match Regexp    ${order_summary_details_dict}[Id]    ^\\d+$