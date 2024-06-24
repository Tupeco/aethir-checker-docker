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
```docker compose build```

Or, if you need to change your region from the default, eu, (change `na` to your region):

```docker compose build --build-arg region=na```


## Running
```docker compose up -d```

```docker compose logs cli```

```docker compose attach cli```
and set up your wallet. Refer to
https://docs.aethir.com/checker-nodes-explained/how-to-run-checker-node/checker-client-linux-cli-guide

Detach from the cli using `ctrl-p ctrl-q`

Check the logs using:

```docker compose logs checker```

