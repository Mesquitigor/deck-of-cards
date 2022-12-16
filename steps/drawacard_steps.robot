*** Settings ***
Documentation               Esse arquivo contém os steps da API pública Deck of Cards
Resource                    ../services.robot

*** Keywords ***
#CT-01
Quando eu retirar uma quantidade "${numero_de_cartas}" cartas do deck
    ${deck_id_new}          Evaluate                "".join(${deck_id_new})
    ${deck_id_new}          Remove String           ${deck_id_new}           [         ]
    ${response}             GET on Session          ${alias}                 url=${baseurl}${deck_id_new}/draw/?count=${numero_de_cartas}
    Set Test Variable       ${response}
    Set Global Variable     ${numero_de_cartas}
    Set Test Variable       ${deck_id_new}

Quando eu retirar cartas sem ter cartas no deck
    ${deck_id_new}          Evaluate                "".join(${deck_id_new})
    ${deck_id_new}          Remove String           ${deck_id_new}           [         ]
    ${response}             GET on Session          ${alias}                 url=${baseurl}${deck_id_new}/draw/?count=100
    ${response2}             GET on Session          ${alias}                 url=${baseurl}${deck_id_new}/draw/?count=50
    Set Test Variable       ${response}
    Set Test Variable       ${response2}
    
Então eu terei a mesma quantidade de cartas no deck
    ${numero_de_cartas}     Convert To Integer      ${numero_de_cartas}
    ${length}=              Get Length              ${response.json()['cards']}
    Should Be Equal         ${numero_de_cartas}     ${length}

Então eu terei uma menor quantidade de cartas no deck
    ${numero_de_cartas}     Convert To Integer      ${numero_de_cartas}
    ${length}=              Get Length              ${response.json()['cards']}
    Should Not Be Equal     ${numero_de_cartas}     ${length}

Então receberei uma mensagem de erro
    Should Contain         ${response2.json()}      error
    Should Not Be Empty    ${response2.json()['error']} 

E sucesso na retirada
    Should Be Equal         ${response.json()['success']}                      ${True}

E quantidade correta de carta restantes
    ${remaining_brandnew}   Evaluate                ${remaining_brandnew}.pop(0)
    ${resultado}            Evaluate                int(${remaining_brandnew})-int(${numero_de_cartas})
    Should Be Equal         ${response.json()['remaining']}                    ${resultado}

E quantidade nula de carta restantes
    Set Suite Variable      ${null_int}             0
    ${null_int}             Evaluate                int(${null_int})
    Should Be Equal         ${response.json()['remaining']}                    ${null_int}

E falha na retirada
    Should Be Equal         ${response.json()['success']}                      ${False}    