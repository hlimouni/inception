DATA_DIR=/home/${USER}/data
WP_DB_DIR=/home/${USER}/data/wordpress_db
WP_FILES_DIR=/home/${USER}/data/wordpress_files

.PHONY: all down clean wipe confirm_wipe

up: $(DATA_DIR)
	@env $$(cat ./srcs/.env) docker-compose --file ./srcs/docker-compose.yml up -d --build

$(DATA_DIR): $(WP_DB_DIR) $(WP_FILES_DIR)	
		
$(WP_DB_DIR):
	@mkdir -p $(WP_DB_DIR)

$(WP_FILES_DIR):
	@mkdir -p $(WP_FILES_DIR)

down:
	@env $$(cat ./srcs/.env) docker-compose  -f ./srcs/docker-compose.yml down

wipe: down confirm_wipe
	sudo rm -rf $(DATA_DIR)
	docker volume rm $$(docker volume ls -q)
	docker rmi -f $$(docker images -qa)

confirm_wipe:
	@echo -n "Are you sure? [y/N] " && read ans && [ $${ans:-N} = y ]
