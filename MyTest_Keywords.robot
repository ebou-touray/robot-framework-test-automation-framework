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

# Change password variables
${EDIT}     xpath://*[@id="maincontent"]/div[2]/div[1]/div[3]/div[2]/div[1]/div[2]/a[1]
${CHANGE_PASSWORD}     name:change_password
${CURRENT_PASSWORD}    id:current-password
${NEW_PASSWORD}    name:password
${CONFIRM_NEW_PASSWORD}   id:password-confirmation
${BOTTON_SAVE}      xpath://*[@id="form-validate"]/div/div[1]/button/span

*** Keywords ***
Navigate to Home Page
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window

Precondition for New User Account
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window
    Click Element  ${CREATE_NEW_ACCOUNT_LINK}

Enter login credentials and click on the signin button
    [Arguments]  ${username}    ${password}
    Click Element   ${HOMEPAGE_SIGNIN_LINK}
    Input Text  ${LOGIN_USERNAME_FIELD}  ${username}
    Input Text  ${LOGIN_PASSWORD_FIELD}  ${password}
    Click Element   ${SIGNIN_BUTTON}

Enter required details for new user
    Enter new user firstname
    Enter new user lastname
    Enter email for creating new user
    Input Text  ${CREATE_ACCOUNT_PASSWORD_FIELD}  Testing123!
    Input Text  ${CONFIRMATION_PASSWORD_FIELD}  Testing123!

Enter required details for new user and omit firstname
    Enter new user lastname
    Enter email for creating new user
    Input Text  ${CREATE_ACCOUNT_PASSWORD_FIELD}  Testing123!
    Input Text  ${CONFIRMATION_PASSWORD_FIELD}  Testing123!
    Click Element   ${CREATE_ACCOUNT_BUTTON}

Enter details for new user and omit required fields
    [Arguments]   ${firstname}   ${lastname}     ${email}     ${password}    ${confirm-password}
    Input Text  ${CREATE_ACCOUNT_FIRSTNAME_FIELD}     ${firstname}
    Input Text  ${CREATE_ACCOUNT_LASTNAME_FIELD}      ${lastname}
    Input Text  ${CREATE_ACCOUNT_EMAIL_FIELD}     ${email}
    Input Text  ${CREATE_ACCOUNT_PASSWORD_FIELD}   ${password}
    Input Text  ${CONFIRMATION_PASSWORD_FIELD}    ${confirm-password}
    Click Element   ${CREATE_ACCOUNT_BUTTON}

Logout new user and go to create account page
    Click Element   xpath://div[@aria-hidden='false']//a[normalize-space()='Sign Out']
    Wait Until Element is Enabled   class:authrorization-link
    Click Element   class:authorization-link
    Click Element  ${CREATE_NEW_ACCOUNT_LINK}


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






#Change password elements
Edit Account Information Change Password
    [Arguments]  ${current-Password}  ${new-password}  ${confirm-new-password}
    click element   ${EDIT}
    Click Element   ${CHANGE_PASSWORD}
    Wait Until Page Contains    Change Password
    Input Text   ${CURRENT_PASSWORD}   Jalato@12
    Input Text  ${NEW_PASSWORD}   Jalato@123
    Input Text   ${CONFIRM_NEW_PASSWORD}   Jalato@123
    Click Element    ${BOTTON_SAVE}



