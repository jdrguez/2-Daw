# Instalación de Xamp en linux.

## 1. Descargar el instalador de Xamp en su página oficial.

![](img/1.png)   

## 2. Ejecutar el ejecutable descargado anteriormente.
Para poder ejecutar el archivo necesitarás darle permisos de ejecución. Se hará uso del chmod u+x al archivo.
```bash
sudo chmod u+x xampp-linux-x64-8.2.4-0-installer.run 
```
![](img/2.png)

#### Se procede a ejecutarlo. Debemos esperar que termine de ejecutarse.
![](img/3.png)

``` bash
sudo opt/lampp/xampp start
```
#### Mediante este comando se ejecutan los servicios de xampp, apache y php.

#### Después del paso anterior, pondremos en el navegador localhost/phpmyadmin y nos saldrá lo siguiente:
![](img/5.png)
