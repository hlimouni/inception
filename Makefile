DATA_DIR=/home/hlimouni/data
WP_DB_DIR=/home/hlimouni/data/wordpress_db
WP_FILES_DIR=/home/hlimouni/data/wordpress_files

all: $(DATA_DIR)
	docker-compose -f ./srcs/docker-compose.yml up -d --build

$(DATA_DIR): $(WP_DB_DIR) $(WP_FILES_DIR)
	
		
$(WP_DB_DIR):
	@mkdir -p /home/hlimouni/data
	@mkdir -p /home/hlimouni/data/wordpress_db

$(WP_FILES_DIR):
	@mkdir -p /home/hlimouni/data/wordpress_files

down:
	docker-compose  -f ./srcs/docker-compose.yml down
	sudo rm -rf $(DATA_DIR)