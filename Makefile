build:
	docker-compose build
setup:
	docker-compose run web rake db:create db:migrate
up:
	docker compose up
