*** Settings ***
Documentation                                           test suite for april 2022 testers
Library                                                 SeleniumLibrary
Resource                                                testPracticeabcVariable.robot
Suite Setup                                             Navigate to login page
Resource                                                testPracticeabcKeyword.robot
#Suite Teardown                                         Close All Browsers
Library                                                 FakerLibrary


*** Test Cases ***
User should be able to create account
                        Enter email for new user and navigate to the information page
                        Select new user gender
                        Enter new user firstname
                        Enter new user lastname
                        Enter new user password             testing
                        Enter new user birth in days, months and years
                        Select newsletter and special offers boxes
                        Enter new user address and city
                        Select new user state and enter postal code
                        Enter new user phone number, address alias, click register button and assert account is created
                        [Teardown]   Sign out and close all browsers
