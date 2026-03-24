*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${URL}        https://www.saucedemo.com/
${USER}       standard_user
${PASSWORD}   secret_sauce

*** Test Cases ***
TC_001_Login_Valido
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=user-name    ${USER}
    Input Password  id=password     ${PASSWORD}
    Click Button    id=login-button
    Page Should Contain    Products
    Close Browser

TC_002_Login_Sin_Datos
    Open Browser    ${URL}    ${BROWSER}
    Click Button    id=login-button
    Page Should Contain    Epic sadface
    Close Browser

TC_003_Login_Solo_Usuario
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=user-name    ${USER}
    Click Button    id=login-button
    Page Should Contain    Epic sadface
    Close Browser

TC_004_Login_Solo_Password
    Open Browser    ${URL}    ${BROWSER}
    Input Password  id=password    ${PASSWORD}
    Click Button    id=login-button
    Page Should Contain    Epic sadface
    Close Browser

TC_005_Ver_Titulo_Pagina
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Swag Labs
    Close Browser

TC_006_Ver_Campos_Login
    Open Browser    ${URL}    ${BROWSER}
    Page Should Contain Element    id=user-name
    Page Should Contain Element    id=password
    Close Browser

TC_007_Ver_Boton_Login
    Open Browser    ${URL}    ${BROWSER}
    Page Should Contain Element    id=login-button
    Close Browser

TC_008_Ver_Productos_Despues_Login
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=user-name    ${USER}
    Input Password  id=password     ${PASSWORD}
    Click Button    id=login-button
    Page Should Contain    Sauce Labs Backpack
    Close Browser

TC_009_Agregar_Producto
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=user-name    ${USER}
    Input Password  id=password     ${PASSWORD}
    Click Button    id=login-button
    Click Button    id=add-to-cart-sauce-labs-backpack
    Page Should Contain Element    class=shopping_cart_badge
    Close Browser

TC_010_Ver_Carrito
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=user-name    ${USER}
    Input Password  id=password     ${PASSWORD}
    Click Button    id=login-button
    Click Element   class=shopping_cart_link
    Page Should Contain    Your Cart
    Close Browser