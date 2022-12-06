*** Settings ***
Documentation       Esse arquivo contém os cenários de teste da API pública Deck of Cards
Resource            ../services.robot
Suite Setup         Conexao Com API

*** Test Cases ***
CT-01 - Validar retorno com sucesso de cartas para um deck
CT-02 - Validar retorno com sucesso de todas cartas de uma pilha para um deck
CT-03 - Validar retorno com sucesso de algumas cartas de uma pilha para um deck
CT-04 - Validar retorno com sucesso de algumas cartas para um deck
CT-05 - Validar retorno sem sucesso de todas cartas para um deck, mas sem cartas restantes
CT-06 - Validar retorno sem sucesso de algumas cartas, não retiradas, para um deck

