*** Settings ***
Documentation       Esse arquivo contém os cenários de teste da API pública Deck of Cards
Resource            ../services.robot
Suite Setup         Conexao Com API

*** Test Cases ***
CT-01 - Validar remistura com sucesso de um deck
CT-02 - Validar remistura com sucesso de cartas restantes de um deck
CT-03 - Validar remistura sem sucesso de um deck inexistente