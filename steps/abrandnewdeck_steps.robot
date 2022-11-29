*** Settings ***
Documentation               Esse arquivo contém os steps da API pública Deck of Cards
Resource                    ../services.robot

*** Keywords ***
Dado que eu faça uma requisição GET na API Deck of Cards
    ${response}             GET on Session                      ${alias}               url=${baseurl}new/
    Set Test Variable       ${response}
    ${remaining_brandnew}   Get Value From Json                 ${response.json()}     $.remaining
    Set Global Variable     ${remaining_brandnew}

Dado que eu faça uma requisição GET na API Deck of Cards incorreta
    ${response}             GET on Session                      ${alias}               url=${baseurl}old/                    expected_status=404
    Set Test Variable       ${response}
    ${success}              Get Value From Json                 ${response.json()}      $.success
    ${error}                Get Value From Json                 ${response.json()}      $.error
    Set Test Variable     ${success} 
    Set Test Variable     ${error} 

Quando eu verificar que o response tem status "${sc}" e "${s}"
    Status Should Be        ${sc}       ${response}

Então devo ter sucesso nas respostas dos campos
    Should Be Equal         ${response.json()['success']}      ${True}
    Length Should Be        ${response.json()['deck_id']}      12
    Should Be Equal         ${response.json()['shuffled']}     ${False}

Então devo ter falha nas respostas dos campos
    Should Be Equal         ${response.json()['success']}      ${false}
    Should Be Equal         ${response.json()['error']}        Deck ID does not exist.

E pegar o valor do campo deck_id
    ${deck_id_new}          Get Value From Json                 ${response.json()}      $.deck_id
    Set Test Variable     ${deck_id_new}