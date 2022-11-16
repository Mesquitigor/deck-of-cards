*** Settings ***
Documentation       Esse arquivo contém os cenários de teste da API pública Deck of Cards
Resource            ../services.robot
Suite Setup         Conexao Com API

*** Test Cases ***
CT-01 - Validar a criação com sucesso de um novo deck de cartas
    Dado que eu faça uma requisição GET na API Deck of Cards
    Quando eu verificar que o response tem status "200" e "OK"
    Então devo ter sucesso nas respostas dos campos
    E pegar o valor do campo deck_id    

CT-02 - Validar a criação sem sucesso de um novo deck de cartas
    Dado que eu faça uma requisição GET na API Deck of Cards incorreta
    Quando eu verificar que o response tem status "404" e "Not Found"
    Então devo ter falha nas respostas dos campos
