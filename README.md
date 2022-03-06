# API BOOKLIB

Booklib est une API REST permettant d'ajouter/modifier et supprimer un livre et de consulter son détail.
Cette API REST a été développé dans le cadre d'un projet de 3ème année à l'école ESGI.

## L'équipe

- ANCELOT Owen
- UZAN Gabriel

## Spécification technique

- **Langage :** Java 1.8
- **Framework :** Java Spring Boot
- **SGBD :** PostgreSQL 10.10
- **Outils de versionning :** Docker et Git

## Versioning

- **Lien Github :** https://github.com/Ancelotow/Booklib
- **Image Docker API :** ancelotow/booklib
- **Image Docker BDD :** ancelotow/booklib_bdd

Nous avons créé un Workflow qui permet de déployer automatiquement le projet sur Docker lors de chaque nouveau push
sur la branche principale qui est ici la branche **master**. 

Pour ce faire, le Worklow met en place d'abord le JDK 1.8 de Java avec Maven inclus. Ensuite, il compile l'API avec
maven pour pouvoir dockerizer l'API. Une fois ceci fait, le Workflow ce connecte au compte Docker **ancelotow**,
dockerize l'API et l'envoi sur Docker.

## Fonctionnalités de l’application

Booklib et une API sécurisée qui nécessite une authentification en "Bearer Token". Voici ci-dessous les différentes API de Booklib :

- ```POST /sign_in``` : Permet de s'authentifier et retourne le jeton Bearer token


- ```POST /signup``` : Permet de créer un nouveau compte


- ```GET /books``` : Retourne la liste de tout les livres (Authentification requise)


- ```GET /books/{isbn}``` : Retourne le détail d'un livre via son ISBN (Authentification requise)


- ```POST /books``` : Ajoute un nouveau livre (Authentification requise)


- ```PATCH /books/{isbn}``` : Modifie un livre via son ISBN (Authentification requise)


- ```DELETE /books/{isbn}``` : Supprime un livre via son ISBN (Authentification requise)

## Contribuer

Nous avons mis en place un **docker-compose.yml**. Ce **docker-compose** permet de faire tourner Booklib sur le port
**8080** et de mettre en place la base de données PostgreSQL 10.10 sur le port **5432** avec éxecution automatique d'un
script SQL pour créer la base de données (ce script se trouve dans ***./src/bdd/init.sql***).

Pour éxecuter le **docker-compose**, il faut éxecuter les commandes suivantes à la source du projet : 
```
> ./mvnw package
> docker build -t ancelotow/booklib .
> docker-compose up
```

## Déploiement

Pour déployer, il faudra récupérer deux images Docker :

- **ancelotow/booklib** pour l'API
- **ancelotow/booklib_bdd** pour la base de données PostgreSQL

Pour ce faire, il faut éxecuter les commandes suivantes :

```
> docker pull ancelotow/booklib
> docker pull ancelotow/booklib_bdd
```

Et ensuite les éxecuter :

```
> docker run ancelotow/booklib
> docker run ancelotow/booklib_bdd
```

L'API écoute sur le port **8080** tandis que la base de données écoute sur le port **5432**.



     

