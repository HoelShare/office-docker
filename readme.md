# Info

Repository to use Office Project with docker

## Build new version
Run `./build.sh` to create a new Version

## Production use
1. Create `docker-compose.override.yml` 
1. Modify to your needs for example
   ```
   services:
        app:
            env_file:
               - core/.env.local

        ui:
            build:
                context: ui
                args:
                    API_BASE_URL: https://office.hoelshare.dev
   ```
1. [OPTIONAL] build docker container `docker-compose build`
1. start docker containers `docker-compose up`
