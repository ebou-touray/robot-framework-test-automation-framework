*** Settings ***
Documentation      Tests related to Login Scenarios
Library            SeleniumLibrary
Resource           MyTest_Keywords.robot
*** Test Cases ***
Valid Login
   [Tags]  Ebou
   Navigate to Home Page
   Click Element  ${HOMEPAGE_SIGNIN_LINK}
   Input Text  ${LOGIN_USERNAME_FIELD}  amieocolley@gmail.com
   Input Text  ${LOGIN_PASSWORD_FIELD}  Jalato@1
   Click Element  ${SIGNIN_BUTTON}
   Wait Until Page Contains  ${LOGIN_SUCCESS_MESSAGE}  50s
   #Capture Page Screenshot

 Verify that access is denied when login credentials are not correct
    [Template]  Invalid login credentials should not allow the user to login

     amieocolley@gmail.com      Jalato@4      ${LOGIN_SUCCESS_MESSAGE}
     amieocolle@gmail.com       Jalato@1      ${LOGIN_SUCCESS_MESSAGE}
     amieocolley@gmail.com      Jalato@1      ${LOGIN_SUCCESS_MESSAGE}
     ${EMPTY}                   Jalato@1      ${LOGIN_SUCCESS_MESSAGE}
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

