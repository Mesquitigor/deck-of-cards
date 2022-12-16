*** Settings ***
Documentation               Esse arquivo contém os steps da API pública Deck of Cards
Resource                    ../services.robot

*** Keywords ***
#CT-01
E retirar uma quantidade de "${numero_de_cartas_pilha}" carta(s) da pilha
    ${response}             GET on Session          ${alias}                 url=${baseurl}${deck_id_new}/pile/${pile_name1}/draw/?cards=${cards_to_add}
    Set Test Variable       ${response}
    Set Global Variable     ${numero_de_cartas_pilha}

Então eu terei a mesma quantidade de cartas na retirada da pilha
    ${numero_de_cartas}     Convert To Integer      ${numero_de_cartas_pilha}
    ${length}=              Get Length              ${response.json()['cards']}
    Should Be Equal         ${numero_de_cartas}     ${length}

#CT-02
E retirar uma carta do início da pilha
    ${response}             GET on Session          ${alias}                 url=${baseurl}${deck_id_new}/pile/${pile_name1}/draw//bottom/
    Set Test Variable       ${response}
    Set Test Variable       ${numero_de_cartas_pilha}    1

E a carta retirada será a primeira da pilha
    ${first_card}           Get Substring           ${cards_to_add}          0    2
    Should Be Equal         ${response.json()['cards'][0]['code']}           ${first_card}

#CT-03
E retirar uma quantidade específica de "${numero_de_cartas_pilha}" carta(s) da pilha
    ${response}             GET on Session          ${alias}                 url=${baseurl}${deck_id_new}/pile/${pile_name1}/draw/?count=${numero_de_cartas_pilha}
    Set Test Variable       ${response}
    Set Global Variable     ${numero_de_cartas_pilha}

#CT-04
E retirar "${number_of_cards}" cartas do início da pilha
    ${response}             GET on Session          ${alias}                 url=${baseurl}${deck_id_new}/pile/${pile_name1}/draw//bottom/?count=${number_of_cards}
    Set Test Variable       ${response}

E as cartas retiradas serão as "${number_of_cards}" primeiras da pilha
    ${first_card}           Get Substring           ${cards_to_add}          0    ${number_of_cards}
    Should Be Equal         ${response.json()['cards'][0]['code']}           ${first_card}

#CT-05
E retirar uma carta de local aleatório da pilha
    ${response}             GET on Session          ${alias}                 url=${baseurl}${deck_id_new}/pile/${pile_name1}/draw/random
    Set Test Variable       ${response}

Então devo ter sucesso nas respostas dos campos de retirada
    Should Be Equal         ${response.json()['success']}      ${True}
    Length Should Be        ${response.json()['deck_id']}      12

#CT-06
E retirar uma carta de local no meio da pilha
    ${response}             GET on Session          ${alias}                 url=${baseurl}${deck_id_new}/pile/${pile_name1}/draw/middle                  expected_status=404
    Set Test Variable       ${response}

Então não devo ter sucesso nas respostas dos campos de retirada
    Should Be Equal         ${response.json()['success']}      ${False}
    Length Should Be        ${response.json()['deck_id']}      12
