import random

class DataGenerator:
    special_characters = "!@#$%^&*()-_=+[]{}|;:',.<>?/`~"
    
    def generate_email(self):
        return 'piotr'+ str(self.generate_number()) + '@testpiotr.pl'
    
    def generate_password(self):
        return 'piotrPass' + str(self.generate_number()) + random.choice(self.special_characters)
    
    def generate_number(self):
        return random.randint(1, 10000)