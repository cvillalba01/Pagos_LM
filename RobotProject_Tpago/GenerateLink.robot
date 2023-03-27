# DOCUMENTACION: Automatizacion de pruebas para la aplicacion web de Tpago empresa BANCARD S.A.
# TESTER: Carlos Nahuel Villalba Patiño


*** Settings ***

Documentation         Prueba externa generacion de link desde el Portal de Comercios
Library               SeleniumLibrary
Resource              ./Resource/Base.robot
Library                 String
Library                 XML




*** Variables ***


#${navegador}=       chrome

*** Test Cases ***
Test006 - Pago User Logueado

        [Tags]    Test uno
        Pagina del Portal de comercio
        input text                 id=email     ${userp}
        input text                 id=password  ${passp}
        execute javascript         window.scrollTo(0,100)
        click element              //button[@id='basic-login-button']
        sleep   8
        execute javascript         window.scrollTo(0,100)
        sleep   2
        click element              //a[@id='payment_link']
        sleep   1
        input text                 id=amount-payment-link     150000
        sleep   1
        input text                 id=description-payment-link   Remera oficial de OLIMPIA
        sleep   1
        click button               //button[contains(text(),'Crear')]
        sleep   5
        execute javascript         window.scrollTo(0,200)
        sleep   2
        ${link}=                     Get Value               id=payment-link-url
        open browser                  ${link}       chrome
        maximize browser window
        sleep                         3
        click element                 //input[@id='payment_method_3']
        sleep                         3
        click element                 //body/main[1]/div[1]/div[1]/div[1]/form[1]/div[3]/input[1]
        sleep                         3
        input text                    //input[@id='email']          ${TPuser}
        input text                    //input[@id='password']       ${TPpass}
        sleep                         1
        click element                 //body/main[1]/div[1]/form[1]/div[1]/div[5]/input[1]
        sleep                         3
        click element                 //input[@id='payment_method_1']
        sleep                         1
        execute javascript            window.scrollTo(0,200)
        sleep                         2
        click element                 //body/main[1]/div[1]/div[1]/div[1]/form[1]/div[3]/input[1]
        sleep                         3
        click element                 //input[@id='user_card_id_85']
        sleep                         1
        click element                 //body/main[1]/div[1]/form[1]/div[2]/input[1]
        sleep                         3
        execute javascript            window.scrollTo(0,100)
        sleep                         2
        click element                 //body/main[1]/div[1]/div[4]/form[1]/div[2]/input[1]
        sleep                         10
        close browser

Test 006 - Pago Sin datos de User
        [Tags]    Test uno
        Pagina del Portal de comercio
        input text                 id=email     ${userp}
        input text                 id=password  ${passp}
        execute javascript         window.scrollTo(0,100)
        click element              //button[@id='basic-login-button']
        sleep   8
        execute javascript         window.scrollTo(0,100)
        sleep   2
        click element              //a[@id='payment_link']
        sleep   1
        input text                 id=amount-payment-link     150000
        sleep   1
        input text                 id=description-payment-link   Remera oficial de OLIMPIA
        sleep   1
        Execute Javascript         window.scrollTo(0,200)
        sleep   1
        click element              //label[contains(text(),'Solicitar datos del usuario')]
        click button               //button[contains(text(),'Crear')]
        sleep   5
        execute javascript         window.scrollTo(0,200)
        sleep   2
        ${link}=                     Get Value               id=payment-link-url
        open browser                  ${link}       chrome
        maximize browser window
        sleep    3
        click element               //input[@id='payment_method_2']
        sleep   1
        execute javascript          window.scrollTo(0,100)
        sleep   1
        click element               //body/main[1]/div[1]/div[1]/div[1]/form[1]/div[3]/input[1]
        sleep    3
        execute javascript          window.scrollTo(0,200)
        sleep    1
        input text                  //input[@id='card_pan']             ${card1}
        input text                  //input[@id='expiry']               ${vec1}
        sleep    2
        input text                  //input[@id='cvv']                  ${cvv1}
        sleep    1
        click element               //body/main[1]/div[1]/div[3]/div[2]/form[1]/div[4]/input[1]
        sleep    2
        click element               //button[@id='payment_button']
        sleep    8
        close browser
Test 006 - Pago User Logueado New Card
        [Tags]    Test uno
        Pagina del Portal de comercio
        input text                 id=email     ${userp}
        input text                 id=password  ${passp}
        execute javascript         window.scrollTo(0,100)
        click element              //button[@id='basic-login-button']
        sleep   8
        execute javascript         window.scrollTo(0,100)
        sleep   2
        click element              //a[@id='payment_link']
        sleep   1
        input text                 id=amount-payment-link     150000
        sleep   1
        input text                 id=description-payment-link   Remera oficial de OLIMPIA
        sleep   1
        Execute Javascript         window.scrollTo(0,200)
        sleep   1
        click element              //label[contains(text(),'Solicitar datos del usuario')]
        click button               //button[contains(text(),'Crear')]
        sleep   5
        execute javascript         window.scrollTo(0,200)
        sleep   2
        ${link}=                     Get Value               id=payment-link-url
        open browser                  ${link}       chrome
         maximize browser window
        sleep     3
        click element                 //input[@id='payment_method_3']
        sleep     3
        click element                 //body/main[1]/div[1]/div[1]/div[1]/form[1]/div[3]/input[1]
        sleep     3
        input text                    //input[@id='email']          ${TPuser}
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
        input text                  //input[@id='card_pan']             ${card1}
        input text                  //input[@id='expiry']               ${vec1}
        sleep    2
        input text                  //input[@id='cvv']                  ${cvv1}
        sleep    1
        click element               //body/main[1]/div[1]/div[3]/div[2]/form[1]/div[5]/input[1]
        sleep    2
        click element               //body/main[1]/div[1]/div[3]/div[2]/form[1]/div[5]/input[1]
        sleep    8
        #Mensaje - Pago Erroneo      Ocurrió un error al procesar tu compra
Test 006 - Link con Monto Datos User
 [Tags]    Test uno
        Pagina del Portal de comercio
        input text                 id=email     ${userp}
        input text                 id=password  ${passp}
        execute javascript         window.scrollTo(0,100)
        click element              //button[@id='basic-login-button']
        sleep   8
        execute javascript         window.scrollTo(0,100)
        sleep   2
        click element              //a[@id='payment_link']
        sleep   1
        input text                 id=amount-payment-link     150000
        sleep   1
        input text                 id=description-payment-link   Remera oficial de OLIMPIA
        sleep   1
        Execute Javascript         window.scrollTo(0,200)
        sleep   1
        click element              //label[contains(text(),'Solicitar datos del usuario')]
        click button               //button[contains(text(),'Crear')]
        sleep   5
        execute javascript         window.scrollTo(0,200)
        sleep   2
        ${link}=                     Get Value               id=payment-link-url
        open browser                  ${link}       chrome
        maximize browser window
        sleep     3




        Test001 - Pago Tarjeta Catastrada
        Crear Link - Tipo Monto
        sleep   2
        click element                 //input[@id='payment_method_3']
        sleep                         3
        click element                 //body/main[1]/div[1]/div[1]/div[1]/form[1]/div[3]/input[1]
        sleep                         3
        input text                    //input[@id='email']          ${TPuser}
        input text                    //input[@id='password']       ${TPpass}
        sleep                         1
        click element                 //body/main[1]/div[1]/form[1]/div[1]/div[5]/input[1]
        sleep                         3
        click element                 //input[@id='payment_method_1']
        sleep                         1
        execute javascript            window.scrollTo(0,200)
        sleep                         2
        click element                 //body/main[1]/div[1]/div[1]/div[1]/form[1]/div[3]/input[1]
        sleep                         3
        click element                 //input[@id='user_card_id_85']
        sleep                         1
        click element                 //body/main[1]/div[1]/form[1]/div[2]/input[1]
        sleep                         3
        execute javascript            window.scrollTo(0,100)
        sleep                         2
        click element                 //body/main[1]/div[1]/div[4]/form[1]/div[2]/input[1]
        sleep                         10
        close browser
