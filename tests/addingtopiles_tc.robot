*** Settings ***
Documentation       Esse arquivo contém os cenários de teste da API pública Deck of Cards
Resource            ../services.robot
Suite Setup         Conexao Com API

*** Test Cases ***
CT-01 - Validar adição com sucesso de cartas do deck a uma pilha
    Dado que eu possua um deck
    Quando eu retirar uma quantidade "${15}" cartas
    E tentar adicionar carta(s) retirada(s) de um deck à uma pilha
    Então terei sucesso na adição

CT-02 - Validar adição sem sucesso de cartas do deck, já adicionadas, a uma pilha
    Dado que eu possua um deck
    Quando eu retirar uma quantidade "${15}" cartas
    E tentar adicionar 2x as mesmas carta(s) retirada(s) de um deck à uma pilha
    Então não terei sucesso na adição de cartas do deck, já adicionadas, a uma pilha

CT-03 - Validar adição sem sucesso de cartas do deck a uma pilha sem nome
    Dado que eu possua um deck
    Quando eu retirar uma quantidade "${15}" cartas
    E tentar adicionar carta(s) retirada(s) de um deck à uma pilha sem nome
    Então não terei sucesso na adição de cartas do deck à uma pilha sem nome

CT-04 - Validar adição sem sucesso de cartas que não estão no deck a uma pilha
    Dado que eu possua um deck
    Quando eu retirar uma quantidade "${1}" cartas
    E tentar adicionar carta(s) que não estão no deck à uma pilha
    Então não terei sucesso na adição da carta(s) que não estão no deck à uma pilha

CT-05 - Validar adição sem sucesso de cartas de um deck inexistente a uma pilha
    Dado que eu possua um deck
    Quando eu retirar uma quantidade "${1}" cartas
    E tentar adicionar carta(s) de um deck inexistente à uma pilha
    Então não terei sucesso na adição da carta(s) de um deck inexistente à uma pilha