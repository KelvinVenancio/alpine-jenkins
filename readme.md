
### steps to build image and ran with Docker

- `git clone git@github.com:KelvinVenancio/alpine-jenkins.git`
- `cd alpine-jenkins`
- `docker build -t alpine_image .`
- `docker run -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock alpine_image`