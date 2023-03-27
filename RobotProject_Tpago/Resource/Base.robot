# DOCUMENTACION: Automatizacion de pruebas para la aplicacion web de Tpago empresa BANCARD S.A.
# TESTER: Miguel Angel Esquivel Rios

*** Settings ***

Library             SeleniumLibrary

*** Variables ***

${url}=             https://temp.bancard.com.py:9443/                             #URL Pagina de inicio
${url1}=            https://temp.bancard.com.py:9443/users/new                    #URL de Registro de usuario
${url2}=            https://desa.infonet.com.py:8092/auth/users/forgot-password   #URL de Reseteo de contraseña
${url3}=            https://temp.bancard.com.py:9443/sessions/new                 #URL Inicio de sesion
${url4}=            https://desa.infonet.com.py:8035/sessions/new?redirect_to=https%3A%2F%2Fdesa.infonet.com.py%3A8035%2Ftpago    #URL Portal de comercios
${navegador}=       chrome

#Correos
${Puser}=            carlos.villalba@bancard.com.py
${Ppass}=            bancard2022
${Tpuser}=           c.villalbabalon@gmail.com        #
${TPpass}=           bancard2023                      #bancard2022
${Tpuser1}=          nahuelito0406@gmail.com
${TPpass1}=          bancard2022


#Tarjetas
${TCcard}       4066994310463630          #4231990000181342
${TCvec}        1127                      #1123
${TCcvv}        643                       #657
${TCcard1}      4043840000340430
${TCvec1}       0124
${TCcvv1}       816


*** Keywords ***

Pagina de inicio
    Open Browser                         ${url}     ${navegador}
    Maximize browser window

Pagina de registro
    Open Browser                         ${url1}     ${navegador}
    Maximize browser window

Pagina de reseteo
    Open Browser                         ${url2}     ${navegador}
    Maximize browser window
    #Title should be                      Bancard, Portal de Autenticación

Pagina de logeo
    Open Browser                         ${url3}     ${navegador}
    Maximize browser window
    Title should be                      Tpago

Pagina del Portal de comercio
    Open Browser                         ${url4}     ${navegador}
    Maximize browser window
    title should be                      Bancard, Portal de Comercios

# Validacion de registro de usuario

Mensaje alerta Nombre
    [Arguments]                     ${mensagem_esperada}
    ${mensagem}=                    Get webElement           //div[contains(text(),'Tu nombre solo puede contener letras')]
    Should Contain                  ${mensagem.text}         ${mensagem_esperada}

Mensaje alerta Apellido
    [Arguments]                     ${mensagem_esperada}
    ${mensagem}=                    Get webElement           //div[contains(text(),'Tu apellido solo puede contener letras')]
    Should Contain                  ${mensagem.text}         ${mensagem_esperada}

Mensaje alerta Cedula
    [Arguments]                     ${mensagem_esperada}
    ${mensagem}=                    Get webElement           //div[contains(text(),'El formato de la cédula ingresada es incorrecto')]
    Should Contain                  ${mensagem.text}         ${mensagem_esperada}

Mensaje Alerta Celular
    [Arguments]                     ${mensagem_esperada}
    ${mensagem}=                    Get webElement           //div[contains(text(),'El numero de teléfono solo puede contener números')]
    Should Contain                  ${mensagem.text}         ${mensagem_esperada}

Mensaje Alerta Correo
    [Arguments]                     ${mensagem_esperada}
    ${mensagem}=                    Get webElement           //div[contains(text(),'Detectamos que el email ingresado ya se encuentra ')]
    Should Contain                  ${mensagem.text}         ${mensagem_esperada}

Mensaje Alerta Contraseña
    [Arguments]                     ${mensagem_esperada}
    ${mensagem}=                    Get webElement           //div[contains(text(),'Las contraseñas no coinciden')]
    Should Contain                  ${mensagem.text}         ${mensagem_esperada}

Mensaje Registro exitoso
    [Arguments]                     ${mensagem_esperada}
    ${mensagem}=                    Get webElement           //a[contains(text(),'Verificar')]
    Should Contain                  ${mensagem.text}         ${mensagem_esperada}

# Validacion de reseteo de contraseña de usuario

Correo no ingresado
    [Arguments]                     ${mensagem_esperada}
    ${mensagem}=                    Get webElement           //div[contains(text(),'No se encontró un usuario para el email ingresado.')]
    Should Contain                  ${mensagem.text}         ${mensagem_esperada}

Correo no existe
    [Arguments]                     ${mensagem_esperada}
    ${mensagem}=                    Get webElement           //div[contains(text(),'No se ha encontrado un usuario con este mail.')]
    Should Contain                  ${mensagem.text}         ${mensagem_esperada}

Reseteo exitoso
    [Arguments]                     ${mensagem_esperada}
    ${mensagem}=                    Get webElement           //div[contains(text(),'Se te envió un mail a tu cuenta para actualizar tu')]
    Should Contain                  ${mensagem.text}         ${mensagem_esperada}

 # Validacion el inicio de sesion

Credenciales inválidas
    [Arguments]                     ${mensagem_esperada}
    ${mensagem}=                    Get webElement           //div[contains(text(),'No existe un usuario con el email ingresado')]
    Should Contain                  ${mensagem.text}         ${mensagem_esperada}

Usuario no activo
    [Arguments]                     ${mensagem_esperada}
    ${mensagem}=                    Get webElement           //div[contains(text(),'El usuario ingresado aun no ha sido activado')]
    Should Contain                  ${mensagem.text}         ${mensagem_esperada}

Secreta
    [Arguments]                     ${full_name}
    Page Should Contain            ¡Hola ${full_name}!

# Validacion de tarjetas

Mensaje - No pudimos agregar tu tarjeta
    [Arguments]                     ${mensagem_esperada}
    ${mensagem}=                    Get webElement           //div[@class='text-lg mr-2 font-bold text-center'][contains(.,'No pudimos agregar')]
    Should Contain                  ${mensagem.text}         ${mensagem_esperada}

Mensaje - Agregar tu tarjeta
    [Arguments]                     ${mensagem_esperada}
    ${mensagem}=                    Get webElement           //div[@class='text-lg mr-2 font-bold text-center'][contains(.,'¡Agregamos')]
    Should Contain                  ${mensagem.text}         ${mensagem_esperada}

Mensaje - Pago Erroneo
    [Arguments]                     ${mesagem_esperada}
    ${mensagem}=                    Get WebElement          <div class="text-lg mr-2 font-bold text-center" xpath="1">Ocurrió un error<br> al procesar tu compra</div>
    Should Contain                  ${mensagem.text}         ${mensagem_esperada}

Mensaje - Pago Exitoso
     [Arguments]                     ${mesagem_esperada}
    ${mensagem}=                    Get WebElement
    Should Contain                  ${mensagem.text}         ${mensagem_esperada}

Crear Link - Tipo Monto
        Pagina del Portal de comercio
        input text                 id=email     ${Puser}
        input text                 id=password  ${Ppass}
        execute javascript         window.scrollTo(0,100)
        click element              //button[@id='basic-login-button']
        sleep   8
        execute javascript         window.scrollTo(0,100)
        sleep   2
        click element              //a[@id='payment_link']
        sleep   1
        input text                 id=amount-payment-link           157000
        sleep   1
        input text                 id=description-payment-link   Remera oficial de OLIMPIA
        sleep   1
        click button               //button[contains(text(),'Crear')]
        sleep   5
        execute javascript         window.scrollTo(0,200)
        sleep   2
        ${link}=                     Get Value               id=payment-link-url
        go to                       ${link}
        maximize browser window

