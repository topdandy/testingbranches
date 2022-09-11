*** Settings ***
Documentation                                   test practice variable april 2022


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
${BACK_TO_LOGIN}                                        xpath://*[@id="center_column"]/ul/li/a/span
${USERNAME}                                             ${EMPTY}
${PASSWORD}                                             ${EMPTY}
${CREATENEWUSER_EMAILFIELD}                             id:email_create
${CREATENEWUSER_CREATEACCT_BUTTON}                      id:SubmitCreate
${CREATENEWUSER_GENDERBUTTON}                           id:id_gender2
${CREATENEWUSER_FIRSTNAME}                              id:customer_firstname
${CREATENEWUSER_LASTNAME}                               id:customer_lastname
${CREATENEWUSER_PASSWORD}                               id:passwd
${CREATENEWUSER_DOB_DAYS}                               id:days
${CREATENEWUSER_DOB_MONTHS}                             id:months
${CREATENEWUSER_DOB_YEARS}                              id:years
${CREATENEWUSER_NEWSLETTER_BUTTON}                      id:newsletter
${CREATENEWUSER_SPECIALOFFERS_BUTTON}                   id:optin
${CREATENEWUSER_ADDRESS}                                id:address1
${CREATENEWUSER_CITY}                                   id:city
${CREATENEWUSER_STATE}                                  id:id_state
${CREATENEWUSER_POSTALCODE}                             id:postcode
${CREATENEWUSER_MOBILEPHONE}                            id:phone_mobile
${CREATENEWUSER_ADDRESS_ALIAS}                          id:alias
${CREATENEWUSER_REGISTER_BUTTON}                        xpath://*[@id="submitAccount"]/span

