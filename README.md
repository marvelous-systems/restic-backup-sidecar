Sidecar container which runs restic using sftp backend configured by environment using cron.

State: restic builds and is installed to an alpine container. Entrypoint exists after running cron, so I will try running supervisord in foreground: https://docs.docker.com/config/containers/multi-service_container/