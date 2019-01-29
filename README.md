Sidecar container for backing up volumes using resting over sftp.

## Build

```bash
docker build -t restic-sidecar .
```

## Run

```bash
docker run -v /path/to/id_rsa:/restic/key --env-file ./environment.env restic-sidecar
```

## Notes

When running in production, ssh key and `REPO_PASSWORD` should be provided by secrets, otherwise they might leak.