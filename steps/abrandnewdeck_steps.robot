*** Settings ***
Documentation               Esse arquivo contém os steps da API pública Deck of Cards
Resource                    ../services.robot

*** Keywords ***
Dado que eu faça uma requisição GET na API Deck of Cards
    ${response}             GET on Session                      ${alias}               url=${baseurl}new/
    Set Test Variable       ${response}
    ${remaining}            Get Value From Json                 ${response.json()}      $.remaining
    Set Global Variable     ${remaining}
    Log                     ${remaining}

Dado que eu faça uma requisição GET na API Deck of Cards incorreta
    ${response}             GET on Session                      ${alias}               url=${baseurl}old/        expected_status=404
    Set Test Variable       ${response}
    ${success}            Get Value From Json                 ${response.json()}      $.success
    ${error}            Get Value From Json                 ${response.json()}      $.error
    Set Global Variable     ${success} 
    Set Global Variable     ${error} 
    Log                     ${success} 
    Log                     ${error} 

Quando eu verificar que o response tem status "${sc}" e "${s}"
    Status Should Be        ${sc}       ${response}

Então devo ter sucesso nas respostas dos campos
    Should Be Equal         ${response.json()['success']}      ${True}
    Length Should Be        ${response.json()['deck_id']}      12
    Should Be Equal         ${response.json()['shuffled']}     ${False}
    Log                     ${response.json()}

Então devo ter falha nas respostas dos campos
    Should Be Equal         ${response.json()['success']}      ${false}
    Should Be Equal         ${response.json()['error']}        Deck ID does not exist.
    Log                     ${response.json()}

E pegar o valor do campo deck_id
    ${deck_id_new}          Get Value From Json                 ${response.json()}      $.deck_id
    Set Global Variable     ${deck_id_new}