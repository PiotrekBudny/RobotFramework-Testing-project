# RobotFramework Testing Project

This repository contains end-to-end (E2E) and API tests for a web application using [Robot Framework](https://robotframework.org/), SeleniumLibrary, and supporting Python utilities.

## Features

- E2E UI tests with SeleniumLibrary
- API tests with Robot Framework RequestsLibrary and JSONLibrary
- Modular page object structure for maintainability
- Custom Python keywords for advanced logic
- Test data and variables separated for easy configuration

## Project Structure

```
.
├── apiTests/
│   ├── api_assertion_keywords.robot
│   ├── api_keywords.robot
│   ├── api_variables.py
│   └── test_api.robot
├── e2etests/
│   ├── Pages/
│   │   ├── MainPage/
│   │   ├── NavBar/
│   │   ├── ShopItemPage/
│   │   └── ShoppingCartPage/
│   ├── resources/
│   │   └── Utils.py
│   ├── e2e_keywords.robot
│   ├── e2e_variables.py
│   └── test_e2e.robot
├── requirements.txt
└── README.md
```

## Setup

1. **Clone the repository:**
   ```sh
   git clone <your-repo-url>
   cd RobotFramework-Testing-project
   ```

2. **Create a virtual environment (optional but recommended):**
   ```sh
   python -m venv venv
   .\venv\Scripts\activate
   ```

3. **Install dependencies:**
   ```sh
   pip install -r requirements.txt
   ```

## Running Tests

- **E2E Tests:**
  ```sh
  robot e2etests/test_e2e.robot
  ```

- **API Tests:**
  ```sh
  robot apiTests/test_api.robot
  ```

## Reports

After running tests, you will find:
- `log.html` – Detailed execution log
- `report.html` – High-level test report
- `output.xml` – Robot Framework output file

## Custom Keywords

Custom Python keywords are implemented in `e2etests/resources/Utils.py` and imported in Robot Framework test suites.

## Screenshots

Screenshots are saved automatically on test failure and can be found in the project root as `selenium-screenshot-*.png`.

## Notes

- Make sure you have the correct version of ChromeDriver or GeckoDriver installed and available in your PATH for Selenium tests.
- Update variables and locators as needed for your application under test.

---

Happy Testing!
