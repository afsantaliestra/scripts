.DEFAULT_GOAL := zsh

bash:
	@echo "Appending aliases and functions to .bashrc file."
	@echo "source ~/scripts/terminal_sources/aliases" >> ~/.bashrc
	@echo "source ~/scripts/terminal_sources/functions" >> ~/.bashrc

zsh:
	@echo "Appending aliases and functions to .zshrc file."
	@echo "source ~/scripts/terminal_sources/aliases" >> ~/.zshrc
	@echo "source ~/scripts/terminal_sources/functions" >> ~/.zshrc

databases: postgres mongo mysql redis hasura rabbitmq

postgres:
	@echo "Running PostgreSQL with PGAdmin4."
	@cd ./dck_scripts/postgres; docker-compose up -d
	@echo "PostgreSQL on port 5432 - PGAdmin4 on port 8070"

mongo:
	@echo "Running MongoDB with MongoExpress."
	@cd ./dck_scripts/mongo; docker-compose up -d
	@echo "MongoDB on port 27017 - MongoExpress on port 8071"

mysql:
	@echo "Running MySQL with PHPMyAdmin."
	@cd ./dck_scripts/mysql; docker-compose up -d
	@echo "MySQL on port 3306 - PHPMyAdmin on port 8072"

mysql:
	@echo "Running MySQL with PHPMyAdmin."
	@cd ./dck_scripts/mysql; docker-compose up -d
	@echo "MySQL on port 3306 - PHPMyAdmin on port 8072"

redis:
	@echo "Running Redis with RedisCommander."
	@cd ./dck_scripts/redis; docker-compose up -d
	@echo "Redis on port 6379 - RedisCommander on port 8073"

hasura:
	@echo "Running Hasura."
	@cd ./dck_scripts/hasura; docker-compose up -d
	@echo "Hasura on port 8073 - PostgreSQL on port 5433"

rabbitmq:
	@echo "Running RabbitMQ with RabbitMQ Management enabled."
	@cd ./dck_scripts/rabbitmq; docker-compose up -d
	@echo "RabbitMQ on ports 4369 5671 5672 15672 (web-cli)"
