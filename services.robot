*** Settings ***
Library        RequestsLibrary
Library        JSONLibrary
Library        String

Resource       steps/abrandnewdeck_steps.robot
Resource       steps/addingtopiles_steps.robot
Resource       steps/apartialdeck_steps.robot
Resource       steps/drawacard_steps.robot
Resource       steps/drawingfrompiles_steps.robot
Resource       steps/listingcardsinpiles_steps.robot
Resource       steps/reshufflethecards_steps.robot
Resource       steps/returningcardstothedeck_steps.robot
Resource       steps/shufflepiles_steps.robot
Resource       steps/shufflethecards_steps.robot

*** Variables ***
${baseurl}           http://deckofcardsapi.com/api/deck/
${alias}             deckofcards
${number_of_decks}   5
${number_of_cards}   2
${pile_name1}        pilha_de_higor1
${pile_name2}        pilha_de_higor2
${more_than_zero}    Evaluate        
${cards_to_add}      AS,2S,3S,4S,5S,6S,7S,8S,9S,0S,JS,QS
${cards_to_return}   AS,2S,3S

*** Keywords ***
Conexao com API
    Create Session      ${alias}     ${baseurl}      disable_warnings=1