*** Settings ***
Library         RequestsLibrary
Library         JSONLibrary
Library         String

Resource        steps/steps.robot

*** Variables ***
${baseurl}          http://deckofcardsapi.com/api/deck/
${alias}            deckofcards

*** Keywords ***
Conexao com API
    Create Session      ${alias}     ${baseurl}      disable_warnings=1