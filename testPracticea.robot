*** Settings ***
Documentation                                           test suite for april 2022 testers
Library                                                 SeleniumLibrary

*** Test Cases ***
Check homepage for logo
                Open Browser                            http://automationpractice.com/index.php         chrome
                Maximize Browser Window
                Element Should Be Visible               xpath://*[@id="header_logo"]/a/img
                Capture Element Screenshot              xpath://*[@id="header_logo"]/a/img
                [Teardown]                              Close Browser

Check homepage for automation practice website
                #[Tags]                                  sulaimon
                Open Browser                            http://automationpractice.com/index.php         chrome
                Maximize Browser Window
                Element Should Be Visible               xpath://*[@id="editorial_block_center"]/h1
                [Teardown]                              Close Browser

User should be able to login with valid credentials
                Open Browser                            http://automationpractice.com/index.php         chrome
                Maximize Browser Window
                Element Should Be Visible               xpath://*[@id="header_logo"]/a/img
                Click Element                           class:login
                Input Text                              name:email              iwa+55@gmail.com
                Input Text                              name:passwd             testing
                Click Element                           xpath://*[@id="SubmitLogin"]/span
                Page Should Contain                     Sign out
                [Teardown]                              Close Browser

User should be able to retrieve password
                Open Browser                            http://automationpractice.com/index.php         chrome
                Maximize Browser Window
                Element Should Be Visible               xpath://*[@id="header_logo"]/a/img
                Click Element                           class:login
                Click Element                           xpath://*[@id="login_form"]/div/p[1]/a
                Input Text                              id:email        iwa+55@gmail.com
                Click Element                           xpath://*[@id="form_forgotpassword"]/fieldset/p/button/span
                Page Should Contain                     A confirmation email has been sent to your address: iwa+55@gmail.com
                [Teardown]                              Close Browser