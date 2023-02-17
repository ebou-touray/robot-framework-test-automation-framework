*** Settings ***
Documentation   Keywords for Luma Project
Library         SeleniumLibrary
Library         FakerLibrary


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
${CREATE_NEW_ACCOUNT_LINK}   xpath://a[text() = 'Create an Account']
${CREATE_ACCOUNT_FIRSTNAME_FIELD}  id:firstname
${CREATE_ACCOUNT_LASTNAME_FIELD}   id:lastname
${CREATE_ACCOUNT_EMAIL_FIELD}      name:email
${CREATE_ACCOUNT_PASSWORD_FIELD}   id:password
${CONFIRMATION_PASSWORD_FIELD}   id:password-confirmation
${CREATE_ACCOUNT_BUTTON}    xpath://span[text() = 'Create an Account' ]
${LOGGEDIN_USER}




*** Keywords ***
Navigate to Home Page
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window

Enter login credentials and click on the signin button
    [Arguments]  ${username}    ${password}
    Click Element   ${HOMEPAGE_SIGNIN_LINK}
    Input Text  ${LOGIN_USERNAME_FIELD}  ${username}
    Input Text  ${LOGIN_PASSWORD_FIELD}  ${password}
    Click Element   ${SIGNIN_BUTTON}

Click the create account link and enter required details for new user
    Click Element  ${CREATE_NEW_ACCOUNT_LINK}
    Enter new user firstname
    Enter new user lastname
    Enter email for creating new user
    Input Text  ${CREATE_ACCOUNT_PASSWORD_FIELD}  Testing123!
    Input Text  ${CONFIRMATION_PASSWORD_FIELD}  Testing123!


Click Create account button and assert that user has been created successfully
    [Arguments]
    Click Element   ${CREATE_ACCOUNT_BUTTON}
    Wait Until Page Contains    Thank you for registering with Fake Online Clothing Store.

Enter email for creating new user
    ${email}=  FakerLibrary.email
    log  ${email}
    Set Test Variable    ${email}
    Input Text  ${CREATE_ACCOUNT_EMAIL_FIELD}    ${email}

Enter new user firstname
    ${firstname}=  FakerLibrary.Firstname
    log  ${firstname}
    Set Test Variable    ${firstname}
    Input Text  ${CREATE_ACCOUNT_FIRSTNAME_FIELD}     ${firstname}


Enter new user lastname
    ${lastname}=  FakerLibrary.Lastname
    log  ${lastname}
    Set Test Variable    ${lastname}
    Input Text  ${CREATE_ACCOUNT_LASTNAME_FIELD}      ${lastname}



