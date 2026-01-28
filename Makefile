up:
	@if [ ! -f ".env" ]; then \
		cp .env.example .env ; \
		sed -i.bak "s/^APP_USER_ID=.*/APP_USER_ID=$$(id -u)/" .env; \
		sed -i.bak "s/^APP_USER_GROUP_ID=.*/APP_USER_GROUP_ID=$$(id -g)/" .env; \
		rm -f .env.bak; \
	fi

	docker compose build
	docker compose up -d
