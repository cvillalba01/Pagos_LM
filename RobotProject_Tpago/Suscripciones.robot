*** Settings ***
Library         SeleniumLibrary
*** Variables ***
*** Test Cases ***
Test006 - Suscripcion Ilimitada
            [Tags]                          Test006 - Suscripcion Exitosa
            Open Browser                    https://desa.infonet.com.py:8035/sessions/new?redirect_to=https%3A%2F%2Fdesa.infonet.com.py%3A8035%2Ftpago        chrome
            maximize browser window
            sleep                           1
            input text                      //input[@id='email']        carlos.villalba@bancard.com.py
            input text                      //input[@id='password']     bancard2022
            Execute Javascript              window.scrollTo(0,200)
            sleep                           1
            click element                   //div[@id='basic-login-text']
            sleep                           3
            execute javascript              window.scrollTo(0,200)
            sleep                           2
            click element                   //a[@id='subscriptions']
            sleep                           3
            click element                   //a[contains(text(),'Nueva suscripción')]
            sleep                           1
            click element                   //input[@id='one_subscriber_0']
            Execute Javascript              window.scrollTo(0,200)
            input text                      //input[@id='description']              PruebaAuto
            Execute Javascript              window.scrollTo(0,200)
            sleep                           1
            input text                      //input[@id='amount']                   123
            sleep                           2
            Execute Javascript              window.scrollTo(0,200)
            sleep                           2
            click element                   //input[@id='subscription_limit_1']
            sleep                           1
            Execute Javascript              window.scrollTo(0,200)
            sleep                           2
            select from list by label       Día de cobro       3
            sleep                           3
            Execute Javascript              window.scrollTo(0,200)
            click element                   //button[contains(text(),'CREAR SUSCRIPCIÓN')]
            sleep                           2
Test006 - Suscripcion Limitada

*** Keywords ***