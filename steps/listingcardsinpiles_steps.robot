*** Settings ***
Documentation               Esse arquivo contém os steps da API pública Deck of Cards
Resource                    ../services.robot

*** Keywords ***
#CT-01
E tentar listar com sucesso as cartas de uma pilha
    ${response}             GET on Session          ${alias}                 url=${baseurl}${deck_id_new}/pile/${pile_name1}/list
    Set Test Variable       ${response}    

Então terei as cartas retiradas nesta lista
    Set Suite Variable      ${carta1}           ${response.json()['piles']['${pile_name1}']['cards'][0]['code']}
    Set Suite Variable      ${carta2}           ${response.json()['piles']['${pile_name1}']['cards'][1]['code']}
    Set Suite Variable      ${carta3}           ${response.json()['piles']['${pile_name1}']['cards'][2]['code']}
    Set Suite Variable      ${carta4}           ${response.json()['piles']['${pile_name1}']['cards'][3]['code']}
    Set Suite Variable      ${carta5}           ${response.json()['piles']['${pile_name1}']['cards'][4]['code']}
    Set Suite Variable      ${carta6}           ${response.json()['piles']['${pile_name1}']['cards'][5]['code']}
    Set Suite Variable      ${carta7}           ${response.json()['piles']['${pile_name1}']['cards'][6]['code']}
    Set Suite Variable      ${carta8}           ${response.json()['piles']['${pile_name1}']['cards'][7]['code']}
    Set Suite Variable      ${carta9}           ${response.json()['piles']['${pile_name1}']['cards'][8]['code']}
    Set Suite Variable      ${carta10}          ${response.json()['piles']['${pile_name1}']['cards'][9]['code']}
    Set Suite Variable      ${carta11}          ${response.json()['piles']['${pile_name1}']['cards'][10]['code']}
    Set Suite Variable      ${carta12}          ${response.json()['piles']['${pile_name1}']['cards'][11]['code']}
    Set Suite Variable      ${cartas_lista}     ${carta1}, ${carta2}, ${carta3}, ${carta4}, ${carta5}, ${carta6}, ${carta7}, ${carta8}, ${carta9}, ${carta10}, ${carta11}, ${carta12}
    ${cartas_lista}         Evaluate            '${cartas_lista}'.replace(' ','')
    Should Be Equal         ${cartas_lista}  ${cards_to_add}

E sucesso na requisição
    Should Be True          ${response.json()['success']}
    Request Should Be Successful                ${response}
    Status Should Be        200                 ${response}
 
 #CT-02
E tentar listar sem sucesso as cartas de uma pilha inexistente
    ${response}             GET on Session      ${alias}                 url=${baseurl}${deck_id_new}/pile/${pile_name1}x/list      
    Set Test Variable       ${response} 

Então não terei cartas listadas
    Should Not Contain     ${response.json()}   'cards'

#CT-03
E tentar listar sem sucesso as cartas de um deck inexistente
    ${response}             GET on Session      ${alias}                 url=${baseurl}${deck_id_new}x/pile/${pile_name1}/list       expected_status=404 
    Set Test Variable       ${response}         

Então não terei sucesso na requisição de listar a pilha
    Status Should Be        404
    Should Not Be True      ${response.json()['success']}
    Should Be Equal         ${response.json()['error']}                  Deck ID does not exist.  
