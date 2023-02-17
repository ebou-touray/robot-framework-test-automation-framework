*** Settings ***
Documentation    Tests related to creating new user account on Luma
Library          SeleniumLibrary
Resource         MyTest_Keywords.robot

*** Test Cases ***
Verify that new user can create a new account
    Navigate to Home Page
     Click the create account link and enter required details for new user
     Click Create account button and assert that user has been created successfully

*** Keywords ***
Provided precondition
    Setup system under test