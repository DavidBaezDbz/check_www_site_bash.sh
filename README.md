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

### POSTIFIX WITH GMAIL

Install **postfix**

```sh
    sudo apt update
    sudo apt-get install postfix
```

Review the next page, works for me. [https://tonyteaches.tech/postfix-gmail-smtp-on-ubuntu/](https://tonyteaches.tech/postfix-gmail-smtp-on-ubuntu/)

Second password for you account gmail [https://www.youtube.com/watch?v=J4CtP1MBtOE](https://www.youtube.com/watch?v=J4CtP1MBtOE)


## Instalación 🔧

Clone my repository and enjoy.

```
git clone git@github.com:DavidBaezDbz/check_www_site_bash.sh.git
```

Give permison to the bash

```sh
chmod a+x check_sites_www.sh
```
or execute whit `bash` command

```sh
bash webstatus.sh 30 1 0
```
> Checks every 30 seconds with creating tests and send email with the evidence.

And the las step, is fill the file email and websitecheck

**email**
```
xxxxx@domain.com,xxxxx1@domain.com
```
**websitecheck**
```
https://www.xxxxxx.com
https://www.yyyyyy.com
https://www.dddddd.com
https://www.bbbbbb.com
https://www.zzzzzz.com
```

Example

```sh
bash webstatus.sh 20 1 0
```
> Checks every 20 seconds with creating tests and send email with the evidence.
> 

## Test ⚙️

### Example 1

Execute the bash

```sh
    bash webstatus.sh 60 0 0 
```
> Checks every 60 seconds without creating tests.

Check the log

```sh
    tail -f logwebstatus.log  
```
Check the log

```sh
tail -f logwebstatus.log | grep FAIL
```

### Example 2

Execute the bash

```sh
    bash webstatus.sh 60 1 0 
```
> Checks every 60 seconds with creating tests and send email.

Check the log

```sh
    tail -f logwebstatus.log  
```
Check the log

```sh
tail -f logwebstatus.log | grep FAIL
```
Check the directory of evidence

```sh
ll wwwevidence/070822140254/
```
> The last directory is the datetme when you create the evidence

**IF YOU HAVE PROBLEMS WITH THE EMAIL**

Check the `postfix` service

```sh
sudo service postfix status
```
If the service is stop state, execute `sudo service postfix start`

if bash does not send mail, check logs

some commands
```sh
mail
# where you set up the postfix records /var/log/postfix.log
tail -f /var/log/postfix.log
#
journalctl -u postfix@-.service
```


## Wiki 📖

Puedes encontrar mucho más de cómo utilizar este proyecto en nuestra [Wiki]([https://github.com/tu/proyecto/wiki](https://github.com/DavidBaezDbz/check_www_site_bash.sh/wiki))

## Version 📌

In the fiture a will use [SemVer](http://semver.org/) for versioning. For all available versions, see the [tags en este repositorio](https://github.com/DavidBaezDbz/check_www_site_bash.sh/tags).

## Authors ✒️🖇️🛠️


* **David Baez** - *Trabajo Inicial* - [DBZ repository](https://github.com/DavidBaezDbz) - [David Baez](https://davidbaezdbz.github.io/)


## License 📄

Working on this  - see the file [LICENSE.md](LICENSE.md) for details

## Expressions of Gratitude 🎁

* Tell others about this project 📢
* Invite for a beer 🍺 or a coffee ☕ to someone on the team.. 
* Publicly thanks 🤓.
* Anything you want.
