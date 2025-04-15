# pulling local pre-built vsc-python image
FROM vsc-python:latest AS devcontainer

COPY .env/ /tmp/.env


FROM bitnami/postgresql:17

COPY --from=devcontainer /tmp/.env /tmp/.env
