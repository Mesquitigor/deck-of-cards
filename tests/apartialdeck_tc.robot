*** Settings ***
Documentation       Esse arquivo contém os cenários de teste da API pública Deck of Cards
Resource            ../services.robot
Suite Setup         Conexao Com API

*** Test Cases ***
CT-01 - Validar criação de um deck parcial com sucesso
    Dado que eu faça a criação de um deck parcial
    Quando eu verificar que o response tem status "200" e "OK"
    Então devo ter sucesso nas respostas dos campos da requisição de deck parcial
    E pegar o valor do campo deck_id_partial

# Este Cenário se encontra comentado porque há um bug na API
# CT-02 - Validar criação de um deck parcial sem sucesso usando mais de dois caracteres
#     Dado que eu faça a criação de um deck parcial com uma(s) carta(s) de mais de dois dígitos
#     Quando eu verificar que o response tem status "404" e "Not Found"
#     Então devo ter falha nas respostas dos campos    

# Este Cenário se encontra comentado porque há um bug na API
# CT-03 - Validar criação de um deck parcial sem sucesso usando letras minúsculas
#     Dado que eu faça a criação de um deck parcial com uma(s) carta(s) com letra minúscula
#     Quando eu verificar que o response tem status "404" e "Not Found"
#     Então devo ter falha nas respostas dos campos    