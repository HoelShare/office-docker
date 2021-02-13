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
2. Modify to your needs for example

The proxy Service bundles the services and Exposes on port 80/443.
It's possible to toggle SSL usage by env variable `USE_SSL` (place `fullchain.pem` & `privkey.pem` in certs folder).
Configure Url with environment variable `APP_URL`.

```yaml
services:
    proxy:
      environment:
        APP_URL: office.hoelshare.dev
        USE_SSL: 1

    app:
        env_file:
            - core/.env.local
        volumes:
            - "./core/saml/authsources.php:/app/config/authsources.php"
        depends_on:
          - ldap
          - saml
        links:
          - ldap:ldap

    ui:
        build:
            context: ui
            args:
                API_BASE_URL: https://office.hoelshare.dev
                AUTH_METHOD: saml

    ldap:
      image: rroemhild/test-openldap

    saml:
      image: kristophjunge/test-saml-idp
      ports:
        - "18080:8080"
        - "18443:8443"
      environment:
        SIMPLESAMLPHP_SP_ENTITY_ID: http://localhost:18080/simplesaml/saml2/idp/metadata.php
        SIMPLESAMLPHP_SP_ASSERTION_CONSUMER_SERVICE: https://office.hoelshare.dev/api/saml/callback

```

3. [OPTIONAL] build docker container
   1. initialize submodule first `git submodule update --init`
   1. `docker-compose build`
4. start docker containers `docker-compose up`
