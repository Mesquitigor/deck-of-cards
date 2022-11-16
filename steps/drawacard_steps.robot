*** Settings ***
Documentation               Esse arquivo contém os steps da API pública Deck of Cards
Resource                    ../services.robot

*** Keywords ***
#CT-01
Quando eu escolher uma quantidade "${numero_de_cartas}" cartas
    ${deck_id_new}          Evaluate                "".join(${deck_id_new})
    ${deck_id_new}          Remove String           ${deck_id_new}           [         ]
    ${response}             GET on Session          ${alias}                 url=${baseurl}${deck_id_new}/draw/?count=${numero_de_cartas}
    Set Test Variable       ${response}

Então eu terei a quantidade "${numero_de_cartas}" de cartas
    ${numero_de_cartas}     Convert To Integer       ${numero_de_cartas}
    ${length}=              Get Length               ${response.json()['cards']}
    Should Be Equal         ${numero_de_cartas}      ${length}

#CT-03
Quando eu escolher uma quantidade cartas superior ao total de cartas do deck
    ${over_remaining}           ${remaining}   +1