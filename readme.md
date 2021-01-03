# Info

Repository to use Office Project with docker

## Build new version
### Latest
Run `./build.sh` to create a new Version

### Specific Version
Make sure the [office-core](https://github.com/HoelShare/office-core) and [office-ui](https://github.com/HoelShare/office-ui) Repository contains the specific version tag

Run `./build.sh {tag}` e.g. `./build.sh 0.0.1` to create a new Version.

Tag will be created and pushed!


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
1. [OPTIONAL] build docker container
   1. initialize submodule first `git submodule update --init`
   1. `docker-compose build`
1. start docker containers `docker-compose up`
