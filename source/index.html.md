---
title: Koko Delivery

language_tabs:
  - java: Request Body
  - javascript: Success Response
  - csharp: Error Response

toc_footers:
  - <a href='http://kokonutstudio.com/'>Koko Delivery</a>

search: true
---



# Koko Delivery

Link al código fuente: [Koko Delivery](https://github.com/KokonutStudioRepository/KokoDelivery_Backend).

## URL

Ambiente        | Value
----------------|----------------------------------------
Desarrollo      | NO DISPONIBLE AÚN
QA              | NO DISPONIBLE AÚN
Pruebas Cliente | NO DISPONIBLE AÚN
Producción      | NO DISPONIBLE AÚN






# Auth
## Inicio de sesión
> Inicio de sesión

````java
{
    "email": "example@testmail.com",
    "password": "123Qwe1"
}
```
```javascript
{
    "success": 1,
    "message": "Éxito",
    "data": {
        "token_type": "Bearer",
        "expires_in": 31622400,
        "access_token": "eyJ0eX...",
        "refresh_token": "def50200ecbfff..."
        "user_type": 1,
    }
}
```
```csharp
{
    "success": 0,
    "message": "El correo o contraseña son erroneos",
    "data": null
}
{
    "success": 0,
    "message": "Usuario no registrado",
    "data": null
}
{
    "success": 0,
    "message": "Te hace falta información para iniciar sesión",
    "data": null
}
```

Este endpoint inicia la sesión de un usuario y devuelve el Bearer token para futuras peticiones


HTTP Request  | Name Endpoint |  Endpoint
--------------|---------------|--------------------
POST          |Login          | {{url}}/api/login

### Header
No aplica.

### Body
Key                   | Descripción                 | Type   | Mandatory
----------------------|-----------------------------|--------|-------------
email                 | Correo del usuario          | String | Obligatorio
password              | Contraseña del usuario      | String | Obligatorio







## Cerrar sesión
>Cerrar sesión:

```java
No requerido
```
```javascript
{
    "success": 1,
    "message": "Sesión cerrada correctamente",
    "data": null
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": null
}
```

Este endpoint cierra la sesión de un usuario

HTTP Request  | Name Endpoint |  Endpoint
--------------|---------------|-----------
POST          | Logout        | {{url}}/api/oauth/logout

### Headers
Key           | Value
--------------|-----
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
No requerido





## Actualiza token de sesión (Working on...)
>Actualiza token sesión:

```java
{
    "refresh_token": "def50200c22a902ff0b5e3ea..."
}
```
```javascript
{
    "success": 1,
    "message": "Éxito",
    "data": {
        "token_type": "Bearer",
        "expires_in": 31536000,
        "access_token": "eyJ0eXAiOiJ...",
        "refresh_token": "def50200c...",
        "user_type": 1
    }
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": null
}
```

Este endpoint actualiza el token de sesión

HTTP Request  | Name Endpoint        |  Endpoint
--------------|----------------------|-----------
POST          | Refresh token        | {{url}}/api/token

### Headers
Key           | Value
--------------|--------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
Key                 | Descripción            | Type   | Mandatory
--------------------|------------------------|--------|-------------
refresk_token       | Refresh token          | String | Obligatorio
