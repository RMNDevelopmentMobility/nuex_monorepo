# nuex_monorepo

## Nubank Flutter Test [RMN]

<p align="center">Nubank - Testes: <b>Arquitetura</b> &amp; <b>Pair Programming</b> 🚀</p>

<div align="center">

![technology](https://img.shields.io/badge/technology%20-Flutter%2FDart-blue)
![platfform](https://img.shields.io/badge/plattform-iOS%2FAndroid-orange)
![unit-tests](https://img.shields.io/badge/unit%20tests-✔-brightgreen)

</div>

### Avaliações de Arquitetura & Pair Programming:

Screenshot | Description
-----------|-------------
<img src="https://github.com/RMNDevelopmentMobility/nuex_monorepo/blob/main/nuex_app/assets/readme_images/Test_Architecture.png" alt="Screenshot_01" width="400"/> | IMAGEM 1: Teste: Arquitetura. 
<img src="https://github.com/RMNDevelopmentMobility/nuex_monorepo/blob/main/nuex_app/assets/readme_images/Test_Pair_Programming.png" alt="Screenshot_02" width="400"/> | IMAGEM 2: Teste: Pair Programming.

## Overview
Projeto Flutter criado como um Monorepo.

Padrão arquitetural baseado em **Clean Architecture**.


## Index
* [Overview](#Overview)
* [Project Architecture](#Project-Architecture)
* [State Management and Reactivity](#PState-Management-Reactivity)
* [Getting Started](#Getting-Started)
	* [Prerequisites / Installation](#Prerequisites-Installation)
	* [How to Use](#How-to-Use)
* [Folder Structure](#Folder-Structure)
* [Libraries & Tools](#Libraries-Tools)
	
	
## Project Architecture
O padrão arquitetural adotado neste projeto é o **Clean Architecture**. 

A estruturação de pastas e subpastas (detalhadas mais abaixo) do código fonte está amplamente baseada no padrão arquitetural referido.
<div class="center">
<p align="center">	
    <img src="https://github.com/RMNDevelopmentMobility/nuex_monorepo/blob/main/nuex_app/assets/readme_images/Flutter_Clean_Arch.png" height="250" width="500" alt="Flutter_Clean_Arch" />
</p>
</div>


## State Management and Reactivity
O gerenciamento de estado utilizada no projeto é feito com ChangeNotifier

**Referência ChangeNotifier** (https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple)

## Getting Started

### Prerequisites / Installation
Passos necessário para preparar o ambiente antes de rodar este projeto:
-   Instalar o **Git** (https://git-scm.com/downloads)
-   Instalar o **Flutter** (https://flutter.dev/docs/get-started/install)
-   Instalar o **Dart SDK** (https://dart.dev/get-dart)
-   Obter alguma IDE para o desenvolvimento. Ex.: Visual Studio Code
	- Plugins específicos podem auxiliar no desenvolvimento, abaixo segue a lista com alguns deles para o VSCode:
		- Flutter (dart-code.flutter)
		- Dart (dart-code.dart-code)
		- Bracket Pair Colorizer 2 (coenraads.bracket-pair-colorizer-2)
		- Material Icon Theme (pkief.material-icon-theme)
		- Visual Studio Keymap (ms-vscode.vs-keybindings)

### How to Use
**_Passo 1:_**

Baixe ou clone este repositório usando o link abaixo:

	https://github.com/RMNDevelopmentMobility/nuex_monorepo.git

**_Passo 2:_**

Vá para a raiz do projeto e execute o seguinte comando no console para obter as dependências necessárias: 

	flutter pub get 

**_Passo 3:_**

Este projeto usa a biblioteca _inject_ que trabalha com geração de código, execute o seguinte comando para gerar os arquivos: 

	flutter pub run build_runner build --delete-conflicting-outputs
	
**_Passo 4:_**

Rode o projeto em um emuldor ou device com o comando: 

	flutter run

### Folder Structure

Aqui está a estrutura de pasta principal que este projeto flutter fornece. 

	flutter-first-poc/
	|- .dart_tool
	|- .idea
	|- android
	|- assets
	|- build
	|- ios
	|- lib
	|- test
	|- web
	
Aqui está a estrutura de pastas que usamos neste projeto

	lib/
	|- app/
	   |- modules/
	   |- app_module.dart
	   |- app_widget.dart
	|- main.dart

Agora, vamos mergulhar na pasta lib/app que contém o código principal do aplicativo.

	1- modules/ 
		Contém separadamente os módulos que compõem o aplicativo. 
		Base do Flutter Modular utilizado neste projeto.

	2- app_module.dart 
		Este arquivo contém todas as rotas para os módulos do aplicativo. 
		Responsável também pela injeção de dependências das classes controller.

	3- app_widget.dart
		Contém as configurações de nível de aplicativo, ou seja, tema, título, orientação, etc.

	4- main.dart
		Este é o ponto de partida do aplicativo. Inicializa as classes do Hive, configura o Loading 
		para todo o aplicativo e inicializa o módulo principal da estrutura Modular - AppModule().

**_modules_**

Por utilizar o Flutter Modular este diretório é um dos mais importantes do projeto, contendo todos os módulos que compôem o aplicativo. 
<div class="center">
<p align="center">
	<img src="https://github.com/RMNDevelopmentMobility/nuex_monorepo/blob/main/nuex_app/assets/readme_images/camadas_clean.png" height="353" width="278" alt="camadas_clean" />
</div>

Cada módulo pode conter a seguinte estrutura de pastas/arquivos baseada na **Clean Architecture** (dependendo da complexidade do mesmo), conforme mostrado no exemplo abaixo: 

	modules/
		|- search/
	    	|- data/
	        	|- datasource/
	        		|- search_datasource.dart
		    	|- models/
	        		|- result_search_model.dart
		    	|- repositories/
	        		|- search_repository_impl.dart
		 |- domain/
		    	|- entities/
	        		|- result_search.dart
		    	|- errors/
	        		|- search_errors.dart
		    	|- repositories/
	        		|- search_repository.dart
		    	|- usecases/
	        		|- search_by_text.dart
	      	|- external/
		    	|- datasource/
	        		|- github_datasource.dart
	      	|- presenter/
	        	|- search/
	        	|- states/
	        		|- states.dart
	     		|- search_bloc.dart
	     		|- search_page.dart
	     	|- search_module.dart
	      
Explicando melhor a estrutura que cada módulo pode conter, não seguindo a ordem alfabética e sim a aordem de importância dentro do **Clean Architecture**, temos abaixo.

	1- domain/ — A camada de Domain hospedará as Regras de Negócio Corporativa(Entity) e da Aplicação(Usecase). A camada Domain 
	deve ser responsável apenas pela execução da lógica de negócio, não deve haver implementações de outros objetos como Repositories 
	ou Services dentro do "domain".
	   1.1- entities/ - As entidades devem ser objetos simples. A Entidade não deve usar nenhum objeto das outras camadas.
	   1.2- errors/ - As classes de erros podem ser utilizadas para a customização e retenção para maior flexibilidade dos erros 
	   da aplicação.
	   1.3- repositories/ — Apesar do nome, nesta pasta teremos apenas o contrato de interfaces(Abstrações) e a responsabilidade de
	   implementação desse objeto deverá ser repassado a outra camada mais baixa.
	   1.4- usecases/ — Os Casos de Uso devem executar a lógica necessária para resolver o problema. Se o Caso de Uso precisar de algum
	   acesso externo então esse acesso deve ser feito por meio de contratos de interface que serão implementados em uma camada de mais
	   baixo nível.

	2- data/ - Esta camada dá suporte a camada Domain implementando suas interfaces. Para isso, adapta os dados externos para que possa
	cumprir os contratos do domínio. Nessa camada iremos implementar alguma interface de um Repository ou Services que pode ou não 
	depender de dados externos como uma API ou acesso a algum Hardware como por exemplo Bluetooth.
	   2.1- datasources/ - As classes aqui serão utilizadas para quando quisermos acessar um dado externo. Serão classes apenas de
	   interface, visando passar a responsabilidade de implementação para a camada mais baixa da nossa arquitetura. 
	   2.2- models/ - As classes devem adaptar os dados externos para que possa cumprir os contratos do domínio, podendo conter regras 
	   de validação dos seus dados por meio de funções ou ValueObjects.
	   2.3- repositories/ — Nestas classes, de fato, iremos implementar as interfaces provenientes da camada "domain". 

	3- external/ - Aqui fica a implementação dos acessos externos e que dependem de um hardware, API, packages ou acesso muito 
	específico. Basicamente a camada External deve conter tudo aquilo que terá grandes chances de ser alterado sem que o programador 
	possa intervir diretamente no projeto.
	   3.1- datasources/ - As classes aqui devem se preocupar apenas em “descobrir” os dados externos e enviar para a camada de "data" 
	   para serem tratados. 

	4- presenter/ — A Camada Presenter fica responsável por declarar as entradas, saídas e interações da aplicação. Usando o Flutter 
	como exemplo, hospedaremos os Widgets, Pages e também Alguma Gerência de Estado.
	   4.1- states/ - As classes aqui contém os estados possíveis da gerência de estado, no caso deste exemplo, o Bloc. 
	
### Libraries & Tools
* [mocktail](https://github.com/felangel/mocktail)
* [dartz](https://github.com/spebbe/dartz)
* [dio](https://github.com/flutterchina/dio)
* [flutter_modular](https://github.com/Flutterando/modular)
