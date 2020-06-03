---
title: CAS Miura

language_tabs:
  - java: Request Body
  - javascript: Success Response
  - csharp: Error Response

toc_footers:
  - <a href='http://kokonutstudio.com/'>CAS Miura</a>

search: true
---



# CAS Miura

Link al código fuente: [CAS Miura](https://github.com/KokonutStudioRepository/CAS_CMS_Backend).

## URL

Ambiente        | Value
----------------|----------------------------------------
Desarrollo      | https://cas-dev-api.kokonutstudio.com
QA              | https://cas-qa-api.kokonutstudio.com
Pruebas Cliente | NO DISPONIBLE AÚN
Producción      | NO DISPONIBLE AÚN


## Estatus de usuarios
Se muestra listado de los estatus disponibles para un usuario.

ID | Estatus
---|----------------------
1  | Activo
0  | Desactivado


## Tipo de usuarios
Se muestra listado de los tipos de usuarios.

id  | Rol
----|--------------------
 1  | Usuario principal App
 2  | Usuario secundario App
 3  | Moderador CMS
 4  | Admin CMS






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





## Actualiza token de sesión
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












## Recuperar contraseña
>Recuperar contraseña:

```java
{
    "email": "magdiel@kokonutstudio.com"
}
```
```javascript
{
    "success": 1,
    "message": "Se envió un correo de recuperación exitosamente",
    "data": null
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
```

Este endpoint manda un correo al usuario que desea recuperar su contraseña

HTTP Request  | Name Endpoint |  Endpoint
--------------|---------------|-----------
POST          | Logout        | {{url}}/api/restore_password

### Headers
No requerido

### Body
Key         | Descripción                 | Type   | Mandatory
------------|-----------------------------|--------|-------------
email       | Correo del usuario          | String | Obligatorio






## Resetear contraseña
>Resetear contraseña:

```java
{
    "password": "123Qwe1",
    "password_confirmation": "123Qwe1",
}
```
```javascript
{
    "success": 1,
    "message": "Se actualizó correctamente la contraseña",
    "data": null
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
```

Este endpoint actualiza la nueva contraseña del usuario

HTTP Request  | Name Endpoint |  Endpoint
--------------|---------------|-----------
POST          | Reset pass    | {{url}}/api/reset_password

### Headers
No requerido

### Body
Key                     | Descripción                 | Type   | Mandatory
------------------------|-----------------------------|--------|-------------
password                | New Password                | String | Obligatorio
password_confirmation   | New Password confirmation   | String | Obligatorio






# User
## Registrar usuarios desde CMS
> Registro de usuarios

````java
{
    "email": "example@testmail.com",
    "code": "AS4QAD22",
    "quantity": 3
}
```
```javascript
{
    "success": 1,
    "message": "Usuario creado con éxito",
    "data": null
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
{
    "success": 0,
    "message": "Correo electronico ya registrado",
    "data": null
}
{
    "success": 0,
    "message": "Hacen falta datos para completar el registro",
    "data": null
}
```

Este endpoint registra un usuario principal desde el CMS.

HTTP Request  | Name Endpoint | Endpoint
--------------|---------------|-----------------------
POST          | Register      | {{url}}/api/oauth/users

### Headers
Key           | Value
--------------|-----
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
Key         | Descripción                               | Type   | Mandatory
------------|-------------------------------------------|--------|-------------
email       | Correo del usuario                        | String | Obligatorio
code        | Contraseña del usuario                    | String | Obligatorio
quantity    | Cantidad de usuarios que usarán el código | Int    | Obligatorio






## Activa código de registro
>Activa código de registro:

```java
{
    "code": "AS4QAD22",
    "email": "example@testmail.com",
}

```
```javascript
{
    "success": 1,
    "message": "Código validado correctamente",
    "data": {
        {
            "email": "example@interphy.com",
            "cat_type_user_id": 2,
            "updated_at": "2020-02-18 18:04:44",
            "created_at": "2020-02-18 18:04:44",
            "id": "eyJpdiI6I..."
        }
    }
}

```
```csharp
{
    "success": 0,
    "message": "El uso de este código de invitación ha sido excedido el número de usuarios",
    "data": null
}
{
    "success": 0,
    "message": "El código de invitación no es válido",
    "data": null
}
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
```

Este endpoint valida un código de invitación y registra el correo del usuario. Regresa información del usuario que se acaba de registrar.

HTTP Request  | Name Endpoint  |  Endpoint
--------------|----------------|----------------------
POST          | Activate code  | {{url}}/api/code_activation

### Headers
No requerido

### Body
Key                   | Type   | Mandatory
----------------------|--------|----------
email                 | String | Obligatorio
code                  | String | Obligatorio







## Valida código de registro
>Valida código de registro:

```java
{
    "code": "AS4QAD22"
}

```
```javascript
{
    "success": 1,
    "message": "Código validado correctamente",
    "data": null
}

```
```csharp
{
    "success": 1,
    "message": "El código de invitación no es válido",
    "data": null
}
```

Este endpoint valida un código de invitación para proceder al registro.

HTTP Request  | Name Endpoint  |  Endpoint
--------------|----------------|----------------------
POST          | Activate code  | {{url}}/api/code_validation

### Headers
No requerido

### Body
Key                   | Type   | Mandatory
----------------------|--------|----------------
code                  | String | Obligatorio







## Register user App
>Register user App:

```java
{
  	"code": "ABCDEF",
  	"email": "roberto@kokonutstudio.com",
  	"name": "Magdiel",
  	"first_lastname": "Juarez",
  	"second_lastname": "Guerrero",
  	"birthdate": "1991-01-19",
  	"home_phone": "5512341234",
  	"cell_phone": "5512341234",
  	"password": "123Qwe1",
  	"emergency_contacts": [
        {
      		"name": "Mom",
      		"first_lastname": "Jua",
      		"second_lastname": "Gue",
      		"cell_phone": "5512341234",
      		"job_phone": "5511111111",
      		"relationship": "mother"
        }, {
      		"name": "Dad",
      		"first_lastname": "Jua",
      		"second_lastname": "Gue",
      		"cell_phone": "5512341234",
      		"job_phone": "5511111111",
      		"relationship": "father"
        }
    ],
  	"location": {
    		"address": "Address",
    		"latitude": "00.00000",
    		"longitude": "00.00000"
  	}
}

```
```javascript
{
    "success": 1,
    "message": "Usuario creado con éxito",
    "data": null
}
```
```csharp
{
    "success": 1,
    "message": "El código de invitación no es válido",
    "data": null
}
```

Este endpoint valida un código de invitación para proceder al registro.

HTTP Request  | Name Endpoint  |  Endpoint
--------------|----------------|----------------------
POST          | Activate code  | {{url}}/api/signup

### Headers
Key           | Value
--------------|-----------------------------
Content-Type  | application/json
Accept        | application/json

### Raw
Key                   | Type   | Mandatory
----------------------|--------|----------------
code                  | String | Obligatorio
email                 | String | Obligatorio
name                  | String | Obligatorio
first_lastname        | String | Obligatorio
second_lastname       | String | Obligatorio
birthdate             | String | Obligatorio
home_phone            | String | Obligatorio
cell_phone            | String | Obligatorio
password              | String | Obligatorio
emergency_contacts *  | Array  | Obligatorio
location **           | Array  | Obligatorio

### *emergency_contacts
namespace             | Type   | Mandatory
----------------------|--------|---------------
name                  | String | Obligatorio
first_lastname        | String | Obligatorio
second_lastname       | String | Obligatorio
cell_phone            | String | Obligatorio
job_phone             | String | Obligatorio
relationship          | String | Obligatorio

### **location
namespace             | Type   | Mandatory
----------------------|--------|---------------
address               | String | Obligatorio
latitude              | String | Obligatorio
longitude             | String | Obligatorio


### Tipo de tag de 'relationship' que se aceptan

tag       | Rol
----------|--------------------
 mother   | Madre
 father   | Padre
 son      | Hijo(a)
 brother  | Hermano(a)
 husband  | Esposo(a)
 other    | Otro


```
{
  	"code": "ABCDEF",
  	"email": "roberto@kokonutstudio.com",
  	"name": "Magdiel",
  	"first_lastname": "Juarez",
  	"second_lastname": "Guerrero",
  	"birthdate": "1991-01-19",
  	"home_phone": "5512341234",
  	"cell_phone": "5512341234",
  	"password": "123Qwe1",
  	"emergency_contacts": [
        {
      		"name": "Mom",
      		"first_lastname": "Jua",
      		"second_lastname": "Gue",
      		"cell_phone": "5512341234",
      		"job_phone": "5511111111",
      		"relationship": "mother"
        }, {
      		"name": "Dad",
      		"first_lastname": "Jua",
      		"second_lastname": "Gue",
      		"cell_phone": "5512341234",
      		"job_phone": "5511111111",
      		"relationship": "father"
        }
    ],
  	"location": {
    		"address": "Address",
    		"latitude": "00.00000",
    		"longitude": "00.00000"
  	}
}
```    






## Mostrar perfil logueado
>Mostrar perfil logueado:

```java
// No aplica
```
```javascript
{
    "success": 1,
    "message": "Consulta de información exitosa",
    "data": {
        "id": "eyJpdiI6I...",
        "name": "Interphy",
        "first_lastname": null,
        "second_lastname": null,
        "birthdate": null,
        "home_phone": null,
        "cell_phone": null,
        "email": "magdiel@interphysoft.com",
        "address": null,
        "status": 1,
        "created_at": null,
        "updated_at": "2020-02-25T17:28:08.000000Z",
        "login_status": null,
        "cat_type_user_id": 1
    }
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
```
Este endpoint muestra la información básica del usuario logueado

HTTP Request  | Name Endpoint          | Endpoint
--------------|------------------------|---------------------
GET           | Show personal profile  | {{url}}/api/oauth/users/me

### Headers
Key           | Value
--------------|-----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
No requerido.





## Mostrar perfil
>Mostrar perfil:

```java
// No aplica
```
```javascript
{
    "success": 1,
    "message": "Consulta de información exitosa",
    "data": [
        {
          "id": "eyJpdiI6I...",
          "name": "Interphy",
          "first_lastname": null,
          "second_lastname": null,
          "birthdate": null,
          "home_phone": null,
          "cell_phone": null,
          "email": "magdiel@interphysoft.com",
          "address": null,
          "status": null,
          "created_at": null,
          "updated_at": "2020-02-12 23:00:02",
          "deleted_at": null,
          "login_status": null,
          "cat_type_user_id": 1
        }
    ]
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
```
Este endpoint muestra la información básica de un usuario respecto de su ID


HTTP Request  | Name Endpoint | Endpoint
--------------|---------------|---------------------
GET           | Show profile  | {{url}}/api/oauth/users/{encrypted_user_id}

### Headers
Key           | Value
--------------|-----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
No requerido.




## Listado usuarios primarios
>Listado usuarios primarios:

```java
// No aplica
```
```javascript
{
    "success": 0,
    "message": "Consulta de información correcta",
    "data": [
        {
            "primary_user": {
                "id": "eyJpdiI6I...",
                "name": "Interphy",
                "first_lastname": null,
                "second_lastname": null,
                "birthdate": null,
                "home_phone": null,
                "cell_phone": null,
                "email": "magdiel@interphysoft.com",
                "address": null,
                "status": null,
                "created_at": null,
                "updated_at": "2020-02-12 23:00:02",
                "deleted_at": null,
                "login_status": null,
                "cat_type_user_id": 1,
                "uuid": "1ab09c0f-f911-4a05-ac35-c00284160447"
            },
            "location": {
                "id": 1,
                "fk_users_id": "2",
                "latitude": "19.388235",
                "longitude": "-99.163294",
                "address": "2ᵃ Cda. Concepción Beistegui 6, Narvarte Poniente, Benito Juárez, 03100 Ciudad de México, CDMX",
                "description": "Software Company",
                "created_at": null,
                "updated_at": null
            },
            "secondary_users": [
                {
                    "secondary_user": {
                        "id": "eyJpdiI6I...",
                        "name": null,
                        "first_lastname": null,
                        "second_lastname": null,
                        "birthdate": null,
                        "home_phone": null,
                        "cell_phone": null,
                        "email": "magdiel@kokonutstudio.com",
                        "address": null,
                        "status": null,
                        "created_at": "2020-02-12 23:07:58",
                        "updated_at": "2020-02-13 19:58:52",
                        "deleted_at": null,
                        "login_status": null,
                        "cat_type_user_id": 2,
                        "uuid": "1ab09c0f-f911-4a05-ac35-c00284160447"
                    },
                    "location": {
                        "id": 2,
                        "fk_users_id": "3",
                        "latitude": "19.388235",
                        "longitude": "-99.163294",
                        "address": "2ᵃ Cda. Concepción Beistegui 6, Narvarte Poniente, Benito Juárez, 03100 Ciudad de México, CDMX",
                        "description": "Software Company",
                        "created_at": null,
                        "updated_at": null
                    }
                }
            ]
        },
        {
            "primary_user": {
                "id": "eyJpdiI6I...",
                "name": null,
                "first_lastname": null,
                "second_lastname": null,
                "birthdate": null,
                "home_phone": null,
                "cell_phone": null,
                "email": "magdiel@interphy.com",
                "address": null,
                "status": null,
                "created_at": "2020-02-12 17:55:39",
                "updated_at": "2020-02-13 23:22:47",
                "deleted_at": null,
                "login_status": null,
                "cat_type_user_id": 1
            },
            "location": {
                "id": 3,
                "fk_users_id": "4",
                "latitude": "19.388235",
                "longitude": "-99.163294",
                "address": "2ᵃ Cda. Concepción Beistegui 6, Narvarte Poniente, Benito Juárez, 03100 Ciudad de México, CDMX",
                "description": "Software Company",
                "created_at": null,
                "updated_at": null
            },
            "secondary_users": []
        }
    ]
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
```
Este endpoint lista los usarios primarios con sus respectivos usuarios secundarios, devuelve la información con IDs encryptados


HTTP Request  | Name Endpoint | Endpoint
--------------|---------------|---------------------
GET           | List users    | {{url}}/api/oauth/users

### Headers
Key           | Value
--------------|-----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
No requerido.







## Editar usuario
>Editar usuario:

```java
{
    "user_id": "eyJpdiI6I...",
    "name": "Interphy",
    "first_lastname": null,
    "second_lastname": null,
    "birthdate": null,
    "home_phone": null,
    "cell_phone": null,
    "email": "magdiel@interphysoft.com",
    "address": null,
    "device_id": "89ABCDEF-01234567-89ABCDEF",
    "firebase_token": "akdfbve82b4e...",
}
```
```javascript
{
    "success": 1,
    "message": "Información de usuario actualizada correctamente",
    "data": null
}
```
```csharp
{
    "success": 0,
    "message": "Error al obtener los contactos de emergencia",
    "data": null
}
{
    "success": 0,
    "message": "El ID de usuario es inválido",
    "data": null
}
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
```
Este endpoint actualizará la información de un usuario respecto de los parámetros en el Body de la petición

HTTP Request  | Name Endpoint   |  Endpoint
--------------|-----------------|----------------------
POST          | Update profile  | {{url}}/api/oauth/update_user

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
Key                   | Type   | Mandatory
----------------------|--------|----------
user_id               | String | Obligatorio (Encrypted)
name                  | String | Opcional
first_lastname        | String | Opcional
second_lastname       | String | Opcional
birthdate             | String | Opcional
home_phone            | String | Opcional
cell_phone            | String | Opcional
email                 | String | Opcional
address               | String | Opcional
device_id             | String | Opcional
firebase_token        | String | Opcional






## Deshabilitar usuario
>Deshabilitar usuario:

```java
{
    "user_id": "eyJpdiI6I..."
}
```
```javascript
{
    "success": 1,
    "message": "Información de usuario actualizada correctamente",
    "data": null
}
```
```csharp
{
    "success": 0,
    "message": "Hubo un error al actualizar la información de usuario",
    "data": null
}
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
```
Este endpoint habilitará/deshabilitará a un usuario

HTTP Request  | Name Endpoint   |  Endpoint
--------------|-----------------|----------------------
POST          | Disable profile | {{url}}/api/oauth/disable_user

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
Key                   | Type   | Mandatory
----------------------|--------|----------
user_id               | String | Obligatorio (Encrypted)






## Detalle de usuario
>Detalle usuario:

```java
{
    "user_id": "eyJpdiI6I..."
}
```
```javascript
{
    "success": 1,
    "message": "Detalle de información realizada con éxito",
    "data": {
        "primary_user": {
            "id": "eyJpdiI6...",
            "name": "Interphy",
            "first_lastname": null,
            "second_lastname": null,
            "birthdate": null,
            "home_phone": null,
            "cell_phone": null,
            "email": "magdiel@interphysoft.com",
            "address": null,
            "status": 1,
            "created_at": null,
            "updated_at": "2020-02-25T17:28:08.000000Z",
            "login_status": null,
            "cat_type_user_id": 1,
            "uuid": "1ab09c0f-f911-4a05-ac35-c00284160447",
            "emergency_contacts": [
                {
                    "id": 1,
                    "name": "Alfa",
                    "first_lastname": "Beta",
                    "second_lastname": "Gama",
                    "cell_phone": "5511112222",
                    "job_phone": "5511112222",
                    "relationship": null,
                    "fk_users_id": 2,
                    "created_at": "2020-02-18 20:09:42",
                    "updated_at": "2020-02-18 20:09:42"
                }
            ]
        },
        "history_locations": [
            {
                "id": 1,
                "fk_users_id": 2,
                "latitude": "19.396",
                "longitude": "-99.1561",
                "address": null,
                "description": null,
                "created_at": "2020-02-12 17:55:39",
                "updated_at": "2020-02-12 17:55:39"
            },
            {
                "id": 2,
                "fk_users_id": 2,
                "latitude": "19.396",
                "longitude": "-99.1561",
                "address": null,
                "description": null,
                "created_at": "2020-02-12 14:55:39",
                "updated_at": "2020-02-12 17:55:39"
            },
            {
                "id": 3,
                "fk_users_id": 2,
                "latitude": "19.396",
                "longitude": "-99.1561",
                "address": null,
                "description": null,
                "created_at": "2020-02-12 16:55:39",
                "updated_at": "2020-02-12 17:55:39"
            }
        ],
        "secondary_users": [
            {
                "secondary_user": {
                    "id": "eyJpdiI6In...",
                    "name": null,
                    "first_lastname": null,
                    "second_lastname": null,
                    "birthdate": null,
                    "home_phone": null,
                    "cell_phone": null,
                    "email": "magdiel@kokonutstudio.com",
                    "address": null,
                    "status": 1,
                    "created_at": "2020-02-12T23:07:58.000000Z",
                    "updated_at": "2020-02-13T19:58:52.000000Z",
                    "login_status": null,
                    "cat_type_user_id": 2,
                    "uuid": "1ab09c0f-f911-4a05-ac35-c00284160447",
                },
                "last_location": {
                    "id": 5,
                    "fk_users_id": 8,
                    "latitude": "0",
                    "longitude": "0",
                    "address": "Address",
                    "description": null,
                    "created_at": "2020-03-17 22:56:20",
                    "updated_at": "2020-03-17 22:56:20"
                }
            }
        ]
    }
}
```
```csharp
{
    "success": 0,
    "message": "Hubo un error al actualizar la información de usuario",
    "data": null
}
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
```
Este endpoint mostrará la información de un usuario, usuarios de emergencia, su última ubicación y un listado de sus respectivos usuarios secundarios, cada uno con su última ubicación.

HTTP Request  | Name Endpoint   |  Endpoint
--------------|-----------------|----------------------
POST          | Disable profile | {{url}}/api/oauth/detail_primary

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
Key                   | Type   | Mandatory
----------------------|--------|----------
user_id               | String | Obligatorio (Encrypted)








## Contactos de emergencia
>Contactos de emergencia:

```java
{
    "user_id": "eyJpdiI6I..."
}
```
```javascript
{
    "success": 1,
    "message": "Usuarios obtenidos con éxito",
    "data": [
        {
            "id": 1,
            "name": "Alfa",
            "first_lastname": "Beta",
            "second_lastname": "Gama",
            "cell_phone": "5511112222",
            "job_phone": "5511112222",
            "relationship": null,
            "fk_users_id": 2,
            "created_at": "2020-02-18 20:09:42",
            "updated_at": "2020-02-18 20:09:42"
        }
    ]
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
```

Este endpoint mostrará la información de los contactos de emergencia respecto del ID   de un usuario

HTTP Request  | Name Endpoint              |  Endpoint
--------------|----------------------------|----------------------
POST          | Emergency contacts         | {{url}}/api/oauth/emergency_contact

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
Key                   | Type   | Mandatory
----------------------|--------|----------
user_id               | String | Obligatorio (Encrypted)









## Obtener código de activación
>Obtener código de activación:

```java
{
    "user_id":3
}
```
```javascript
{
    "success": 1,
    "message": "Información de código",
    "data": {
        "code": "CASWLSYNEF",
        "quantity": 10
    }
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
{
    "success": 0,
    "message": "No cuentas con permisos suficientes",
    "data": null
}

{
    "success": 0,
    "message": "No existe el usuario",
    "data": null
}

{
    "success": 0,
    "message": "No hay códigos asociados",
    "data": null
}
{
    "success": 0,
    "message": "Primero se necesita eliminar otro usuario secundario",
    "data": null
}
```

Este endpoint devolverá el código de activación de un usuario y la cantidad de usuarios asignada si tiene

HTTP Request  | Name Endpoint              |  Endpoint
--------------|----------------------------|----------------------
POST          | Get Code Invitation        | {{url}}/api/oauth/get_code

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
Key                   | Type   | Mandatory
----------------------|--------|----------
user_id               | String | Obligatorio








## Actualizar código de activación
>Actualizar código de activación:

```java
{
    "user_id":3,
    "quantity": 4
}
```
```javascript
{
    "success": 1,
    "message": "Actualización de usuarios secundarios",
    "data": null
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
{
    "success": 0,
    "message": "No cuentas con permisos suficientes",
    "data": null
}

{
    "success": 0,
    "message": "No existe el usuario",
    "data": null
}

{
    "success": 0,
    "message": "No hay códigos asociados",
    "data": null
}
{
    "success": 0,
    "message": "Primero se necesita eliminar otro usuario secundario",
    "data": null
}
```

Este endpoint actualiza la cantidad de usuarios asignados

HTTP Request  | Name Endpoint              |  Endpoint
--------------|----------------------------|----------------------
POST          | Update Code Invitation     | {{url}}/api/oauth/update_code_qtt

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
Key                   | Type   | Mandatory
----------------------|--------|----------
user_id               | Int    | Obligatorio
quantity              | Int    | Obligatorio









#Ubicaciones
## Última ubicación
>Última ubicación:

```java
{
    "user_id": "eyJpdiI6I..."
}
```
```javascript
{
    "success": 1,
    "message": "Consulta de información correcta",
    "data": {
        "id": 1,
        "fk_users_id": 2,
        "latitude": "19.395965",
        "longitude": "-99.156067",
        "address": null,
        "description": null,
        "created_at": "2020-02-12 17:55:39",
        "updated_at": "2020-02-12 17:55:39"
    }
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
```
Este endpoint regresará la última ubicación registrada de un usuario respecto de su ID

HTTP Request  | Name Endpoint   |  Endpoint
--------------|-----------------|----------------------
POST          | Last ubication  | {{url}}/api/oauth/last_location

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
Key                   | Type   | Mandatory
----------------------|--------|----------
user_id               | String | Obligatorio (Encrypted)





## Historial de ubicaciones
>Historial de ubicaciones:

```java
{
    "user_id": "eyJpdiI6I..."
}
```
```javascript
{
    "success": 1,
    "message": "Consulta de información correcta",
    "data": [
        {
            "id": 1,
            "fk_users_id": 2,
            "latitude": "19.395965",
            "longitude": "-99.156067",
            "address": null,
            "description": null,
            "created_at": "2020-02-12 17:55:39",
            "updated_at": "2020-02-12 17:55:39"
        },
        {
            "id": 3,
            "fk_users_id": 2,
            "latitude": "19.395965",
            "longitude": "-99.156067",
            "address": null,
            "description": null,
            "created_at": "2020-02-12 16:55:39",
            "updated_at": "2020-02-12 17:55:39"
        },
        {
            "id": 2,
            "fk_users_id": 2,
            "latitude": "19.395965",
            "longitude": "-99.156067",
            "address": null,
            "description": null,
            "created_at": "2020-02-12 14:55:39",
            "updated_at": "2020-02-12 17:55:39"
        }
    ]
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
```
Este endpoint regresará el historial de ubicaciones registradas de un usuario respecto de su ID

HTTP Request  | Name Endpoint       |  Endpoint
--------------|---------------------|----------------------
POST          | History ubication   | {{url}}/api/oauth/history_location

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
Key                   | Type   | Mandatory
----------------------|--------|----------
user_id               | String | Obligatorio (Encrypted)





## Actualizar ubicación
> Actualizar ubicación:

```java
{
    "user_id": "eyJpdiI6I...",
    "latitude": "00.000000",
    "longitude": "00.00000."
}
```
```javascript

{
      "success": 1,
      "message": "Se actualizó la ubicación con éxito",
      "data": null
  }
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
```
Este endpoint actualiza la última ubicación del usuario. Además de esto, agrega al historial la anterior ubicación.

HTTP Request  | Name Endpoint       |  Endpoint
--------------|---------------------|----------------------
POST          | Update ubication   | {{url}}/api/oauth/update_location

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
Key                   | Type   | Mandatory
----------------------|--------|----------
user_id               | String | Obligatorio (Encrypted)
latitude              | String | Obligatorio
longitude             | String | Obligatorio





# Solicitudes de ayuda App
## Solicitud SOS
> Solicitud SOS:

```java
{
    "address": "Some Address",
    "lat": "00.000000",
    "long": "00.000000",
}
```
```javascript

{
      "success": 1,
      "message": "Se actualizó la ubicación con éxito",
      "data": null
  }
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
```
Este endpoint lanza una solicitud SOS desde la aplicación para el CMS.

HTTP Request  | Name Endpoint       |  Endpoint
--------------|---------------------|----------------------
POST          | Solicitud SOS       | {{url}}/api/oauth/new_alert_sos

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
Key                | Type     | Mandatory
-------------------|----------|----------
address            | String   | Opcional
latitude           | String   | Obligatorio
longitude          | String   | Obligatorio



Además de lo anterior, este endpoint generará una notificación (Websocket) al CMS con la siguiente información del usuario que lanzó la notificación: <Enter>

<br />
<br />
```
{
   "user_id":"eyJpdiI6...", <br />
   "nombre":"magdiel juarez guerrero", <br />
   "latitude":"00.000000", <br />
   "longitude":"00.000000", <br />
   "alert_id":53 <br />
}
```

### Websocket
Key                | Type     | Mandatory
-------------------|----------|----------
user_id            | String   | Obligatorio (Encrypted)
nombre             | String   | Obligatorio
latitude           | String   | Obligatorio
longitude          | String   | Obligatorio






## Editar estado solicitud SOS
> Editar estado solicitud SOS:


### Estatus de solicitudes SOS
ID | Estatus
---|----------------------
2  | Se emitió alerta, se atendió y se finalizó
1  | Se emitió alerta y se está atendiendo
0  | Se emitió alerta y no se ha atendido



```java
{
    "alert_id": 132,
    "status": 0
}
```
```javascript
{
    "success": 1,
    "message": "Se actualizó la solicitud móvil con éxito",
    "data": null
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}

{
    "success": 0,
    "message": "No existe la alerta seleccionada",
    "data": []
}

```
Este endpoint edita el estatus de una solicitud SOS desde CMS.

HTTP Request  | Name Endpoint       |  Endpoint
--------------|---------------------|----------------------
POST          | Alert SOS edit      | {{url}}/api/oauth/status_alert_sos

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
Key                | Type     | Mandatory
-------------------|----------|----------
alert_id           | int      | Obligatorio
status             | Int      | Obligatorio






## Response Solicitud SOS
> Response Solicitud SOS:

```java
{
    "alert_id": 32,
    "response": 1
}
```
```javascript

{
      "success": 1,
      "message": "Se actualizó el estatus de esta alerta",
      "data": null
  }
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}

{
    "success": 0,
    "message": "Falla al actualizar el estatus de esta alerta",
    "data": []
}

{
    "success": 0,
    "message": "No existe la alerta seleccionada",
    "data": []
}
```
Este endpoint manda una solicitud SOS después de que el usuario dice que sí necesita ayuda en la app.

HTTP Request  | Name Endpoint       |  Endpoint
--------------|---------------------|----------------------
POST          | Response push       | {{url}}/api/oauth/response_push

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
Key                | Type     | Mandatory
-------------------|----------|----------
alert_id           | Int      | Obligatory
response           | Boolean  | Obligatory








## Listado solicitudes SOS
> Listado solicitude SOS:

```java
No requerido
```
```javascript
{
    "success": 1,
    "message": "Se envío la solicitud móvil con éxito",
    "data": [
        {
             "id": 273,
             "fk_user_id": 68,
             "fullname": "Saúl Negrete Gaytán",
             "address": "Calle Tenango 1, Lomas del Capulín, La Magdalena Contreras, 01860 Ciudad de México, CDMX, Mexico",
             "created_at": "2020-05-25T19:26:09.000000Z",
             "updated_at": "2020-05-25T19:26:09.000000Z",
             "status": 0,
             "latitude": "19.3063173",
             "longitude": "-99.2697627",
             "audio_alert": null
         },
         {
             "id": 272,
             "fk_user_id": 5,
             "fullname": "Dev Secondary ",
             "address": "Luna 9, Jardines de Cuernavaca, 62360 Cuernavaca, Mor., Mexico",
             "created_at": "2020-05-23T19:35:55.000000Z",
             "updated_at": "2020-05-23T19:35:55.000000Z",
             "status": 0,
             "latitude": "18.926920257",
             "longitude": "-99.20692127",
             "audio_alert": "https://cas-audios.s3.us-east-2.amazonaws.com/audio/1590262559-zghcA-audio.m4a"
         },
         {
             "id": 271,
             "fk_user_id": 5,
             "fullname": "Dev Secondary ",
             "address": "Luna 9, Jardines de Cuernavaca, 62360 Cuernavaca, Mor., Mexico",
             "created_at": "2020-05-23T18:50:22.000000Z",
             "updated_at": "2020-05-23T18:50:22.000000Z",
             "status": 0,
             "latitude": "18.926920257",
             "longitude": "-99.20692127",
             "audio_alert": "https://cas-audios.s3.us-east-2.amazonaws.com/audio/1590259828-j5vu1-audio.m4a"
         },
        ...
    ]
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
```
Este endpoint lista todas las solicitudes SOS en el CMS.

HTTP Request  | Name Endpoint       |  Endpoint
--------------|---------------------|----------------------
GET           | List SOS            | {{url}}/api/oauth/list_alert_sos

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
No requerido







# Push notifications
##Nueva push desde CMS
> Nueva push:

```java
{
    "type_alert": "A",
    "fk_user_sender": "2",
    "title": "Title",
    "description": "Some description",
    "latitude": "00.000000",
    "longitude": "00.000000",
    "address": "Some address description",
    "to_all": 1,
    "date_event": "2020-01-01 00:00:00"
}
```
```javascript
{
    "success": 1,
    "message": "Push enviada correctamente",
    "data": []
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
{
    "success": 0,
    "message": "Falló la generación de push",
    "data": []
}
```

Este endpoint enviará push notifications a los usuarios correspondientes

HTTP Request  | Name Endpoint       |  Endpoint
--------------|---------------------|----------------------
POST          | New Push            | {{url}}/api/oauth/new_push

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
Key                | Type     | Mandatory
-------------------|----------|----------
user_id            | String   | Obligatorio
type_alert         | String   | Obligatorio
title              | String   | Opcional
description        | String   | Opcional
latitude           | String   | Obligatorio
longitude          | String   | Obligatorio
address            | String   | Opcional
to_all             | Boolean  | Obligatorio
date_event         | Datetime | Obligatory










## Push listado CMS
> Push listado:

```java
No requerido
```
```javascript
{
    "success": 1,
    "message": "Consulta de alertas exitosa",
    "data": [
        {
            "id": 1,
            "fk_user_sender": 2,
            "type_alert": null,
            "title": null,
            "description": null,
            "created_at": "2020-03-03 19:17:24",
            "updated_at": "2020-03-03 19:17:24",
            "latitude": null,
            "longitude": null,
            "address": null
        }
    ]
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
{
    "success": 0,
    "message": "Falló la consulta de alertas",
    "data": []
}
```

Este endpoint listará todas las push notifications

HTTP Request  | Name Endpoint       |  Endpoint
--------------|---------------------|----------------------
GET           | Push list           | {{url}}/api/oauth/alerts

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
No requerido







## Push detail CMS
> Push detail:

```java
No requerido
```
```javascript
{
    "success": 1,
    "message": "Consulta de alerta exitosa",
    "data": {
        "alert": {
            "id": 1,
            "fk_user_sender": 2,
            "type_alert": "A",
            "title": "title",
            "description": "description",
            "created_at": "2020-03-03 19:17:24",
            "updated_at": "2020-03-03 19:17:24",
            "latitude": 0,
            "longitude": 0,
            "address": "address"
        },
        "detail_alert": [
            {
                "id_send_to": "eyJpdiI6Il...",
                "send_to": "Interphy  ",
                "status": null,
                "created_at": null,
                "updated_at": "2020-03-06T16:45:17.000000Z"
            }
        ]
    }
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
{
    "success": 0,
    "message": "Consulta de alerta fallida",
    "data": []
}
```

Este endpoint mostrará información detallada de una notificación y los usuarios a los que fué enviada.

HTTP Request  | Name Endpoint       |  Endpoint
--------------|---------------------|----------------------
GET           | Push detail         | {{url}}/api/oauth/alerts/{alert_id}

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
No requerido










# Alerts APP
## Alerts list
> Alerts list:

```java
No requerido
```
```javascript
{
    "success": 1,
    "message": "Consulta de alertas exitosa",
    "data": [
        {
            "id": 1,
            "fk_user_sender": 2,
            "type_alert": "A",
            "title": "title",
            "description": "description",
            "created_at": "2020-03-03 19:17:24",
            "updated_at": "2020-03-03 19:17:24",
            "latitude": 0,
            "longitude": 0,
            "address": "address"
        }
    ]
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
```

Este endpoint listará las notificaciones que le hayan llegado aun usuario en la aplicación.

HTTP Request  | Name Endpoint       |  Endpoint
--------------|---------------------|----------------------
GET           | Push detail         | {{url}}/api/oauth/mobile_alerts

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
No requerido





## Alert modify status
> Alert modify status:

```java
No requerido
```
```javascript
{
    "success": 1,
    "message": "Se actualizó la alerta móvil con éxito",
    "data": null
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
```

Este endpoint deshabilitará una solicitud de ayuda enviada desde el móvil

HTTP Request  | Name Endpoint       |  Endpoint
--------------|---------------------|----------------------
GET           | Alert modify status | {{url}}/api/oauth/disable_mobilealert/{alert_id}

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
No requerido








# Staff
## Staff list
> Staff list:

```java
No requerido
```
```javascript
{
    "success": 1,
    "message": "Se actualizó la alerta móvil con éxito",
    "data": null
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
```

Este endpoint lista el equipo de staff en el CMS.

HTTP Request  | Name Endpoint       |  Endpoint
--------------|---------------------|----------------------
GET           | Staff list          | {{url}}/api/oauth/staff

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
No requerido







## Staff creation
> Staff creation:

```java
{
    "name": "Name",
    "first_lastname": "Lastname 1",
    "second_lastname": "Lastname 2",
    "email": "email@xample.com",
    "password": "123Qwe1",
    "type_user_id": 3
}
```
```javascript
{
    "success": 1,
    "message": "Creación de usuario staff exitoso",
    "data": null
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
{
    "success": 0,
    "message": "Este correo ya ha sido registrado",
    "data": null
}
```

Este endpoint crea un nuevo usuario del equipo de staff en CMS.

HTTP Request  | Name Endpoint       |  Endpoint
--------------|---------------------|----------------------
POST          | Staff creation      | {{url}}/api/oauth/staff

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
Key                 | Type     | Mandatory
--------------------|----------|----------
name                | String   | Obligatorio
first_lastname      | String   | Obligatorio
second_lastname     | String   | Obligatorio
email               | String   | Obligatorio
password            | String   | Obligatorio
cat_type_user_id    | Int      | Obligatorio

### Value cat_type_user_id
Refers              | Value   
--------------------|---------
Moderador           | 3
Admin               | 4   





## Staff update
> Staff update:

```java
{
    "staff_id": "eyJpdiI6Ik1...",
    "name": "Name",
    "first_lastname": "Lastname 1",
    "second_lastname": "Lastname 2",
    "email": "email@xample.com",
    "cat_type_user_id": 3
}
```
```javascript
{
    "success": 1,
    "message": "Actualización de usuario staff exitoso",
    "data": null
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
```

Este endpoint actualiza un usuario del equipo de staff desde CMS

HTTP Request  | Name Endpoint       |  Endpoint
--------------|---------------------|----------------------
POST          | Staff update        | {{url}}/api/oauth/update_staff

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
Key                 | Type     | Mandatory
--------------------|----------|----------
staff_id            | String   | Obligatorio (Encrypted)
name                | String   | Opcional
first_lastname      | String   | Opcional
second_lastname     | String   | Opcional
email               | String   | Opcional
password            | String   | Opcional
cat_type_user_id    | Int      | Obligatorio

### Value cat_type_user_id
Refers              | Value   
--------------------|---------
Moderador           | 3
Admin               | 4   







## Staff delete
> Staff delete:

```java
No requerido
```
```javascript
{
    "success": 1,
    "message": "Se ha eliminado el personal del staff",
    "data": null
}
```
```csharp
{
    "success": 0,
    "message": "No estás logueado",
    "data": []
}
```

Este endpoint elimina un usuario del equipo de staff desde CMS

HTTP Request  | Name Endpoint       |  Endpoint
--------------|---------------------|----------------------
DELETE        | Staff Delete        | {{url}}/api/oauth/staff/{encrypted_staff_id}

### Headers
Key           | Value
--------------|----------------------------
Authorization | Bearer eyJ0eXAiOiJKV1Q...

### Body
No requerido
