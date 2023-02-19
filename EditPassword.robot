*** Settings ***
Documentation    Test to Change Password
Library          SeleniumLibrary
Resource         MyTest_Keywords.robot
Suite Setup      Precondition for New User Account

*** Test Cases ***
Verify that a user can change the password
   [Setup]    Precondition for New User Account
   [Tags]  Password
   Enter login credentials and click on the signin button   amieocolley@gmail.com  Jalato@12
   Wait Until Page Contains  ${LOGIN_SUCCESS_MESSAGE}  50s

   Edit Account Information Change Password  Jalato@12  Jalatato@123   Jalato@123