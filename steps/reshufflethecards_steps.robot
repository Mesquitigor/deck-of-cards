*** Settings ***
Documentation               Esse arquivo contém os steps da API pública Deck of Cards
Resource                    ../services.robot

*** Keywords ***
#CT-01
Quando eu remisturar, com sucesso, um deck
    ${deck_id_new}          Evaluate                "".join(${deck_id_new})
    ${deck_id_new}          Remove String           ${deck_id_new}           [         ]
    ${response}             GET on Session          ${alias}                 url=${baseurl}${deck_id_new}/shuffle
    Set Test Variable       ${response}    

Então terei sucesso na remistura
    Should Be True          ${response.json()['success']}
    Should Be True          ${response.json()['shuffled']}


#CT-02
Quando eu remisturar apenas as cartas restantes, com sucesso, um deck
    ${deck_id_new}          Evaluate                "".join(${deck_id_new})
    ${deck_id_new}          Remove String           ${deck_id_new}           [         ]
    ${response}             GET on Session          ${alias}                 url=${baseurl}${deck_id_new}/shuffle/?remaining=true
    Set Test Variable       ${response}    


#CT-03
Quando eu remisturar, sem sucesso, um deck inexistente
    ${deck_id_new}          Evaluate                "".join(${deck_id_new})
    ${deck_id_new}          Remove String           ${deck_id_new}           [         ]
    ${response}             GET on Session          ${alias}                 url=${baseurl}${deck_id_new}s/shuffle    expected_status=404
    Set Test Variable       ${response}    

Então não terei sucesso na remistura
    Status Should Be        404
    Should Not Be True      ${response.json()['success']}
    Should Be Equal         ${response.json()['error']}                  Deck ID does not exist.  