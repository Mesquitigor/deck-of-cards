*** Settings ***
Documentation               Esse arquivo contém os steps da API pública Deck of Cards
Resource                    ../services.robot

*** Keywords ***
#CT-01
E retirar uma quantidade "${numero_de_cartas}" cartas do deck
    Quando eu retirar uma quantidade "${numero_de_cartas}" cartas do deck

Quando eu retornar, com sucesso, as cartas retiradas para o deck
    ${response}             GET on Session          ${alias}                 url=${baseurl}${deck_id_new}/return
    Set Test Variable       ${response}    

Então terei sucesso no retorno das cartas
    Should Be True          ${response.json()['success']}

#CT-02
E retirar uma quantidade "${12}" cartas
    Quando eu retirar uma quantidade "${12}" cartas
    
E coloque algumas cartas numa pilha
    Quando eu retirar uma quantidade "12" cartas do deck
    E tentar adicionar carta(s) retirada(s) de um deck à uma pilha

Quando eu retornar, com sucesso, as cartas de um pilha para o deck
    ${response}             GET on Session          ${alias}                 url=${baseurl}${deck_id_new}/pile/${pile_name1}/return
    Set Test Variable       ${response}  

#CT-03
Quando eu retornar, com sucesso, algumas das cartas de um pilha para o deck
    ${response}             GET on Session          ${alias}                 url=${baseurl}${deck_id_new}/pile/${pile_name1}/return/?cards=${cards_to_add}
    Set Test Variable       ${response} 

#CT-04
Quando eu retornar, com sucesso, algumas das cartas para o deck
    ${response}             GET on Session          ${alias}                 url=${baseurl}${deck_id_new}/return/?cards=${cards_to_return}
    Set Test Variable       ${response} 

#CT-05
Quando eu retornar, sem sucesso, cartas não retiradas para o deck
    ${response}             GET on Session          ${alias}                 url=${baseurl}${deck_id_new}/return/?cards=4H
    Set Test Variable       ${response} 

Então não terei sucesso no retorno das cartas
    Status Should Be        404                    ${response}
    Should Not Be True      ${response.json()['success']}


