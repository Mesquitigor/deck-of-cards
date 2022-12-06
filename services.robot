*** Settings ***
Library         RequestsLibrary
Library         JSONLibrary
Library         String


Resource       steps/abrandnewdeck_steps.robot
Resource       steps/addingtopiles_steps.robot
Resource       steps/apartialdeck_steps.robot
Resource       steps/drawacard_steps.robot
Resource       steps/drawingfrompiles_steps.robot
Resource       steps/listingcardsinpiles_steps.robot
Resource       steps/reshufflethecards_steps.robot
Resource       steps/returningcardstothedeck.robot
Resource       steps/shufflepiles_steps.robot
Resource       steps/shufflethecards_steps.robot

*** Variables ***
${baseurl}           http://deckofcardsapi.com/api/deck/
${alias}             deckofcards
${number_of_decks}   5
${pile_name1}        pilha_de_higor1
${pile_name2}        pilha_de_higor2
${more_than_zero}    Evaluate        
${cards_to_add}      AS

*** Keywords ***
Conexao com API
    Create Session      ${alias}     ${baseurl}      disable_warnings=1