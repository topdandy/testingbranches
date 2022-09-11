*** Settings ***
Documentation                                           test suite for april 2022 testers
Library                                                 SeleniumLibrary
Resource                                                testPracticeabcVariable.robot
Suite Setup                                             Navigate to login page
Resource                                                testPracticeabcKeyword.robot
Suite Teardown                                          Close All Browsers


*** Test Cases ***
Check homepage for logo

Check homepage for automation practice website

User should be able to login with valid credentials
                [Tags]                                  sulaimon
                Customer Login                          ${USERNAME}             ${PASSWORD}

User should be able to retrieve password
                [Tags]                                  sulaimon1
                Retrieve User Password                  ${USERNAME}


Invalid Login
                [Template]      Login with invalid credentials should return the correct message
                #username                               password                                errormessage
                iwa@gmail.com                           testing                                 Authentication failed
                iwa+55@gmail.com                        test                                    Invalid password
                ${EMPTY}                                testing                                 An email address required
                iwa+55@gmail.com                        ${EMPTY}                                Password is required
                ${EMPTY}                                ${EMPTY}                                An email address required


*** Keywords ***
Login with invalid credentials should return the correct message
                [Arguments]                             ${username}                    ${password}                ${errormessage}
                Input Text                              ${USER_EMAIL_FIELD}            ${username}
                Input Text                              ${USER_PASSWORD_FIELD}         ${password}
                Click Element                           ${USER_SIGNIN_SUBMIT_BUTTON}
                Page Should Contain                     ${errormessage}










