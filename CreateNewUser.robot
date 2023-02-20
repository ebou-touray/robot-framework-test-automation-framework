*** Settings ***
Documentation    Tests related to creating new user account on Luma
Library          SeleniumLibrary
Resource         MyTest_Keywords.robot
Suite Setup      Precondition for New User Account

*** Test Cases ***
Verify that new user can create a new account
     [Setup]    Precondition for New User Account
     Enter required details for new user
     Click Create account button and assert that user has been created successfully
     [Teardown] close browser

verify that user cannot omit firstname when creating a new account
    [Tags]  NewAccount

    Enter details for new user and omit required fields  ${EMPTY}  Test   amieocolley@gmail.com  Jalato@123  Jalato@123
    Page Should Contain  This is a required field


Verify that user cannot omit lastname when creating a new account
    [Tags]  NewAccount
    reload page
    Enter details for new user and omit required fields  Test  ${empty}  amieocolley@gmail.com  Jalato@123  Jalato@123
    Page Should Contain  This is a required field


Verify that user cannot omit email when creating a new account
    [Tags]  NewAccount
    reload page
    Enter details for new user and omit required fields  Test  Yahoo  ${empty}  Jalato@123  Jalato@123
    Page Should Contain  This is a required field

Verify that user cannot omit password when creating a new account
    [Tags]  NewAccount
    reload page
    Enter details for new user and omit required fields  Test   Yahoo   amieocolley@gmail.com  ${empty}  Jalato@123
    Page Should Contain  This is a required field

