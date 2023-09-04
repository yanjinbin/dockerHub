.PHONY: docker-run
docker-run:
	docker-compose -f docker/docker-compose.yml up -d --remove-orphans