*** Settings ***
Documentation       Esse arquivo contém os cenários de teste da API pública Deck of Cards
Resource            ../services.robot
Suite Setup         Conexao Com API

*** Test Cases ***
CT-01 - Validar remistura com sucesso de um deck
    Dado que eu possua um deck
    Quando eu remisturar, com sucesso, um deck
    Então terei sucesso na remistura

CT-02 - Validar remistura com sucesso de cartas restantes de um deck
    Dado que eu possua um deck
    Quando eu remisturar apenas as cartas restantes, com sucesso, um deck
    Então terei sucesso na remistura

CT-03 - Validar remistura sem sucesso de um deck inexistente
    Dado que eu possua um deck
    Quando eu remisturar, sem sucesso, um deck inexistente
    Então não terei sucesso na remistura
    