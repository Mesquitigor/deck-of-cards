*** Settings ***
Documentation       Esse arquivo contém os cenários de teste da API pública Deck of Cards
Resource            ../services.robot
Suite Setup         Conexao Com API

*** Test Cases ***
CT-01 - Validar embaralhada do Deck
    Dado que eu possua um deck
    Quando eu misturar este Deck
    E verificar que o response tem status "200" e "OK"
    Então devo ter um deck_id diferente do anterior