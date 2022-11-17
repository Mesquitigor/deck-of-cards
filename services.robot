*** Settings ***
Library         RequestsLibrary
Library         JSONLibrary
Library         String

#steps
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

#test cases
# Resource       abrandnewdeck_tc.robot
# Resource       addingtopiles_tc.robot
# Resource       apartialdeck_tc.robot
# Resource       drawacard_tc.robot
# Resource       drawingfrompiles_tc.robot
# Resource       listingcardsinpiles_tc.robot
# Resource       reshufflethecards_tc.robot
# Resource       returningcardstothedeck_tc.robot
# Resource       shufflepiles_tc.robot
# Resource       shufflethecards_tc.robot

*** Variables ***
${baseurl}          http://deckofcardsapi.com/api/deck/
${alias}            deckofcards

*** Keywords ***
Conexao com API
    Create Session      ${alias}     ${baseurl}      disable_warnings=1