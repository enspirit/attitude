DOCKER_REGISTRY := $(or ${DOCKER_REGISTRY},${DOCKER_REGISTRY},docker.io)

image:
	docker build -t chefbe/attitude .

image.push:
	docker push chefbe/attitude

up:
	docker run --rm -p 3000:3000 chefbe/attitude

tests:
	bundle exec rake spec

krestart:
	kubectl -n chefbe rollout restart deployment/balletschoolattitude
