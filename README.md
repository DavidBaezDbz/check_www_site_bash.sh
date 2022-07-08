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

### WSL

Install **wsl2** on your **windows 11**

1. Run Windows Terminal as administrator.

```
    wsl --install
```
2. Install a GNU/Linux distribution from those available in the Microsoft application store.

[Ubuntu 20.04](https://apps.microsoft.com/store/detail/ubuntu-2204-lts/9PN20MSR04DW?hl=es-co&gl=CO)
> The tests were on this version

3. Restart our computer to be able to start the Ubuntu installation.

4. Running the Ubuntu application and follow the steps

[Microsoft Documentation](https://docs.microsoft.com/es-es/windows/wsl/install)

### CURL

Install **curl**

```sh
    sudo apt update
    sudo apt install curl
```
> The command downloads files that are served with FTP, HTTP or HTTPS protocol. It’s an amalgamation of the words World Wide Web and the word get to form wget.


### MUTT

Install **mutt**

```sh
    sudo apt update
    sudo apt install mutt
```
> Mutt is a sophisticated text-based Mail User Agent.

## CUTYCAPT

Install **CUTYCAPT**

```sh
    sudo apt update
    sudo apt install cutycapt
```
> CutyCapt is a small cross-platform command-line utility to capture WebKit's rendering of a web page into a variety of vector and bitmap formats, including SVG, PDF, PS, PNG, JPEG, TIFF, GIF, and BMP. See IECapt for a similar tool based on Internet Explorer.

[http://cutycapt.sourceforge.net/](http://cutycapt.sourceforge.net/)


### EVINCE

Install **evince**

```sh
    sudo apt update
    sudo apt install evince
```
> pdf file viewer

### FIREFOX

Install **FIREFOX**

```sh
    sudo apt update
    sudo apt install firefox
```
[https://support.mozilla.org/en-US/kb/install-firefox-linux](https://support.mozilla.org/en-US/kb/install-firefox-linux)

### WGET

Install **wget**

```sh
    sudo apt update
    sudo apt install wget
    wget --version
```
> The command downloads files that are served with FTP, HTTP or HTTPS protocol. It’s an amalgamation of the words World Wide Web and the word get to form wget.

### WSL-NOTIFY-SEND

Install **wsl-notify-send**

- Download your version [https://github.com/stuartleeks/wsl-notify-send/releases](https://github.com/stuartleeks/wsl-notify-send/releases)
- Extract wsl-notify-send.exe from the downloaded zip and ensure that it is in your `PATH`
- **Testing** In WSL, run `notify-send "Hello from WSL"` and you should see a Windows toast notification!

> `wsl-notify-send` provides a Windows executable that is intended to be a replacement for the [Linux `notify-send` utility](https://ss64.com/bash/notify-send.html).

[https://github.com/stuartleeks/wsl-notify-send](https://github.com/stuartleeks/wsl-notify-send)

### QPDF

Install **qpdf**

```sh
    sudo apt update
    sudo apt install qpdf
```
> QPDF is a program and C++ library for structural, content-preserving transformations on PDF files

[https://qpdf.readthedocs.io/en/stable/installation.html](https://qpdf.readthedocs.io/en/stable/installation.html)

### 7Z

Install **7z**

```sh
    sudo apt update
    sudo apt install p7zip-full
```

### POSTIFIX

Install **postfix**

```sh
    sudo apt update
    sudo apt-get install postfix
```




## Instalación 🔧

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

* **David Baez** - *Trabajo Inicial* - [DBZ repository](https://github.com/DavidBaezDbz) - [David Baez](https://davidbaezdbz.github.io/)




También puedes mirar la lista de todos los [contribuyentes](https://github.com/your/project/contributors) quíenes han participado en este proyecto. 

## Licencia 📄

Este proyecto está bajo la Licencia (Tu Licencia) - mira el archivo [LICENSE.md](LICENSE.md) para detalles

## Expresiones de Gratitud 🎁

* Comenta a otros sobre este proyecto 📢
* Invita una cerveza 🍺 o un café ☕ a alguien del equipo. 
* Da las gracias públicamente 🤓.
* etc.
