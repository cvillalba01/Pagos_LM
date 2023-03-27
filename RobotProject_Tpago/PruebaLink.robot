# DOCUMENTACION: Automatizacion de pruebas para la aplicacion web de Tpago empresa BANCARD S.A.
# TESTER: Carlos Nahuel Villalba Patiño


*** Settings ***

Documentation              Prueba externa generacion de link desde el Portal de Comerci
Library                   SeleniumLibrary
Resource                  ./Resource/Base.robot
Library                   String
Library                   XML

*** Variables ***


*** Test Cases ***
Test001 - Pago Directo User logueado
        Crear Link - Tipo Monto
        sleep     3
        click element                 //input[@id='payment_method_3']
        sleep     3
        click element                 //body/main[1]/div[1]/div[1]/div[1]/form[1]/div[3]/input[1]
        sleep     3
        input text                    //input[@id='email']          ${Tpuser}
        input text                    //input[@id='password']       ${TPpass}
         sleep    1
        click element                 //body/main[1]/div[1]/form[1]/div[1]/div[5]/input[1]
        sleep     3
        click element                 //input[@id='payment_method_2']
        sleep     1
        click element                 //body/main[1]/div[1]/div[1]/div[1]/form[1]/div[3]/input[1]
        sleep     3
        execute javascript             window.scrollTo(0,200)
        sleep    1
        input text                  //input[@id='card_pan']             ${TCcard}
        input text                  //input[@id='expiry']               ${TCvec}
        sleep    2
        input text                  //input[@id='cvv']                  ${TCcvv}
        sleep    1
        execute javascript           window.scrollTo(0,200)
        sleep    2
        click element               //body/main[1]/div[1]/div[3]/div[2]/form[1]/div[5]/input[1]
        sleep    2
        click element               //button[@id='payment_button']
        sleep    10
        close browser

Test001 - Pago Directo_DatosUser
        Crear Link - Tipo Monto
        sleep    3
        click element           //input[@id='payment_method_2']
        sleep    2
        click element           //body/main[1]/div[1]/div[1]/div[1]/form[1]/div[3]/input[1]
        sleep    3
        input text              //input[@id='payer_name']                   Nahuel
        input text              //input[@id='payer_lastname']               villalba
        input text              //input[@id='payer_email']                  cvillalba@bancard.com.py
        execute javascript      window.scrollTo     (0,100)
        sleep    2
        click element           //body/main[1]/div[1]/form[1]/div[7]/input[1]
        sleep    2
        input text                  //input[@id='card_pan']             ${TCcard1}
        input text                  //input[@id='expiry']               ${TCvec1}
        sleep    2
        input text                  //input[@id='cvv']                  ${TCcvv1}
        sleep    1
        execute javascript           window.scrollTo(0,200)
        sleep    2
        click element                //body/main[1]/div[1]/div[3]/div[2]/form[1]/div[4]/input[1]
        sleep    3
        click element                //button[@id='payment_button']
        sleep    8
        close browser
