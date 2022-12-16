*** Settings ***
Documentation       Esse arquivo contém os cenários de teste da API pública Deck of Cards
Resource            ../services.robot
Suite Setup         Conexao Com API

*** Test Cases ***

CT-01 - Validar retirada de cartas com sucesso
    Dado que eu possua um deck
    Quando eu retirar uma quantidade "15" cartas do deck
    E verificar que o response tem status "200" e "OK"
    Então eu terei a mesma quantidade de cartas no deck
    E sucesso na retirada
    E quantidade correta de carta restantes

CT-02 - Validar retirada de mais cartas do que existem no deck
    Dado que eu possua um deck
    Quando eu retirar uma quantidade "70" cartas do deck
    E verificar que o response tem status "200" e "OK"
    Então eu terei uma menor quantidade de cartas no deck
    E falha na retirada
    E quantidade nula de carta restantes

CT-03 - Validar retirada de cartas sem sucesso
    Dado que eu possua um deck
    Quando eu retirar cartas sem ter cartas no deck
    E verificar que o response tem status "200" e "OK"
    Então receberei uma mensagem de erro

CT-04 - Validar retirada de cartas de um deck misturado
    Dado que eu faça uma requisição GET na API Deck of Cards shuffle cards com "1" decks
    E pegar o valor do campo deck_id
    Quando eu retirar uma quantidade "15" cartas do deck
    E verificar que o response tem status "200" e "OK"
    Então eu terei a mesma quantidade de cartas no deck
    E sucesso na retirada
    # E quantidade correta de carta restantes