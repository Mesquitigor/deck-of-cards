*** Settings ***
Documentation               Esse arquivo contém os steps da API pública Deck of Cards
Resource                    ../services.robot

*** Keywords ***
Dado que eu faça a criação de um deck parcial
    ${response}             GET on Session                      ${alias}               url=${baseurl}new/shuffle/?cards=AS,2S,KS,AD,2D,KD,AC,2C,KC,AH,2H,KH
    Set Test Variable       ${response}

Dado que eu faça a criação de um deck parcial com uma(s) carta(s) de mais de dois dígitos
    ${response}             GET on Session                      ${alias}               url=${baseurl}new/shuffle/?cards=ASP,2S,KS,AD,2D,KD,AC,2C,KC,AH,2H,KH             expected_status=404
    Set Test Variable       ${response}

Dado que eu faça a criação de um deck parcial com uma(s) carta(s) com letra minúscula
    ${response}             GET on Session                      ${alias}               url=${baseurl}new/shuffle/?cards=As,2S,KS,AD,2D,KD,AC,2C,KC,AH,2H,KH             expected_status=404
    Set Test Variable       ${response}

Então devo ter sucesso nas respostas dos campos da requisição de deck parcial
    Should Be Equal         ${response.json()['success']}      ${True}
    Length Should Be        ${response.json()['deck_id']}      12
    Status Should Be        200                                ${response}

E pegar o valor do campo deck_id_partial
    ${deck_id_parcial}          Get Value From Json                 ${response.json()}      $.deck_id
    Set Test Variable       ${deck_id_parcial}

