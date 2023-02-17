*** Settings ***
Documentation   Keywords for Luma Project
Library         SeleniumLibrary


*** Variable ***
${URL}  https://magento.softwaretestingboard.com
${BROWSER}  chrome
${HOMEPAGE_SIGNIN_LINK}  class:authorization-link
${LOGIN_USERNAME_FIELD}   name:login[username]
${LOGIN_PASSWORD_FIELD}   id:pass
${SIGNIN_BUTTON}   id:send2
${LOGIN_SUCCESS_MESSAGE}   Welcome, Ebou Touray!
${USERNAME}  ${EMPTY}
${PASSWORD}  ${EMPTY}

*** Keywords ***
Navigate to Home Page
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Winow

 Enter login credentials and click on the signin button
    [Arguments]  ${username}    ${password}
    Click Element   ${HOMEPAGE_SIGNIN_LINK}
    Input Text  ${LOGIN_USERNAME_FIELD}  ${username}
    Input Text  ${LOGIN_PASSWORD_FIELD}     ${password}
    Click Element   ${SIGNIN_BUTTON}