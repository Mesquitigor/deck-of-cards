*** Settings ***
Documentation       Esse arquivo contém os cenários de teste da API pública Deck of Cards
Resource            ../services.robot
Suite Setup         Conexao Com API

*** Test Cases ***
CT-01 - Validar embaralhar as cartas com sucesso em quantidade de decks
    Dado que eu faça uma requisição GET na API Deck of Cards shuffle cards
    Quando eu verificar que o response tem status "200" e "OK"
    Então devo ter sucesso nas respostas dos campos do shuffle cards
    E pegar o valor do campo deck_id

CT-02 - Validar embaralhar as cartas sem sucesso com url errada
    Dado que eu faça uma requisição GET na API Deck of Cards incorreta do shuffle cards
    Quando eu verificar que o response tem status "404" e "Not Found"
    Então devo ter falha nas respostas dos campos

CT-03 - Validar embaralhar as cartas sem sucesso com 21 decks
    Dado que eu faça uma requisição GET na API Deck of Cards com "21" decks
    Quando eu verificar que o response tem status "200" e "OK"
    Então devo ter falha para shuffled cards nas respostas dos campos
    
CT-04 - Validar embaralhar as cartas sem sucesso com quantidade negativa de decks

