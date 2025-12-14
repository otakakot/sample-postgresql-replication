SHELL := /bin/bash

.PHONY: psql
psql:
	@docker exec -it postgres psql -U postgres

.PHONY: old
old:
	@docker exec -it postgres-old psql -U postgres

.PHONY: new
new:
	@docker exec -it postgres-new psql -U postgres

.PHONY: up
up:
	@docker-compose up -d

.PHONY: data
data:
	@docker exec -it postgres-old psql -U postgres -f data/data.sql

.PHONY: dump
dump:
	@./script/dump.sh

.PHONY: publication
publication:
	@(cd terraform/publication && terraform init && terraform apply -auto-approve)

.PHONY: subscription
subscription:
	@(cd terraform/subscription && terraform init && terraform apply -auto-approve)

.PHONY: down
down:
	@docker-compose down -v
