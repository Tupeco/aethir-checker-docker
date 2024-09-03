# aethir-checker-docker
Docker composefiles for running Aethir checker node in Linux under Docker

## Prerequisites
* docker
* docker compose v2

If you want to run in a non-x86_64 system (e.g. Raspberry Pi 5), you will also need QEMU x86 system emulation binaries,Astatically built QEMU x86 usermode binaries, and QEMU usermode binfmt registrations.
In Ubuntu 24.04, for example, these are provided by the packages:
* qemu-system-x86
* qemu-user-static
* qemu-user-binfmt

## Building images
You can either run:
```docker compose build```

or use the build script:
```./build.sh```

This build script will check the Aethir Checker git repo and invalidate the build cache starting from the point of the package download if the repository HEAD has been updated.

This build cache invalidation can be forced by passing the `--update` parameter:
```./build.sh --update```

If the above does not work for you, you can skip the build cache entirely:
```docker compose build --no-cache```


## Running
```docker compose up -d```

```docker compose logs cli```

```docker compose attach cli```
and set up your wallet. Refer to
https://docs.aethir.com/checker-nodes-explained/how-to-run-checker-node/checker-client-linux-cli-guide

Detach from the cli using `ctrl-p ctrl-q`

Check the logs using:

```docker compose logs checker```


## Monitoring
```docker compose --profile with-metrics up -d```

This will create a few extra services which provide data for Prometheus and Grafana. Access the graphs by visiting
```http://localhost:3000``` in your browser. Initial credentials will be `username: admin`, `password: admin`.
The data source and a sample dashboard should be provisioned and ready out of the box.


## Known issues
* automatic update probably does not work

