*** Settings ***
Documentation                                               Keywords for test practice april 2022 testers
Library                                                     SeleniumLibrary
Resource                                                    testPracticeabcVariable.robot
Library                                                     FakerLibrary


*** Keywords ***
Navigate to login page
                Open Browser                            ${URL}           ${BROWSER}
                Maximize Browser Window
                Element Should Be Visible               ${HOMEPAGE_LOGO}
                Click Element                           ${HOMEPAGE_LOGIN}
                               
Customer Login
                [Arguments]                             {username}        {password}
                Input Text                              ${USER_EMAIL_FIELD}             {username}
                Input Text                              ${USER_PASSWORD_FIELD}          {password}
                Click Element                           ${USER_SIGNIN_SUBMIT_BUTTON}
                Page Should Contain                     Sign out
                Click Element                           ${SIGN_OUT_BUTTON}

Retrieve User Password
                [Arguments]         {user_email}
                Click Element                           ${FORGOT_PASSWORD_LINK}
                Input Text                              ${USER_EMAIL_FIELD}        {user_email}
                Click Element                           ${RETRIVE_PASSWORD_BUTTON}
                Page Should Contain                     ${RETRIEVE_PASSWORD_SUCCESS_MESSAGE}
                Click Element                           ${BACK_TO_LOGIN}
                
Enter email for new user and navigate to the information page
                ${emails}=      Fakerlibrary.email
                log   ${emails}
                Set Test Variable   ${emails}
                Wait Until Element Is Visible           ${CREATENEWUSER_EMAILFIELD}
                Input Text                              ${CREATENEWUSER_EMAILFIELD}            ${emails}
                Wait Until Element Is Visible           ${CREATENEWUSER_CREATEACCT_BUTTON}
                Click Element                           ${CREATENEWUSER_CREATEACCT_BUTTON}
                
Select new user gender
                Sleep    5
                #Wait Until Element Is Visible           ${CREATENEWUSER_GENDERBUTTON}
                Click Element                           ${CREATENEWUSER_GENDERBUTTON}
                
Enter new user firstname
                ${firstname}=      Fakerlibrary.firstname
                log   ${firstname}
                Set Test Variable  ${firstname}
                Wait Until Element Is Visible           ${CREATENEWUSER_FIRSTNAME}
                Input Text                              ${CREATENEWUSER_FIRSTNAME}              ${firstname}
                
Enter new user lastname
                ${lastname}=      Fakerlibrary.lastname
                log   ${lastname}
                Set Test Variable  ${lastname}
                Wait Until Element Is Visible           ${CREATENEWUSER_LASTNAME}
                Input Text                              ${CREATENEWUSER_LASTNAME}               ${lastname}
                
Enter new user password
                [Arguments]         ${password}
                Sleep    5
                #Wait Until Element Is Visible           ${CREATENEWUSER_PASSWORD}
                Input Text                              ${CREATENEWUSER_PASSWORD}              ${password}

Enter new user birth in days, months and years
                Sleep    5
                #Wait Until Element Is Visible           ${CREATENEWUSER_DOB_DAYS}
                Select From List By Index               ${CREATENEWUSER_DOB_DAYS}               10
                Sleep    5
                #Wait Until Element Is Visible           ${CREATENEWUSER_DOB_MONTHS}
                Select From List By Index               ${CREATENEWUSER_DOB_MONTHS}             12
                Sleep    5
                #Wait Until Element Is Visible           ${CREATENEWUSER_DOB_YEARS}
                Select From List By Value               ${CREATENEWUSER_DOB_YEARS}              1990
                
Select newsletter and special offers boxes
                Sleep    5
                #Wait Until Element Is Visible           ${CREATENEWUSER_NEWSLETTER_BUTTON}
                Select Checkbox                         ${CREATENEWUSER_NEWSLETTER_BUTTON}
                Sleep    5
                #Wait Until Element Is Visible           ${CREATENEWUSER_SPECIALOFFERS_BUTTON}
                Select Checkbox                         ${CREATENEWUSER_SPECIALOFFERS_BUTTON}
                
Enter new user address and city
                Sleep    5
                #Wait Until Element Is Visible           ${CREATENEWUSER_ADDRESS}
                Input Text                              ${CREATENEWUSER_ADDRESS}                20 Williams Street
                Sleep    5
                #Wait Until Element Is Visible           ${CREATENEWUSER_CITY}
                Input Text                              ${CREATENEWUSER_CITY}                   Chicago
                
Select new user state and enter postal code
                Sleep    5
                #Wait Until Element Is Visible           ${CREATENEWUSER_STATE}
                Select From List By Index               ${CREATENEWUSER_STATE}                  14
                Sleep    5
                #Wait Until Element Is Visible           ${CREATENEWUSER_POSTALCODE}
                Input Text                              ${CREATENEWUSER_POSTALCODE}             00000
                
Enter new user phone number, address alias, click register button and assert account is created
                Sleep    5
                #Wait Until Element Is Visible           ${CREATENEWUSER_MOBILEPHONE}
                Input Text                              ${CREATENEWUSER_MOBILEPHONE}            120220631
                Sleep    5
                #Wait Until Element Is Visible           ${CREATENEWUSER_ADDRESS_ALIAS}
                Input Text                              ${CREATENEWUSER_ADDRESS_ALIAS}          QA House
                Sleep    5
                #Wait Until Element Is Visible           ${CREATENEWUSER_REGISTER_BUTTON}
                Click Element                           ${CREATENEWUSER_REGISTER_BUTTON} 
                Page Should Contain                     Sign out            
                                                     
Sign out and close all browsers
                Sleep    5
                Wait Until Element Is Visible          class:logout
                Click Element                          class:logout
                Close All Browsers
                cap
                                      