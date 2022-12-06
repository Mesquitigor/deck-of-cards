*** Settings ***
Documentation       Esse arquivo contém os cenários de teste da API pública Deck of Cards
Resource            ../services.robot
Suite Setup         Conexao Com API

*** Test Cases ***
CT-01 - Validar listagem com sucesso de cartas de uma pilha 
CT-02 - Validar listagem sem sucesso de cartas de uma pilha inexistente
CT-03 - Validar listagem sem sucesso de cartas de um deck inexistente
