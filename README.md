# check_www_site_bash.sh

## Started 🚀

Script in **bash**. Checks an array of sites to verify if the sites are up, down or if they take a long time to open the site. 
The bash have three parameters: 
- The time to check the sites.
- Flag to create evidence.
- Flag only create and send the evidence.

> Improve coding [https://gist.github.com/DnaX/4597186](https://gist.github.com/DnaX/4597186)


### Examples

```sh
    bash webstatus.sh 60 0 0 
```
> Checks every 60 seconds without creating tests.

```sh
    bash webstatus.sh 60 1 0 
```
> Checks every 60 seconds with creating tests and send email with the evidence.

```sh
    bash webstatus.sh 60 1 1 
```
> Creating tests and send email with the evidence, no monitoring.


## Pre-requisitos 📋

Install **mutt**

```sh
    sudo apt update
    sudo apt install mutt
```
> Mutt is a sophisticated text-based Mail User Agent.

```
Da un ejemplo
```

### Instalación 🔧

_Una serie de ejemplos paso a paso que te dice lo que debes ejecutar para tener un entorno de desarrollo ejecutandose_

_Dí cómo será ese paso_

```
Da un ejemplo
```

_Y repite_

```
hasta finalizar
```

_Finaliza con un ejemplo de cómo obtener datos del sistema o como usarlos para una pequeña demo_

## Ejecutando las pruebas ⚙️

_Explica como ejecutar las pruebas automatizadas para este sistema_

### Analice las pruebas end-to-end 🔩

_Explica que verifican estas pruebas y por qué_

```
Da un ejemplo
```

### Y las pruebas de estilo de codificación ⌨️

_Explica que verifican estas pruebas y por qué_

```
Da un ejemplo
```

## Despliegue 📦

_Agrega notas adicionales sobre como hacer deploy_

## Construido con 🛠️

_Menciona las herramientas que utilizaste para crear tu proyecto_

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - El framework web usado
* [Maven](https://maven.apache.org/) - Manejador de dependencias
* [ROME](https://rometools.github.io/rome/) - Usado para generar RSS

## Contribuyendo 🖇️

Por favor lee el [CONTRIBUTING.md](https://gist.github.com/villanuevand/xxxxxx) para detalles de nuestro código de conducta, y el proceso para enviarnos pull requests.

## Wiki 📖

Puedes encontrar mucho más de cómo utilizar este proyecto en nuestra [Wiki](https://github.com/tu/proyecto/wiki)

## Versionado 📌

Usamos [SemVer](http://semver.org/) para el versionado. Para todas las versiones disponibles, mira los [tags en este repositorio](https://github.com/tu/proyecto/tags).

## Autores ✒️

_Menciona a todos aquellos que ayudaron a levantar el proyecto desde sus inicios_

* **David Baez** - *Trabajo Inicial* - [DBZ repository]([https://github.com/villanuevand](https://github.com/DavidBaezDbz))
> [David Baez]([https://davidbaezdbz.github.io/](https://davidbaezdbz.github.io/))


También puedes mirar la lista de todos los [contribuyentes](https://github.com/your/project/contributors) quíenes han participado en este proyecto. 

## Licencia 📄

Este proyecto está bajo la Licencia (Tu Licencia) - mira el archivo [LICENSE.md](LICENSE.md) para detalles

## Expresiones de Gratitud 🎁

* Comenta a otros sobre este proyecto 📢
* Invita una cerveza 🍺 o un café ☕ a alguien del equipo. 
* Da las gracias públicamente 🤓.
* etc.
