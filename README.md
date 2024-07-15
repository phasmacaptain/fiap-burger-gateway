# FiapBurger API Gateway

## Descrição

O **FiapBurger API Gateway** é a interface centralizada para os serviços da aplicação FiapBurger. Ele expõe endpoints para gerenciamento de clientes, pedidos, produtos e pagamentos, proporcionando uma camada de segurança e autenticação por meio de um autorizer Lambda.

## Endpoints

### Cliente

- **Criar Cliente**
  - **POST /cliente/{cpf}**
  - Descrição: Cria um novo cliente.
  - Body:
    ```json
    {
      "cpf": "string",
      "email": "string",
      "nome": "string"
    }
    ```
  - Respostas:
    - **201**: Cliente criado com sucesso.
    - **400**: Requisição inválida.

- **Editar Cliente**
  - **PATCH /cliente/{cpf}**
  - Descrição: Edita um cliente existente.
  - Body:
    ```json
    {
      "cpf": "string",
      "email": "string",
      "nome": "string"
    }
    ```
  - Respostas:
    - **200**: Cliente atualizado com sucesso.
    - **400**: Requisição inválida.
    - **404**: Cliente não encontrado.

- **Buscar Cliente**
  - **GET /cliente/{cpf}**
  - Descrição: Busca um cliente pelo CPF.
  - Parâmetros:
    - **cpf**: CPF do cliente a ser buscado.
  - Respostas:
    - **200**: Cliente encontrado.
    - **404**: Cliente não encontrado.

- **Deletar Cliente**
  - **DELETE /cliente/{cpf}**
  - Descrição: Deleta um cliente pelo CPF.
  - Parâmetros:
    - **cpf**: CPF do cliente a ser deletado.
  - Respostas:
    - **204**: Cliente deletado com sucesso.
    - **404**: Cliente não encontrado.

### Pedido

- **Criar Pedido**
  - **POST /pedido**
  - Descrição: Cria um novo pedido.
  - Body:
    ```json
    {
      "cpf": "string",
      "itensPedido": [
        {
          "produtoId": "string",
          "quantidade": "integer",
          "precoUnitario": "float"
        }
      ]
    }
    ```
  - Respostas:
    - **200**: Pedido criado com sucesso.
    - **400**: Requisição inválida.

- **Deletar Pedido**
  - **DELETE /pedido**
  - Descrição: Deleta um pedido.
  - Body:
    ```json
    {
      "idPedido": "string"
    }
    ```
  - Respostas:
    - **200**: Pedido deletado com sucesso.
    - **400**: Requisição inválida.

- **Buscar Pedido**
  - **GET /pedido/{id}**
  - Descrição: Busca um pedido pelo ID.
  - Parâmetros:
    - **id**: ID do pedido a ser buscado.
  - Respostas:
    - **200**: Pedido encontrado.
    - **404**: Pedido não encontrado.

- **Listar Pedidos**
  - **GET /pedido**
  - Descrição: Lista todos os pedidos.
  - Respostas:
    - **200**: Lista de pedidos.

- **Listar Pedidos por Status**
  - **GET /pedido/listar/{id_status}**
  - Descrição: Lista pedidos por status.
  - Parâmetros:
    - **id_status**: ID do status dos pedidos a serem listados.
  - Respostas:
    - **200**: Lista de pedidos por status.

- **Avaliar Pedido**
  - **POST /pedido/avaliar**
  - Descrição: Avalia um pedido.
  - Body:
    ```json
    {
      "idPedido": "string",
      "idSatisfacao": "string"
    }
    ```
  - Respostas:
    - **200**: Pedido avaliado com sucesso.
    - **400**: Requisição inválida.

- **Atualizar Status do Pedido**
  - **PATCH /pedido/atualizar-status**
  - Descrição: Atualiza o status de um pedido.
  - Body:
    ```json
    {
      "idPedido": "string",
      "idStatus": "string"
    }
    ```
  - Respostas:
    - **200**: Status do pedido atualizado com sucesso.
    - **400**: Requisição inválida.

- **Efetuar Pagamento**
  - **POST /pedido/efetuar-pagamento**
  - Descrição: Efetua o pagamento de um pedido.
  - Body:
    ```json
    {
      "idPedido": "string",
      "idPagamento": "string",
      "valorTotal": "string"
    }
    ```
  - Respostas:
    - **200**: Pagamento efetuado com sucesso.
    - **400**: Requisição inválida.

### Produtos

- **Adicionar Produto**
  - **POST /produtos**
  - Descrição: Adiciona um novo produto.
  - Body:
    ```json
    {
      "name": "string",
      "description": "string",
      "price": "string",
      "id_category": "string",
      "url_img": "string"
    }
    ```
  - Respostas:
    - **200**: Produto adicionado com sucesso.
    - **400**: Requisição inválida.

- **Listar Produtos**
  - **GET /produtos**
  - Descrição: Lista todos os produtos.
  - Respostas:
    - **200**: Lista de produtos.

- **Buscar Produto por ID**
  - **GET /produtos/{id}**
  - Descrição: Busca um produto pelo ID.
  - Parâmetros:
    - **id**: ID do produto a ser buscado.
  - Respostas:
    - **200**: Produto encontrado.
    - **404**: Produto não encontrado.

- **Atualizar Produto**
  - **PUT /produtos/{id}**
  - Descrição: Atualiza um produto pelo ID.
  - Parâmetros:
    - **id**: ID do produto a ser atualizado.
  - Body:
    ```json
    {
      "name": "string",
      "description": "string",
      "price": "string",
      "id_category": "string",
      "url_img": "string"
    }
    ```
  - Respostas:
    - **200**: Produto atualizado com sucesso.
    - **400**: Requisição inválida.
    - **404**: Produto não encontrado.

- **Deletar Produto**
  - **DELETE /produtos/{id}**
  - Descrição: Deleta um produto pelo ID.
  - Parâmetros:
    - **id**: ID do produto a ser deletado.
  - Respostas:
    - **200**: Produto deletado com sucesso.
    - **404**: Produto não encontrado.

- **Listar Produtos por Categoria**
  - **GET /produtos/categoria/{id_category}**
  - Descrição: Lista produtos por categoria.
  - Parâmetros:
    - **id_category**: ID da categoria dos produtos a serem listados.
  - Respostas:
    - **200**: Lista de produtos por categoria.

### Pagamento

- **Listar Meios de Pagamento**
  - **GET /pagamento**
  - Descrição: Lista todos os meios de pagamentos.
  - Respostas:
    - **200**: Lista de meios de pagamentos.

- **Efetuar Pagamento**
  - **POST /pagamento**
  - Descrição: Efetua um pagamento.
  - Body:
    ```json
    {
      "idPedido": "string",
      "idPagamento": "string",
      "valorTotal": "string"
    }
    ```
  - Respostas:
    - **200**: Pagamento efetuado com sucesso.

- **Webhook de Pagamento**
  - **GET /pagamento/{id}**
  - Descrição: Webhook de pagamento.
  - Parâmetros:
    - **id**: ID do pedido.
  - Respostas:
    - **200**: Detalhes do webhook do pagamento.

- **Consultar Status de Pagamento**
  - **GET /pagamento/consultar/{id}**
  - Descrição: Consulta status de pagamento.
  - Parâmetros:
    - **id**: ID do pedido.
  - Respostas:
    - **200**: Status do pagamento.

## Segurança

Todos os endpoints são protegidos por um Lambda Authorizer personalizado. Certifique-se de enviar o token de autorização no cabeçalho da requisição:

```http
Authorization: Bearer <token>
