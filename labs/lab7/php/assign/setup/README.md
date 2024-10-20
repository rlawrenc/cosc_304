# COSC 304 - Introduction to Database Systems<br>Assignment 7 - Setup

This will setup a development environment using Docker on your computer.

## Steps

1. Install a text editor. It's highly recommended that you use VSCode ([Download Here](https://code.visualstudio.com/Download)) for this assignment due to the features it provides.

2. Once you've downloaded and installed your preferred text editor, extract the starter code for this project to a conveniently accessible area and open the folder in your text editor of choice. If you are using VSCode, click the "Open Folder" button and choose the folder containing the extracted starter code.

<img src="imgs/open_folder.png">

3. Download and install Docker ([here](https://www.docker.com/products/docker-desktop)). This is necessary for running the PHP web application and a Microsoft SQL server instance.

4. Open a command line window and navigate to the directory of your starter code. If you are using VSCode, you can do this by pressing Ctrl + \`. If you are not using VSCode, you can use your system's terminal. On Windows, this would be `cmd.exe` and on MacOS, this would be `terminal.app`. The image below shows an instance of VSCode with the terminal open.

<img src="imgs/terminal.png">

5. Type the following command in your terminal and press enter:

    ```
    docker-compose up -d
    ```

    This will setup the Java Server Pages runtime and Microsoft SQL server on your system. Please note that you will need at least 500MB of space on your hard drive.

6. Open your preferred web browser and navigate to the following URL: [http://127.0.0.1/shop.html](http://127.0.0.1/shop.html). If all went well with the above steps, you should see the shop opening page.

7. Edit the files in the text editor and save them on your computer. Changes to these files should be reflected on the website.

## Debugging

Errors will be printed on the respective PHP page being run.

## Shutting Down the Development Server

Press `Ctrl + C` in the terminal instance that you ran `docker-compose up` in.


