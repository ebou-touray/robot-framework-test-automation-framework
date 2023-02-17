*** Settings ***
Documentation      Tests related to Login Scenarios
Library            SeleniumLibrary

*** Variables ***
${URL}  https://magento.softwaretestingboard.com
${BROWSER}  chrome
${HOMEPAGE_SIGNIN_LINK}  class:authorization-link
${LOGIN_USERNAME_FIELD}   name:login[username]
${LOGIN_PASSWORD_FIELD}   id:pass
${SIGNIN_BUTTON}   id:send2
${LOGIN_SUCCESS_MESSAGE}   Welcome, David Zoe!
${USERNAME}  ${EMPTY}
${PASSWORD}  ${EMPTY}

*** Test Cases ***
Valid Login
   [Tags]  Ebou
   Open Browser  ${URL}   ${BROWSER}
   Maximize Browser Window
   Click Element  ${HOMEPAGE_SIGNIN_LINK}
   Input Text  ${LOGIN_USERNAME_FIELD}  ${USERNAME}
   Input Text  ${LOGIN_PASSWORD_FIELD}  ${PASSWORD}
   Click Element  ${SIGNIN_BUTTON}
   Wait Until Page Contains  ${LOGIN_SUCCESS_MESSAGE}  50s
   #Capture Page Screenshot

 Verify that access is denied when login credentials are not correct
    [Template]  Invalid login credentials should not allow the user to login

     davidzoe@gmail.com     Testing123      ${LOGIN_SUCCESS_MESSAGE}
     davidzo@gmail.com      Testing123!     ${LOGIN_SUCCESS_MESSAGE}
     davidzoe@gmail.com     Testing123      ${LOGIN_SUCCESS_MESSAGE}
     ${EMPTY}               Testing 123!    ${LOGIN_SUCCESS_MESSAGE}
     ${EMPTY}               ${EMPTY}        ${LOGIN_SUCCESS_MESSAGE}


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

