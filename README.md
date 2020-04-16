# Discourse
Discourse is the 100% open source discussion platform built for the next decade of the Internet. Use it as a mailing list, discussion forum, long-form chat room, and more!
https://www.discourse.org

# How to deploy Discourse?
This image of Discourse runs as a production version of Discourse.  This means that you need a postgres database and a redis server.  

The simplest way to run this image is to use BroadIQ to launch the image in a Kubernetes environment.  Simply go to the BroadIQ marketplace (https://www.broadiq.com) and launch the application and it will be available to use in minutes.  

This image can also be run in a docker container.  You will still need to provide access to a redis and postgres server.  This image does not run any self contained redis or postgres servers.

