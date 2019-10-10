
### steps to build image and ran with Docker [![Build Status](https://travis-ci.com/KelvinVenancio/alpine-jenkins.svg?branch=master)](https://travis-ci.com/KelvinVenancio/alpine-jenkins)

- `git clone git@github.com:KelvinVenancio/alpine-jenkins.git`
- `cd alpine-jenkins`
- `docker build -t jenkins_image .`
- `docker run -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock jenkins_image`
