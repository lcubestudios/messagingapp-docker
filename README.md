# Messaging App

[![LCubeStudios](https://badgen.now.sh/badge/Developed%20by/LCube%20Studios/?color=FFCB05)](https://lcubestudios.io)

![Banner](/demo_assets/banner.png?raw=true "Banner")

Messaging App is a microframework for messaging and managing private communications between users. It is an open source project that is built with Github and Docker, making it accessible and easy to install on private servers. The application is self hosted, ensuring that in-house data is stored in a private database.

It is a white-label product that is flexible to color and logo customizations, offering organizations the ability to design personalized aesthetics.

## Important Links

đšī¸ [Demo](https://demo.lcubestudios.io/messagingapp-frontend)

đ [Documentation](/README.md)

## Installation Options

### đŗ Option 1 : Containerized Docker
This option allows installation of frontend and backend environments as a containerized docker image with env configurations.

Links:
- [Docker Repository](https://github.com/lcubestudios/messagingapp-docker)

### âī¸ Option 2 : Download from source code
This option allows you to download and install frontend and backend code independently

Links:
- [Frontend Repository](https://github.com/lcubestudios/messagingapp-frontend)
- ī¸[API Repository](https://github.com/lcubestudios/messagingapp-api)

# Docker Documentation

## đ§° Prerequisites
#### Docker
- Follow [this link](https://docs.docker.com/engine/install/) to install Docker on your environment

#### Postman
- [Download](https://www.postman.com/downloads/) Postman
- Follow [How to Guide](https://learning.postman.com/docs/getting-started/importing-and-exporting-data/) to Import Postman [Collection](https://www.getpostman.com/collections/3692a0aa4daa3d16f40c)

## Installation

Clone repository
```sh
git clone https://github.com/lcubestudios/messagingapp-docker.git
```

Change to project directory
```sh
cd messagingapp-docker
```

Checkout branch
```sh
git fetch && git checkout { branch name }
```

## Build
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
    ##FRONTEND
    VUE_APP_BASE_URL='/'
    VUE_APP_API_URL='/messagingapp-api'
    VUE_APP_SITE_TITLE='Messaging App | powered by LCube Studios' 

    ##BACKEND
    DB_USER="postgres"  #if you use a different user you will need to update the schema file
    DB_PASSWORD="Yoursecurepassword!"
    DB_NAME="demo"
    DB_PORT=5432

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
    docker compose up -d â-build
    ```

3. Verify containers are running (run the following command inside the terminal)

    ```sh
    docker ps -a
    ```

#### Step 3: Test endpoints
1. In **POSTMAN** Update `server` variable in the collection to your server address
2. Test CRUD commands in **POSTMAN** collection: `GET`, `PUT`, `POST`, `DELETE`

## Resources
[Frontend Documentation](https://github.com/lcubestudios/messagingapp-frontend)

ī¸[API  Documenetation](https://github.com/lcubestudios/messagingapp-api)

## đŖ Connect with LCube Studios
đ [Website](https://Lcubestudios.io)

âī¸ [Contact Us](mailto:Contact@lcubestudios.io)

đ [Let's Meet](https://calendly.com/lcubestudios/30min)

#### Follow Us
[LinkedIn](https://www.linkedin.com/company/lcubestudios/)

[Instagram](https://www.instagram.com/lcubestudios)

[Facebook](https://www.facebook.com/lcubestudiosnyc/)

[Twitter](https://www.twitter.com/lcubestudios/)

[Discord](https://discord.com/invite/6Ud9x23zaK)

[Github](https://github.com/lcubestudios)

## đĄ Let's make your FrameWork