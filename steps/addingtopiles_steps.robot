*** Settings ***
Documentation               Esse arquivo contém os steps da API pública Deck of Cards
Resource                    ../services.robot

*** Keywords ***
E tentar adicionar carta(s) retirada(s) de um deck à uma pilha
    # ${deck_id_new}          Evaluate                ${deck_id_new}.pop(0)
    # ${deck_id_new}          Remove String           ${deck_id_new}  [         ]
    ${response}             GET on Session          ${alias}        url=${baseurl}${deck_id_new}/pile/${pile_name1}/add/      params=cards=${cards_to_add}
    Set Test Variable       ${response}

E tentar adicionar 2x as mesmas carta(s) retirada(s) de um deck à uma pilha
    # ${deck_id_new}          Evaluate                ${deck_id_new}.pop(0)
    # ${deck_id_new}          Remove String           ${deck_id_new}  [         ]
    ${response}             GET on Session          ${alias}        url=${baseurl}${deck_id_new}/pile/${pile_name1}/add/      params=cards=${cards_to_add}
    ${response2}             GET on Session          ${alias}        url=${baseurl}${deck_id_new}/pile/${pile_name2}/add/      params=cards=${cards_to_add}
    Set Test Variable       ${response}
    Set Test Variable       ${response2}

E tentar adicionar carta(s) retirada(s) de um deck à uma pilha sem nome
    # ${deck_id_new}          Evaluate                ${deck_id_new}.pop(0)
    # ${deck_id_new}          Remove String           ${deck_id_new}  [         ]
    ${response}             GET on Session          ${alias}        url=${baseurl}${deck_id_new}/pile//add/                    params=cards=${cards_to_add}            expected_status=404
    Set Test Variable       ${response}

E tentar adicionar carta(s) que não estão no deck à uma pilha
    # ${deck_id_new}          Evaluate                ${deck_id_new}.pop(0)
    # ${deck_id_new}          Remove String           ${deck_id_new}  [         ]
    ${response}             GET on Session          ${alias}        url=${baseurl}${deck_id_new}/pile/${pile_name1}/add/       params=cards=2S         
    Set Test Variable       ${response}

E tentar adicionar carta(s) de um deck inexistente à uma pilha
    ${response}             GET on Session          ${alias}        url=${baseurl}${deck_id_new}2/pile/${pile_name1}/add/       params=${cards_to_add}  expected_status=404     
    Set Test Variable       ${response}

Então terei sucesso na adição
    Should Be Equal         ${response.json()['success']}           ${True} 
    Run Keyword If          ${response.json()['piles']['${pile_name1}']['remaining']} > 0    Pass Execution    "Proceeding with the test!"

Então não terei sucesso na adição de cartas do deck, já adicionadas, a uma pilha
    Should Be Equal         ${response.json()['success']}           ${True} 
    Should Be Equal         ${response2.json()['success']}           ${True} 
    Run Keyword If          ${response.json()['piles']['${pile_name1}']['remaining']} > ${response2.json()['piles']['${pile_name2}']['remaining']}    Pass Execution    "Proceeding with the test!"
    
Então não terei sucesso na adição de cartas do deck à uma pilha sem nome
    Status Should Be        404

Então não terei sucesso na adição da carta(s) que não estão no deck à uma pilha
    Should Be Equal         ${response.json()['success']}           ${True} 
    Run Keyword If          ${response.json()['piles']['${pile_name1}']['remaining']} == 0   Pass Execution    "Proceeding with the test!"

Então não terei sucesso na adição da carta(s) de um deck inexistente à uma pilha
    Should Be Equal         ${response.json()['success']}           ${False} 
    Should Have Value In Json            ${response.json()}         $.error
    Should Be Equal         ${response.json()['error']}             Deck ID does not exist.