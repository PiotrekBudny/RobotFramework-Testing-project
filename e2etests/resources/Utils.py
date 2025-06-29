#Utils.py
from robot.api.deco import keyword
import re
from datetime import datetime
from dateutil.relativedelta import relativedelta

class Utils:
    
    @keyword
    def build_cells_xpath(self, base_locator: str, row_number: int):        
        return f"{base_locator}[{row_number}]/td"
    
    @keyword
    def get_shopping_item_from_cart(self, items, number_on_list):
        index = int(number_on_list) - 1
        
        pair = items[index]
        return pair[0], pair[1]
    
    @keyword
    def extract_order_summary(self, text):
        text = re.sub(r'(Card Number: \d+)(Date:)', r'\1\n\2', text)
        data = {}
        for line in text.splitlines():
            if ':' in line:
                key, value = line.split(':', 1)
                data[key.strip()] = value.strip()
        return data
    
    @keyword
    def build_expected_order_summary(self, card_number, name, amount, dateString):
        expected_data = {
            'Id': '7677319',
            'Amount': amount + ' USD',
            'Card Number': card_number,
            'Date': dateString,
            'Name': name
        }
        return expected_data
    
    @keyword
    def get_previous_month_date_string(self):
        now = datetime.now()
        prev_month = now - relativedelta(months=1)
        return f"{prev_month.day}/{prev_month.month}/{prev_month.year}"
