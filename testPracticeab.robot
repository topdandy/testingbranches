*** Settings ***
Documentation                                           test suite for april 2022 testers
Library                                                 SeleniumLibrary


*** Variables ***
${URL}                                                  http://automationpractice.com/index.php
${BROWSER}                                              chrome
${HOMEPAGE_LOGO}                                        xpath://*[@id="header_logo"]/a/img
${HOMEPAGE_LOGO_CAPTURE}                                xpath://*[@id="header_logo"]/a/img
${HOMEPAGE_ELEMENT_VISIBLE}                             xpath://*[@id="editorial_block_center"]/h1
${HOMEPAGE_LOGIN}                                       class:login
${USER_EMAIL_FIELD}                                     name:email
${USER_PASSWORD_FIELD}                                  name:passwd
${USER_SIGNIN_SUBMIT_BUTTON}                            id:SubmitLogin
${SIGN_OUT_BUTTON}                                      class:logout
${FORGOT_PASSWORD_LINK}                                 xpath://*[@id="login_form"]/div/p[1]/a
${RETRIVE_PASSWORD_BUTTON}                              xpath://*[@id="form_forgotpassword"]/fieldset/p/button/span
${RETRIEVE_PASSWORD_SUCCESS_MESSAGE}                    A confirmation email has been sent to your address: iwa+55@gmail.com
${USERNAME}                                             ${EMPTY}
${PASSWORD}                                             ${EMPTY}


*** Test Cases ***
Check homepage for logo
                Open Browser                            ${URL}           ${BROWSER}
                Maximize Browser Window
                Element Should Be Visible               ${HOMEPAGE_LOGO}
                #Capture Element Screenshot              ${HOMEPAGE_LOGO_CAPTURE}
                [Teardown]                              Close Browser

Check homepage for automation practice website
                #[Tags]                                 sulaimon
                Open Browser                            ${URL}           ${BROWSER}
                Maximize Browser Window
                Element Should Be Visible               ${HOMEPAGE_ELEMENT_VISIBLE}
                [Teardown]                              Close Browser

User should be able to login with valid credentials
                [Tags]                                 sulaimon
                Open Browser                            ${URL}           ${BROWSER}
                Maximize Browser Window
                Element Should Be Visible               ${HOMEPAGE_LOGO}
                Click Element                           ${HOMEPAGE_LOGIN}
                Input Text                              ${USER_EMAIL_FIELD}            ${USERNAME}
                Input Text                              ${USER_PASSWORD_FIELD}         ${PASSWORD}
                Click Element                           ${USER_SIGNIN_SUBMIT_BUTTON}
                Page Should Contain                     Sign out
                Click Element                           ${SIGN_OUT_BUTTON}
                [Teardown]                              Close Browser

User should be able to retrieve password
                Open Browser                            ${URL}           ${BROWSER}
                Maximize Browser Window
                Element Should Be Visible               ${HOMEPAGE_LOGO}
                Click Element                           ${HOMEPAGE_LOGIN}
                Click Element                           ${FORGOT_PASSWORD_LINK}
                Input Text                              ${USER_EMAIL_FIELD}        iwa+55@gmail.com
                Click Element                           ${RETRIVE_PASSWORD_BUTTON}
                Page Should Contain                     ${RETRIEVE_PASSWORD_SUCCESS_MESSAGE}
                [Teardown]                              Close Browser

Invalid Login
                [Template]      Login with invalid credentials should return the correct message
                #username                                password                                errormessage
                iwa@gmail.com                           testing                                 Authentication failed
                iwa+55@gmail.com                        test                                    Invalid password
                ${EMPTY}                                testing                                 An email address required
                iwa+55@gmail.com                        ${EMPTY}                                Password is required
                ${EMPTY}                                ${EMPTY}                                An email address required


*** Keywords ***
Login with invalid credentials should return the correct message
                [Arguments]                             ${username}                   ${password}                ${errormessage}
                Open Browser                            ${URL}           ${BROWSER}
                Maximize Browser Window
                Click Element                           ${HOMEPAGE_LOGIN}
                Input Text                              ${USER_EMAIL_FIELD}            ${username}
                Input Text                              ${USER_PASSWORD_FIELD}         ${password}
                Click Element                           ${USER_SIGNIN_SUBMIT_BUTTON}
                Page Should Contain                     ${errormessage}




