# idxp-test
Small test for IDXP analytics.

The main assumption for this assignment is that is some sort of a WEB system. This assumption gives a few options in the architecture decisions. Another assumption is that the front-end will not display insanely huge lists of document.

##Architecture

The chosen architecture for this assignment is a dual aplication that shares a small database. The first one is responsible for reading the files and counting the words. The other one is responsible mainly for processing the search in the database. Now, for this project, i will use a simple web front-end, this approach let me relay the sorting to the front-end. To keep this project simple the second application will also handle the front-end serving and small API that receives info from the first application.

###In summary:

  1. First application: Read and count words;
  2. Second application: Process searches, handle API and front-end serving;
  3. Front-end: Handles sorting;

###Main Decisions:

The main advantage of this approach is dividing the main process of the whole problem. The first split is obvious, keeping these two tasks is one of the main components of keeping independent parts in the whole system.

The second split is not so obvious but it keeps a lot of the processing load off the servers. Relaying the sorting to the front-end is a easy way out, since the front-end may use the user processor to make simple and fast sorting. Even if the amount of results is huge, it could use a pagination idea and sort by steps in a lazy fashion. As the test in this application are not insanely huge, this will not be implemented though.


##Tasks

* ~~ Setup - Configurar ambiente da aplicação 1(Reader). Sistema de testes. ~~
* ~~ Setup - Configurar ambiente da aplicação 2(API + Front-end). Sistema de testes. ~~
* ~~ Reader - Definir funcionamento(paralelismo + escalabilidade). ~~
* ~~ Reader - Definir Tasks + Tasks de teste Testes. ~~
* ~~ Reader - Detector de arquivos - Teste. ~~
* ~~ Reader - Detector de arquivos - Implementação. ~~
* Reader - Detector de arquivos - Doc.
* ~~ Reader - Interface de comunicação com a API - Teste. ~~
* ~~ Reader - Interface de comunicação com a API - Implementação. ~~
* Reader - Interface de comunicação com a API - Doc.
* ~~ Reader - Processador por arquivo - Teste. ~~
* ~~ Reader - Processador por arquivo - Implementação. ~~
* Reader - Processador por arquivo - Doc.
* ~~ Reader - Escalonador - Teste. ~~
* ~~ Reader - Escalonador - Implementação. ~~
* Reader - Escalonador - Doc.
* API - Definir funcionamento(escalabilidade).
* API - Definir Model Word - Teste.
* API - Definir Model Word - Implementação.
* API - Definir Model Word - Doc.
* API - Definir Model Files - Teste.
* API - Definir Model Files - Implementação.
* API - Definir Model Files - Doc.
* API - Endpoint de busca - Teste.
* API - Endpoint de busca - Implementação.
* API - Endpoint de busca - Doc.
* API - Endpoint de escrita - Teste.
* API - Endpoint de escrita - Implementação.
* API - Endpoint de escrita - Doc.
* Front-end - Definir um layout simples.
* Front-end - Definir os métodos para comunicar com a API - Teste.
* Front-end - Definir os métodos para comunicar com a API - Implementação.
* Front-end - Definir os métodos para comunicar com a API - Doc.
