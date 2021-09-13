DATA_DIR=/home/${USER}/data
WP_DB_DIR=/home/${USER}/data/wordpress_db
WP_FILES_DIR=/home/${USER}/data/wordpress_files

.PHONY: all down clean wipe confirm_wipe

all: $(DATA_DIR)
	docker-compose -f ./srcs/docker-compose.yaml up -d --build

$(DATA_DIR): $(WP_DB_DIR) $(WP_FILES_DIR)	
		
$(WP_DB_DIR):
	@mkdir -p $(WP_DB_DIR)

$(WP_FILES_DIR):
	@mkdir -p $(WP_FILES_DIR)

down:
	@docker-compose  -f ./srcs/docker-compose.yaml down

wipe: down confirm_wipe
	sudo rm -rf $(DATA_DIR)

confirm_wipe:
	@echo -n "Are you sure? [y/N] " && read ans && [ $${ans:-N} = y ]
