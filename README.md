# idxp-test
Small test for IDXP analytics.

The main assumption for this assignment is that is some sort of a WEB system. This assumption gives a few options in the architecture decisions. Another assumption is that the front-end will not display insanely huge lists of document.

##Architecture

The chosen architecture for this assignment is three application that shares a small database. The first one is responsible for reading the files and counting the words. The second is responsible mainly for processing the search in the database. And the third one will be the frontend. Now, for this project, i will use a simple web front-end, this approach let me relay the sorting to the front-end.

###In summary:

  1. First application: Read and count words;
  2. Second application: Process searches, handle API;
  3. Front-end: Handles sorting;


##Installing and Running locally

###Pre-requisites

* ruby 2.3.1
* rails 4.2.5
* mongodb
* redis
* sidekiq
* Ember 2.6 (npm is recommended)
* Bower



###Reader-app

On Reader-app root:

* Setting up:

`$> bundle install`

* Starting up:

Start your redis service

then start a worker with

`$Reader-app> sidekiq ./source/workers/indexer.rb`

and finally:

`$Reader-app> ruby start_listener.rb`


###Backend-app

On Backend-app root:

* Setting up

`$Backend-app> bundle install`

* Starting up:

`$Backend-app> rails s`
###Frontend-app

On Frontend-app root:

* Setting up

`$Frontend-app> npm install`

`$Frontend-app> bower install`

* Starting up

`$Frontend-app> ember server`



### How to read files

Just place a text file you want to read inside `Reader-app/application_storage/new_files` folder once the listener is running.

### How to search for terms

`localhost:4200/search` and type a word inside the input box.

##Deployment and Scaling

This application was designed so it could scale and be deployed in multiple machines. Idealistically, a few more features have to be implemented so it runs on its the best behaviour.
Also, a few code url has to be fixed so it runs correctly in a cloud environment.

A few points will be discussed right here on how to setup the whole application for scaling.

1.  Reader-app:

The Reader-app was developed using Sidekiq scheduler, wich relies on redis as its messaging broker, wich is easy to scale since we could fire up many machines that feed on the same Redis server. This simple config is shown on Indexer.rb file.

2. Backend-app:

In this application the main problem is that search processing is done in the same machine that handles API request and also database. This is done mainly for a simple and fast development and spliting the responsability would be best. Another feature that could be moved around is the processing related for receiving data coming from the reader-app. Scaling this one is easy as it could be deployed on multiple machines behind a load balancer.

3. Frontend-app:

The sorting is done on the client, so there aren't many things that should be done here. Although it can be scaled in the same way as the backend-app. Multiple machines and a load-balancer.

##Testing

Testing requires that all the backend application is running. Preferably, the environment for the backend should be test, this is done by simply starting up as `$Backend-app> rails s RAILS_ENV=test`

1. Reader-app:

`rake test`

2. Backend-app:

`bundle exec rspec`

3. Frontend-app:

`ember test`



##Tasks

* ~~Setup - Configurar ambiente da aplicação 1(Reader). Sistema de testes.~~
* ~~Setup - Configurar ambiente da aplicação 2(API + Front-end). Sistema de testes.~~
* ~~Reader - Definir funcionamento(paralelismo + escalabilidade).~~
* ~~Reader - Definir Tasks + Tasks de teste Testes.~~
* ~~Reader - Detector de arquivos - Teste.~~
* ~~Reader - Detector de arquivos - Implementação.~~
* ~~Reader - Detector de arquivos - Doc.~~
* ~~Reader - Interface de comunicação com a API - Teste.~~
* ~~Reader - Interface de comunicação com a API - Implementação.~~
* ~~Reader - Interface de comunicação com a API - Doc.~~
* ~~Reader - Processador por arquivo - Teste.~~
* ~~Reader - Processador por arquivo - Implementação.~~
* ~~Reader - Processador por arquivo - Doc.~~
* ~~Reader - Escalonador - Teste.~~
* ~~Reader - Escalonador - Implementação.~~
* ~~Reader - Escalonador - Doc.~~
* ~~API - Definir funcionamento(escalabilidade).~~
* ~~API - Definir Model Word - Teste.~~
* ~~API - Definir Model Word - Implementação.~~
* ~~API - Definir Model Word - Doc.~~
* ~~API - Definir Model Files - Teste.~~
* ~~API - Definir Model Files - Implementação.~~
* ~~API - Definir Model Files - Doc.~~
* ~~API - Endpoint de busca - Teste.~~
* ~~API - Endpoint de busca - Implementação.~~
* ~~API - Endpoint de busca - Doc.~~
* ~~API - Endpoint de escrita - Teste.~~
* ~~API - Endpoint de escrita - Implementação.~~
* ~~API - Endpoint de escrita - Doc.~~
* ~~Front-end - Setup do ambiente de aplicação.~~
* ~~Front-end - Definir um layout simples.~~
* Front-end - Definir os métodos para comunicar com a API - Teste.
* ~~Front-end - Definir os métodos para comunicar com a API - Implementação.~~
* ~~Front-end - Definir os métodos para comunicar com a API - Doc.~~
