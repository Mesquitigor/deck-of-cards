*** Settings ***
Documentation       Esse arquivo contém os cenários de teste da API pública Deck of Cards
Resource            ../services.robot
Suite Setup         Conexao Com API

*** Test Cases ***
CT-01 - Validar retorno com sucesso de cartas para um deck
    Dado que eu possua um deck
    E retirar uma quantidade "12" cartas do deck
    Quando eu retornar, com sucesso, as cartas retiradas para o deck
    Então terei sucesso no retorno das cartas

CT-02 - Validar retorno com sucesso de todas cartas de uma pilha para um deck
    Dado que eu possua um deck
    E coloque algumas cartas numa pilha
    Quando eu retornar, com sucesso, as cartas de um pilha para o deck
    Então terei sucesso no retorno das cartas

CT-03 - Validar retorno com sucesso de algumas cartas de uma pilha para um deck
    Dado que eu possua um deck
    E coloque algumas cartas numa pilha
    Quando eu retornar, com sucesso, algumas das cartas de um pilha para o deck
    Então terei sucesso no retorno das cartas
    
CT-04 - Validar retorno com sucesso de algumas cartas para um deck
    Dado que eu possua um deck
    E coloque algumas cartas numa pilha
    Quando eu retornar, com sucesso, algumas das cartas para o deck
    Então terei sucesso no retorno das cartas

CT-05 - Validar retorno sem sucesso de algumas cartas, não retiradas, para um deck
    Dado que eu possua um deck
    E coloque algumas cartas numa pilha
    Quando eu retornar, sem sucesso, cartas não retiradas para o deck
    # Então não terei sucesso no retorno das cartas  
