*** Settings ***
Documentation       Esse arquivo contém os cenários de teste da API pública Deck of Cards
Resource            ../services.robot
Suite Setup         Conexao Com API

*** Test Cases ***
CT-01 - Validar listagem com sucesso de cartas de uma pilha 
    Dado que eu possua um deck
    Quando eu retirar uma quantidade "15" cartas do deck
    E tentar adicionar carta(s) retirada(s) de um deck à uma pilha
    E tentar listar com sucesso as cartas de uma pilha
    Então terei as cartas retiradas nesta lista
    E sucesso na requisição

CT-02 - Validar listagem sem sucesso de cartas de uma pilha inexistente
    Dado que eu possua um deck
    Quando eu retirar uma quantidade "15" cartas do deck
    E tentar adicionar carta(s) retirada(s) de um deck à uma pilha
    E tentar listar sem sucesso as cartas de uma pilha inexistente
    Então não terei cartas listadas

CT-03 - Validar listagem sem sucesso de cartas de um deck inexistente
    Dado que eu possua um deck
    Quando eu retirar uma quantidade "15" cartas do deck
    E tentar adicionar carta(s) retirada(s) de um deck à uma pilha
    E tentar listar sem sucesso as cartas de um deck inexistente
    Então não terei sucesso na requisição de listar a pilha