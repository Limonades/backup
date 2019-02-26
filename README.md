# [TODO] Craft Landing Page

[TODO] Craft site.

## 1: About
This is the theme for the [TODO] Craft CMS Website

## 1-1: About The Frontend

- Framework
  - Craft CMS
- VM
  - Docker for linux VM (see getting started for more details)
  - Custom made container using nginx and ubuntu
- CI
  - Gitlab CI
- Server hosting
  - AWS, EBS, RDS (with Terraform)
- Code Structure
  - Skyrocket Coding System - Craft CMS

## 1-3: A Brief Timeline

[TODO: TimeFrame]

# 2: Getting Prepared For Development

[We have extensive documentation on getting up and running with Docker.](https://gitlab.com/Skyrkt/development-resources/wikis/installing-docker)
[We have extensive documentation on Skyrocket Coding Convention]([ETHAN TODO]])

## 2-4 SSL/TLS/HTTP.
We strongly recommend using SSL/TLS/HTTPS in development with this package. Not only does it enable features like the geolocation api and device motion api but it more accurately reflects the environment we'd have in production, as this app will be run with TLS enabled.

We're using SSL certification provided by [TODO: AWS Certificate Manager / CertBot]

# 3: Development With this Application

Please familiarize yourself with the shared components on this site:
[[TODO].com/styleguide](https://[TODO].com/styleguide)

## 3-1: Clone

First thing is first, clone the develop respository.

## 3-2: Compose

```
cd [TODO: Project Directory]
docker-compose up
```

Once that is done the application is now running, with code volumization so you can now start editing code and see changes live!

## 3-3: Prepare Data

Import databased in `/project root/db-dumps/` to `db.[TODO].docker`
(see detailed db config in `./docker-compose.yml`)

## 3-4: Access

After all the components are running, you can run commands in the docker container like this (in another terminal window)
```bash
docker ps

// Make a note of the container name you are using

docker exec [container_name] [some-command]
```

For example
```bash
docker exec [TODO]craft_craft_1 echo hello!
```

**NOTE: SSH-ing Into the Container**

If you want to "ssh" into the container you can do so by just running bash with
and interactive terminal in the container. Long story short you can run
```bash
docker exec -it [TODO]craft_craft_1 bash
```

**ENDNOTE**

Be sure to install the node modules, and begin watching for changes.

```bash
yarn install
yarn start
```

From here you should be able to visit `[TODO].docker` to see the frontend application. With a live reload dev server.

**NOTE: Does that url not work?**

```
dinghy up
```

**ENDNOTE**

The docker compose file tells it to run a development server so you can make changes
to the application and they will be reflected on that page. For more information
on how the file system is shared between the container and your host computer
look up [docker volumes](https://docs.docker.com/engine/userguide/containers/dockervolumes/). For information
on how the application is being run you can view the `docker-compose.yml` file in the develop repo.

# 4: How This is Hosted and Served

This application is being hosted on it's own AWS account. It's running in an EC2 environment using Docker.
Consult the `Dockerfile` in this repo to see the steps that were taken when making the Docker environment.

You can see the steps for installing the environment `Dockerfile`.

There is a `.devops/terraform` folder that I use to config AWS setting with Terraform. It includes the necessary ts file to configure AWS to do it's job, including EC2, RDS, IAM, S3 and Route53
There is a `.devops/docker-files` folder that I use as the place to store all files to be included in the docker build that aren't source files.

There is a `.gitlab-ci.yml` file that instructs the CI on how to do it's job and deploy the code to EC2.

# 5: FAQ / Common Gotcha's During Development / Troubleshooting Tips

## 5-0-1: Where Do My Docker Images Get Stored
In Gitlab!

more info about that can be found [here](https://about.gitlab.com/2016/05/23/gitlab-container-registry/)

## 5-0-2: Where Are All Of The Gitlab CI variables
Some of the Gitlab CI variables are set in the actual repo web interface under project settings -> variables. This is so we don't version control any passwords.

## 5-0-3: Docker is giving me a lot of errors about ports already being bound:
run `docker ps` in terminal. You should see a list of running containers. You will see which ports are bound and which ones aren't.

A quick fix to this is just removing all containers.
```
docker kill $(docker ps -a -q) && docker rm $(docker ps -a -q)
```

## 6: Contributing

Skyrocket has written a comprehensive guide to get started with contributing to Skyrocket projects. You can view the document [here](https://app.tettra.co/teams/skyrocketdigital/pages/contributing-to-skyrocket-projects)

Skyrocket has put together a list of common problems that occur and their solutions [here](https://app.tettra.co/teams/skyrocketdigital/pages/engineering-faq).