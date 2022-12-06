*** Settings ***
Documentation       Esse arquivo contém os cenários de teste da API pública Deck of Cards
Resource            ../services.robot
Suite Setup         Conexao Com API

*** Test Cases ***
CT-01 - Validar retirada com sucesso de cartas de uma pilha escolhendo as cartas
CT-02 - Validar retirada com sucesso de cartas de uma pilha escolhendo a quantidade a retirar
CT-03 - Validar retirada com sucesso de cartas de uma pilha escolhendo a quantidade a retirar
CT-04 - Validar retirada com sucesso de cartas de uma pilha escolhendo o local de retirada
CT-05 - Validar retirada com sucesso de cartas de uma pilha escolhendo o local de retirada e quantidade a retirar
CT-06 - Validar retirada com sucesso de cartas de uma pilha de forma aleatória
CT-07 - Validar retirada sem sucesso de cartas de uma pilha retirar do meio


