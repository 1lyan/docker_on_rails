This is a Test Project with Ruby on Rails, Docker and Trailblazer

* Ruby version
2.6.5

* Rails version
6.0.2

* Local deployment
1. Install docker and run docker desktop locally.
2. ```docker build -t docker_on_rails .```
3. ```docker-compose up```
4. ```docker-compose run web rails db:create```
5. ```docker-compose run web rails db:migrate```
6. ```docker-compose run web rails db:migrate RAILS_ENV=test```
7. Run tests: ```docker-compose run web rspec```
8. Run the app in browser 
 - ```docker-compose run web rails db:seed```
 - http://localhost:3000

* How to use debugger with docker
0. In docker-compose.yml, in services -> web set "tty: true" and "stdin_open: true"
1. Put debugger in code
2. ```docker ps```
3. Find CONTAINER_ID in docker desktop app (looks like "421f5718174d") and copy-paste it
4. ```docker attach CONTAINER ID```

* Useful resources
 - https://medium.com/@guillaumeocculy/setting-up-rails-6-with-postgresql-webpack-on-docker-a51c1044f0e4
 - https://www.digitalocean.com/community/tutorials/containerizing-a-ruby-on-rails-application-for-development-with-docker-compose-ru
 - https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes
 - http://trailblazer.to/guides/index.html
 - https://docs.docker.com/compose/rails/

