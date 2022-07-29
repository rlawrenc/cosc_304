# Environment Setup

Most of the lab assignments require running a database on your computer. These database systems are run using Docker that supports virtual containers so that the software does not have to be directly installed on your computer.

## Install Docker Desktop

[Install Docker Desktop](https://www.docker.com/products/docker-desktop/) that works on Windows, Mac, and Linux.

## Install VSCode

Although you may use any text editor, the officially supported editor is [VSCode](https://code.visualstudio.com/Download).

## Install Java

If your computer does not have at least Java 8, install [Java 17 or 18](https://www.oracle.com/java/technologies/downloads/).

## Install SQuirreL SQL (Optional)

[SQuirreL SQL](https://squirrel-sql.sourceforge.io/) is a graphical SQL query software written in Java. 

# Assignment Setup

For assignments that use Docker, a GitHub repository or zip file will be provided with starter code and Docker configuration information. The important files for Docker are `docker-compose.yml` and `Dockerfile` that describes the setup of the containers.

To start a Docker container, go to the directory containing the `docker-compose.yml` file and run the command:

```docker-compose up -d```

To stop a Docker container, run:

```docker-compose down```

Docker is an industry-standard platform and [reading a tutorial](https://docs.docker.com/get-started/) will help you use it.
