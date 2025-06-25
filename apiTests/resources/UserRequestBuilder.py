import urllib.parse

class UserRequestBuilder:
    
    def build_user_registration_form_data(
        self,
        email,
        password
    ):
        payload = {
            "name": 'Piotr',
            "email": email,
            "password": password,
            "title": 'QA Engineer',
            "birth_date": '11-11-11',
            "birth_month": 'September',
            "birth_year": 1900,
            "firstname": 'Piotr',
            "lastname": 'Tester',
            "company": 'Company1',
            "address1": 'Street 1',
            "address2": 'Street 2',
            "country": 'Poland',
            "zipcode": 888999,
            "state": 'Silesia',
            "city": 'Katowice',
            "mobile_number": 546546546
        }
        
        return urllib.parse.urlencode(payload)