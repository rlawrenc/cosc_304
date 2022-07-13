# COSC 304 - Introduction to Database Systems<br>Assignment 7 - Local Setup

The fastest way to do this assignment is to edit the files locally on your computer with any text editor, upload them to the server, and test them by connecting to the web page URL. An alternate way is to setup a PHP web server on your machine for testing ([instructions](setup.md)).

## Steps

1. Install a text editor. You can use Eclipse which has support for PHP or a text editor like VSCode or [Notepad++](https://notepad-plus-plus.org/download/).

2. Edit the files (such as listorder.php) in the text editor and save them on your computer.

3. Install a SecureFTP program to transfer the files to the cosc304.ok.ubc.ca server. Choices include [FileZilla](https://people.ok.ubc.ca/rlawrenc/teaching/304/Notes/filezilla/filezilla.html) or the <a href="https://github.com/ashkulz/NppFTP/releases">NppFTP plugin</a> for Notepad++.

4. Create the directory `lab7` in the `public_html` folder on `cosc304.ok.ubc.ca`. All the PHP files should be transferred into that directory.


### File Transfer using Notepad++ and NppFTP plugin

- Open Notepad++ as administrator, navigate to `Settings > Import > Import plugin(s)`. <br/>
<img src="img/import_plugin.png">

- Locate plugin, and click Open.

- Connect Notepad++ to `cosc304.ok.ubc.ca`

- In Notepad++, select `Plugins > NppFTP > Show NppFTP Window` (Note, it may not work directly after importing; you may need to re-open Notepad++ after installation)

- Select the Gear image, and choose `Profile Settings`. Create a new profile, SFTP, cosc304.ok.ubc.ca, and your UBC Novel login details. <br/>
<img src="img/npp_configure_2.png">
