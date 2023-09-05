.PHONY: docker-run
docker-run:
	docker-compose -f docker-compose.yml up -d --remove-orphans