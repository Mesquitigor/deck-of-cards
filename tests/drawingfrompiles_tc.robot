*** Settings ***
Documentation       Esse arquivo contém os cenários de teste da API pública Deck of Cards
Resource            ../services.robot
Suite Setup         Conexao Com API

*** Test Cases ***
CT-01 - Validar retirada com sucesso de cartas de uma pilha escolhendo as cartas
    Dado que eu possua um deck
    Quando eu retirar uma quantidade "15" cartas do deck
    E tentar adicionar carta(s) retirada(s) de um deck à uma pilha
    E retirar uma quantidade de "12" carta(s) da pilha
    Então eu terei a mesma quantidade de cartas na retirada da pilha
    E sucesso na retirada

CT-02 - Validar retirada com sucesso de cartas de uma pilha escolhendo a quantidade a retirar
    Dado que eu possua um deck
    Quando eu retirar uma quantidade "15" cartas do deck
    E tentar adicionar carta(s) retirada(s) de um deck à uma pilha
    E retirar uma quantidade específica de "10" carta(s) da pilha
    Então eu terei a mesma quantidade de cartas na retirada da pilha
    E sucesso na retirada
    
CT-03 - Validar retirada com sucesso de cartas de uma pilha escolhendo o local de retirada
    Dado que eu possua um deck
    Quando eu retirar uma quantidade "15" cartas do deck
    E tentar adicionar carta(s) retirada(s) de um deck à uma pilha
    E retirar uma carta do início da pilha
    Então eu terei a mesma quantidade de cartas na retirada da pilha
    E sucesso na retirada
    E a carta retirada será a primeira da pilha
    
CT-04 - Validar retirada com sucesso de cartas de uma pilha escolhendo o local de retirada e quantidade a retirar
    Dado que eu possua um deck
    Quando eu retirar uma quantidade "15" cartas do deck
    E tentar adicionar carta(s) retirada(s) de um deck à uma pilha
    E retirar "${number_of_cards}" cartas do início da pilha
    Então devo ter sucesso nas respostas dos campos de retirada
    E sucesso na retirada
    E as cartas retiradas serão as "${number_of_cards}" primeiras da pilha

CT-05 - Validar retirada com sucesso de cartas de uma pilha de forma aleatória
    Dado que eu possua um deck
    Quando eu retirar uma quantidade "15" cartas do deck
    E tentar adicionar carta(s) retirada(s) de um deck à uma pilha
    E retirar uma carta de local aleatório da pilha
    Então devo ter sucesso nas respostas dos campos de retirada
    E sucesso na retirada

# Este cenário está comentado porque possui um bug
# CT-06 - Validar retirada sem sucesso de cartas de uma pilha retirar do meio
#     Dado que eu possua um deck
#     Quando eu retirar uma quantidade "15" cartas do deck
#     E tentar adicionar carta(s) retirada(s) de um deck à uma pilha
#     E retirar uma carta de local no meio da pilha
#     Então não devo ter sucesso nas respostas dos campos de retirada
    

