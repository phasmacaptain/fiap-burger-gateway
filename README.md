# API Gateway - FiapBurger

Este repositório contém a configuração e a documentação para o API Gateway da aplicação FiapBurger, um sistema de gerenciamento de pedidos para uma lanchonete. O API Gateway serve como ponto de entrada para todos os pedidos de API, roteando-os para os serviços apropriados e fornecendo funcionalidades como autenticação, autorização, monitoramento e gestão de tráfego.

## Visão Geral

O API Gateway da FiapBurger é responsável por:

- Roteamento de solicitações para os serviços backend.
- Gerenciamento de autenticação e autorização.
- Monitoramento e registro de solicitações.
- Implementação de políticas de limite de taxa e controle de tráfego.
- Manutenção da segurança das comunicações entre clientes e serviços backend.


## Configuração do API Gateway

### 1. Roteamento

O arquivo `routes.yaml` define as rotas para os diferentes serviços backend da aplicação:

```yaml
routes:
  - path: /clientes
    service: clientes-service
    methods: [GET, POST, PUT, DELETE]

  - path: /pedidos
    service: pedidos-service
    methods: [GET, POST, PUT, DELETE]

  - path: /produtos
    service: produtos-service
    methods: [GET, POST, PUT, DELETE]

  - path: /categorias
    service: categorias-service
    methods: [GET, POST, PUT, DELETE]
    
auth:
  - path: /admin
    methods: [GET, POST]
    roles: [admin]

  - path: /*
    methods: [GET]
    roles: [user, admin]


