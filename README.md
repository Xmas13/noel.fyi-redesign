# noel.fyi

## Introduction

This is my personal site written with IaaC (Infrastructure as Code). I have fully automated the process of deploying my website whenever I make a post to my blog or changes to the static pages.

I have done this by using several technologies and platforms:

* [Digital Ocean](https://digitalocean.com)
* [Ubuntu 20.04](https://ubuntu.com)
* [Docker](https://docker.com)
  * [DockerHub](https://hub.docker.com)
* [Hugo](https://gohugo.io)
  * [Minify](https://github.com/tdewolff/minify/cmd/minify)
* [Traefik](https://containo.us/traefik)
  * [Let's Encrypt](https://letsencrypt.org)
* [WatchTower](https://hub.docker.com/r/centurylink/watchtower/)
* [Ansible](https://www.ansible.com)
* [Github](https://github.com)

I will take some time and explain how all of these technologies fit together and how the pipeline looks. I plan on making improvements to make the site more resiliant and to add testing on each push before it is merged to master. I will include more details in an upcoming blog post.

## Architecture

I like building something that you can understand easily by breaking it apart. This is why I am a big believer in the Unix Philosophy. I like to have many small, very focused tools creating a larger system. 

This may seem like a lot of tools to build a simple static site. I want to save myself the pain of updating markdown by hand, using hugo to publish, minify, etc.

I will start explaining my choices in architecture below.

### Digital Ocean

I think it's best to start at the bottom of the stack.

#### Reasons I Chose Digital Ocean

* They are a much cheaper alternative to many other IaaS (Infrastructure as a Service) providers.
* They still have a really robust set of tools and APIs to continue to improve and manage my site.
  * One example would be if I need to expand my site to more edge locations for higher performance, I can't do that self hosting my site.
* They take away the maintenance of having to manage the infrastructure myself.

#### How I Use Digital Ocean

I currently have a droplet (server instance) I pay a small monthly fee for. This is running a Ubuntu 20.04 server to host docker on top of.

### Ubuntu 20.04

#### Reasons I Chose Ubuntu 20.04

* Ubuntu has very strong support for docker.
* This is the LTS (Long Term Support) version of Ubuntu which makes it super stable
* There is a large community around Ubuntu and great documentation
* CentOS and Fedora are moving away from supporting docker in favor of their own containerization format
  * Read more [here](https://fedoramagazine.org/docker-and-fedora-32/)

#### How I use Ubuntu 20.04

I currently this hosted on Digital Ocean. I use this as a base for docker to run on top of.

### Docker / DockerHub

#### Reasons I Chose Docker

* It is the industry standard container format
* There is a lot of documentation on how to utilize it
* You get the benefit of using DockerHub as a container registry
* Works well on top of Ubuntu
* All of the other benefits of containerizing your apps

#### How I use Docker

* I use docker in one of it's more basic forms. I use Docker Compose to set up a set of containers that work in conjunction to provide services for my site. I run Hugo, Traefik, and Watchtower all as Docker containers on top of my Ubuntu host.

#### Reasons I Chose DockerHub

* It is a good place to store my custom image for Hugo since there are no good images available
* Allows me to test and verify my container is running the services it is supposed to
* Allows me to verify that it builds
* Integrates with other services I am using

#### How I use DockerHub

* Integrates with Github so everytime I push my repository, it will test and build a new docker container.
* Watchtower uses this as a dependency to pull down a new build of my site container each time a new build is created

### Hugo w/ Minify

#### Reasons I Chose Hugo

* It is an incredibly fast loading static site generator
* It is written in Go which is a language I am familiar with
* It is easy to use static pages for something like a blog which is what my site is
* Way less overhead than something like Wordpress or Ghost

#### How I use Hugo

I built a custom Dockerfile to automate all of the standard things that I would need to do in order to regenerate my site using Hugo. Everytime I would add a blog post or page to my site, I would need to regenerate my site and upload it to my host.

With docker, I have automated this process as it is easily repeatable. I use the other tools that I have mentioned to automate the redeployment of my site further

#### Reasons I Chose to Use Minify

* Minify is used to in a sense compress the contents of any web file (HTML, CSS, Javascript) to have less for the browser to process through
* Because it is in a single line, it can read that single line of code to load the assets of the site faster
* This is a small tweak to improve performance, but will become more important as my site grows in size

#### How I use Minify

It is part of the build process of my DockerFile to minify my site before serving it on Nginx

### Traefik

#### Reasons I use Traefik

* I wanted an option for a well optimized load balancer that is used with containers
* It simplifies management of certificates for HTTPS by using Let's Encrypt
* Allows for future redundancy and scaling of my site

#### How I use Traefik

Traefik is still something that is very new to me. I use it in a very basic sense inside my Docker Compose file. It uses labels inside docker to set specific settings for containers

I used the minimal viable configuration to get my site up and running using it with HTTPS.

#### Reasons I use Let's Encrypt

* Simplifies certificate management
* I don't need to buy a certificate to secure my blog

#### How I use Let's Encrypt

It is utilized by Traefik to manage HTTPS