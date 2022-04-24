## 🎯 Goal

Create a basic messaging API that enables code to send short messages through an SMS API platform.

## 📜 Main Use Case

Once you've set up a functional SMS API, it will help you:
-  Send and receive messages in different forms
-  Review the status of all your messages in real time

## 🦄 Features

-   Simple, reliable messaging
-   End-to-end message encryption

## 🧰 Prerequisites

#### Source Code
- Clone [repository](https://github.com/lcubestudios/messagingapp-docker) (run the following command inside the terminal)

    ```sh
    git clone https://github.com/lcubestudios/messagingapp-docker
    cd messagingapp-docker
    ```
    > Keep this terminal active, this is where you will be required to run the commands stated below

#### Docker
- Follow [this link](https://docs.docker.com/engine/install/) to install Docker on your environment

#### Postman
- [Download](https://www.postman.com/downloads/) Postman
- Follow [How to Guide](https://learning.postman.com/docs/getting-started/importing-and-exporting-data/) to Import Postman [Collection](https://www.getpostman.com/collections/3692a0aa4daa3d16f40c)

---

## OPTION 1 - 🐳 Docker 
> Setup time 15 min

This method allows the application to easily be installed and deployed in a Docker container.

The application can be deployed in a local machine or directly on to a server. By default, the Docker image will expose ports 80, 8080, 5432.

Images used:
- php:8.1-apache
- postgres:14
- bitnami/phppgadmin 

When ready, simply use Docker compose to build the image.

##### Before you start
- Make sure you have completed the tasks mentioned in the [Prerequisites](#-prerequisites) section above before proceeding
- Make sure there are no other containers using the same server ports. (Stop running any existing container or change the default application port
- Delete any old version of the image & volume.
- Check your internet connection.

#### Step 1: Set up environment

1. Duplicate the `.env.sample` file and rename it to `.env`
2. Update `.env` variables

    ```
    ## DATABASE ##
    DB_USER=“YOUR_DB_USERNAME”
    DB_PASSWORD=“YOUR_DB_PASSWORD”
    DB_PORT=YOUR_PORT
    ```
#### Step 2: Initialize Docker

1. Start Docker Service/Application
2. Run the following command inside the terminal in the project root directory
    > This will create the Docker image and pull in the necessary dependencies.

    If this is your first time running Docker run:
    ```sh
    docker compose up -d
    ``` 
    Otherwise run:
    ```
    docker compose up -d –-build
    ```

3. Verify containers are running (run the following command inside the terminal)

    ```sh
    docker ps -a
    ```

#### Step 3: Test endpoints
1. In **POSTMAN** Update `server` variable in the collection to your server address
2. Test CRUD commands in **POSTMAN** collection: `GET`, `PUT`, `POST`, `DELETE`

#### 🎉 DONE
---

## OPTION 2 - Building from source
> Setup time 15-30 min

Below you will are the repos used to build this container image, you can follow the instructions inside each repository.
- [Messaging App front-end code](https://github.com/lcubestudios/messagingapp-frontend)
- [Messagng App back-end code](https://github.com/lcubestudios/messagingapp-api)

#### 🎉 DONE
---

## How to use the solution

#### Auth
> Login

##### Endpoint: 
`{{server}}/{{reponame}}/auth.php?purpose=login`

##### Query Parameters: 
- Body JSON

```json
{
    "phone_number": 1234567890,
    "password": "Helloworld!"
}
```
##### Example:

**POST** http://serverip/messagingapp-api/auth.php?purporse=login

**response**

```json
{
    "status_code": 200,
    "message": "Login sucessful!",
    "results": {
        "token": "Your token",
        "first_name": "Your name",
        "last_name": "Your last name",
        "phone_number": 1234567890
    }
}
```

#### Auth 
> Register

##### Endpoint: 
`{{server}}/{{reponame}}/auth.php?purpose=reg`

##### Query Parameters: 
- Body JSON

```json
{
    "first_name": "John",
    "last_name": "Doe",
    "phone_number": 1234567890,
    "password": "Helloworld!"
}
```

##### Example:

**POST** http://serverip/messagingapp-api/auth.php?purporse=reg

**response**

```json
{
    "status_code": 200,
    "message": "User has been created",
    "results": {
        "token": "Your Token",
        "first_name": "Your name",
        "last_name": "Your last name",
        "phone_number": 1234567890
    }
}
```

#### Contact
>Load Contacts

##### Endpoint: 
`{{server}}/{{reponame}}/contacts.php`

##### Query Parameters: 
- Authorization Bearer Token - `Token: <token>`

##### Example:

**GET** http://serverip/messagingapp-api/contacts.php

**response**

```json
{
    "status_code": 200,
    "contacts": [
        {
            "phone_number": "1234567890",
            "first_name": "John",
            "last_name": "Doe",
            "u_id": "2",
            "unread": "0"
        }
    ]
}
```

#### Contact 
> Add Contact

##### Endpoint: 
`{{server}}/{{reponame}}/contacts.php`

##### Query Parameters: 
- Authorization Bearer Token - `Token: <token>`
- Body JSON
```json
{
    "phone_number": 1234567890
}
```
##### Example:

**POST** http://serverip/messagingapp-api/contacts.php

**response**

```json
{
    "status_code": 200,
    "message": "Contact added"
}
```

#### Contact 
> Delete Contact

##### Endpoint: 
`{{server}}/{{reponame}}/contacts.php`

##### Query Parameters: 
- Authorization Bearer Token - `Token: <token>`
- Body JSON
```json
{
    "phone_number": 1234567890
}
```
##### Example:

**DELETE** http://serverip/messagingapp-api/contacts.php

**response**

```json
{
    "status_code": 200,
    "message": "Contact has been deleted!"
}

```
#### Profile 
> Update Profile

##### Endpoint: 
`{{server}}/{{reponame}}/profile.php`

##### Query Parameters: 
- Authorization Bearer Token - `Token: <token>`
- Body JSON
```json
{
    "first_name": "John",
    "last_name": "Doe",
    "old_password": "Helloworld!",
    "new_password": "Helloworld!%"
}
```
##### Example:

**PUT** http://serverip/messagingapp-api/profile.php

**response**

```json
{
    "status_code": 200,
    "message": "Profile updated!",
    "profile": {
        "first_name": "John",
        "last_name": "Doe",
        "phone_number": "1234567890",
        "token": "Your token"
    }
}
```
#### Messages
> Load Messages

##### Endpoint: 
`{{server}}/{{reponame}}/messages.php`

##### Query Parameters: 
- Authorization Bearer Token - `Token: <token>`
- Query Params - `?phone_number=1234567890`


##### Example:
**GET** http://serverip/messagingapp-api/messages.php?phone_number=1234567890

**response**

```json
{
    "status_code": 200,
    "messages": [
        {
            "sender_id": "1",
            "receiver_id": "2",
            "body_text": "Hello John, How your doing",
            "messages_read": "f",
            "date_message": "2022-04-18 00:31:11.757233+00",
            "message_id": "1",
            "is_sender": true
        },
        {
            "sender_id": "2",
            "receiver_id": "1",
            "body_text": "Hello Doe, How your doing",
            "messages_read": "t",
            "date_message": "2022-04-18 00:31:57.460954+00",
            "message_id": "2",
            "is_sender": false
        }
    ]
}
```
#### Messages
> Send Message

##### Endpoint: 
`{{server}}/{{reponame}}/messages.php`

##### Query Parameters: 
- Authorization Bearer Token - `Token: <token>`
- Body JSON
```json
{
    "phone_number": 1234567890,
    "body_text": "Hello John, How your doing?"
}
```
##### Example:

**POST** http://serverip/messagingapp-api/messages.php?phone_number=1234567890

**response**

```json
{
    "status_code": 200,
    "message": "message sent"
}
```
#### Messages
> Delete Messages

##### Endpoint: 
`{{server}}/{{reponame}}/messages.php`

##### Query Parameters: 
- Authorization Bearer Token - `Token: <token>`
- Body JSON
```json
{
    "phone_number": 1234567890
}
```
##### Example:

**DELETE** http://serverip/messagingapp-api/messages.php

**response**

```json
{
    "status_code": 200,
    "message": "All messages deleted"
}
```
---

## 👋 Meet the Authors

### Luis Muñoz

- [LinkedIn](https://www.linkedin.com/in/lmunoz0806/)
- [Github](https://github.com/lmunoz0806)

### Dennys Cedeño

- [LinkedIn](https://www.linkedin.com/in/dcedenor/)
- [Github](https://github.com/dennys9415)

## 📣 Connect with LCube Studios
- 🌎 [Website](https://Lcubestudios.io)
- ✉️ [Contact Us]("mailto:Contact@lcubestudios.io")
- 📅 [Let's Meet](https://calendly.com/lcubestudios/30min)
#### Follow Us
- [LinkedIn](https://www.linkedin.com/company/lcubestudios/)
- [Instagram](https://www.instagram.com/lcubestudios)
- [Facebook](https://www.facebook.com/lcubestudiosnyc/)
- [Twitter](https://www.twitter.com/lcubestudios/)
- [Discord](https://discord.com/invite/6Ud9x23zaK)
- [Github](https://github.com/lcubestudios)

## 💡 Let's make your FrameWork