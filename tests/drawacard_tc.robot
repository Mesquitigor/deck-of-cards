*** Settings ***
Documentation       Esse arquivo contém os cenários de teste da API pública Deck of Cards
Resource            ../services.robot
Suite Setup         Conexao Com API

*** Test Cases ***

CT-01 - Validar retirada de cartas com sucesso
    Dado que eu possua um deck
    Quando eu escolher uma quantidade "15" cartas
    E verificar que o response tem status "200" e "OK"
    Então eu terei a quantidade "15" de cartas

# CT-02 - Validar retirada de mais cartas do que existem no deck

# CT-03 - Validar retirada de cartas sem sucesso 
    # Dado que eu possua um deck
    # Quando eu escolher uma quantidade cartas superior ao total de cartas do deck
    # E verificar que o response tem status "200" e "OK"
    # Então eu terei a quantidade "15" de cartas