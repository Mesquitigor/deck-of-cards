*** Settings ***
Documentation               Esse arquivo contém os steps da API pública Deck of Cards
Resource                    ../services.robot

*** Keywords ***
Dado que eu possua um deck
    Dado que eu faça uma requisição GET na API Deck of Cards
    E pegar o valor do campo deck_id
    Length Should Be        ${response.json()['deck_id']}       12

Quando eu misturar este Deck
    ${response}             GET on Session          ${alias}                url=${baseurl}new/shuffle/?deck_count=1
    Set Test Variable       ${response}
    ${deck_id_shuffled}     Get Value From Json     ${response.json()}      $.deck_id
    Set Global Variable     ${deck_id_shuffled}

E verificar que o response tem status "${sc}" e "${s}"
    Status Should Be        ${sc}                   ${response}
    Request Should Be Successful                    ${response}

Então devo ter um deck_id diferente do anterior
    Should Not Be Equal     ${deck_id_new}          ${deck_id_shuffled}    
    
Então não terei sucesso na mistura
    Então não terei sucesso na remistura
