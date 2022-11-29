*** Settings ***
Documentation               Esse arquivo contém os steps da API pública Deck of Cards
Resource                    ../services.robot

*** Keywords ***
Dado que eu faça uma requisição GET na API Deck of Cards shuffle cards com "${many_shuffle_decks}" decks
    ${response}             GET on Session           ${alias}               url=${baseurl}new/shuffle/?deck_count=${many_shuffle_decks}
    Set Test Variable       ${response}
    ${remaining}            Get Value From Json      ${response.json()}     $.remaining
    Set Test Variable     ${remaining}
    ${many_shuffle_decks}   Evaluate                 int(${many_shuffle_decks}*52)
    Set Test Variable    ${many_shuffle_decks}

Dado que eu faça uma requisição GET na API Deck of Cards incorreta do shuffle cards
    ${response}             GET on Session           ${alias}               url=${baseurl}old/shuffle/?deck_count=${number_of_decks}                    expected_status=404
    Set Test Variable       ${response}
    ${remaining}            Get Value From Json      ${response.json()}     $.remaining
    Set Test Variable     ${remaining}
    ${success}              Get Value From Json      ${response.json()}      $.success
    ${error}                Get Value From Json      ${response.json()}      $.error
    Set Test Variable     ${success} 
    Set Test Variable     ${error}

Dado que eu faça uma requisição GET na API Deck of Cards shuffle cards com "${many_shuffle_decks}" decks sem sucesso
    ${response}             GET on Session           ${alias}               url=${baseurl}new/shuffle/?deck_count=${many_shuffle_decks}
    Set Test Variable       ${response}
    ${remaining}            Get Value From Json      ${response.json()}     $.remaining
    Set Test Variable     ${remaining}
    ${success}              Get Value From Json      ${response.json()}      $.success
    ${error}                Get Value From Json      ${response.json()}      $.error
    Set Test Variable     ${success} 
    Set Test Variable     ${error}

Então devo ter sucesso nas respostas dos campos do shuffle cards
    Should Be Equal         ${response.json()['success']}      ${True}
    Length Should Be        ${response.json()['deck_id']}      12
    Should Be Equal         ${response.json()['shuffled']}     ${True}
    Should Be Equal         ${response.json()['remaining']}    ${many_shuffle_decks}

Então devo ter falha de limite de cartas nas respostas dos campos
    Should Be Equal         ${response.json()['success']}      ${false}
    Should Be Equal         ${response.json()['error']}        The max number of Decks is 20.

