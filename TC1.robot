*** Settings ***
Documentation      Tests related to Login Scenarios
Library            SeleniumLibrary
Resource           MyTest_Keywords.robot
Suite Setup        Navigate to Home Page

*** Test Cases ***
Valid Login
   [Tags]  Ebou
   #Navigate to Home Page
   Enter login credentials and click on the signin button   amieocolley@gmail.com  Jalato@12
   Wait Until Page Contains  ${LOGIN_SUCCESS_MESSAGE}  50s
   #Capture Page Screenshot

 Verify that access is denied when login credentials are not correct
    [Template]  Invalid login credentials should not allow the user to login

     amieocolley@gmail.com      Jalato@4      ${LOGIN_SUCCESS_MESSAGE}
     amieocolle@gmail.com       Jalato@12      ${LOGIN_SUCCESS_MESSAGE}
     amieocolle@gmail.com       Jalato@12      ${LOGIN_SUCCESS_MESSAGE}
     ${EMPTY}                   Jalato@12     ${LOGIN_SUCCESS_MESSAGE}
     ${EMPTY}                   ${EMPTY}      ${LOGIN_SUCCESS_MESSAGE}


*** Keywords ***
Invalid login credentials should not allow the user to login
    [Arguments]   ${username}   ${password}  ${sucessMessage}
    Open Browser  ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element  ${HOMEPAGE_SIGNIN_LINK}
    Input Text  ${LOGIN_USERNAME_FIELD}   ${username}
    Input Text  ${LOGIN_PASSWORD_FIELD}   ${password}
    Click Element  ${SIGNIN_BUTTON}
    Page should not contain  ${sucessMessage} 50s
    Close Browser

