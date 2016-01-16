[docker-jekyll-gen][dh]
=================
A Docker container with Jekyll and s3_website for faster continuous delivery.
This container is used for generating and publishing Jekyll powered static
sites as part of a GitLab CI pipeline. This docker container should be specified
when configuring your GitLab CI runner. You can use this container by creating
a docker runner using `minn/jekyll-gen` from the Docker Hub. [Minn Soe's personal
blog and portfolio][minn] is generated using this Docker container and GitLab CI.

The commands `jekyll`, `s3_website`, and `bundle` are available. If additional
plugins are required please run `bundle install` with your own Gemfile. Use
`bundle exec` to ensure commands are executed in the context of your bundled gems.

Packages Included:
* ruby (2.2)
* bundler
* jekyll (2.5)
* s3_website (2.12)
* NodeJS (latest)
* Oracle JDK 8

[dh]: https://hub.docker.com/r/minn/jekyll-gen/
[minn]: https://minn.io/
