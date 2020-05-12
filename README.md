# MongoDB sharding Setup

This is inspired from [I'm an inline-style link](https://www.google.com)


Simple MongoDB sharding setup with each shard having its own replica set. Configuration and docker setup is inspired from [mongo-replica-set](https://github.com/frontalnh/mongodb-replica-set)

In order to horizontally scale in MongoDB, you need a set of a shards each having their own replica for high availibility.

This project makes it easy to build a MongoDB sharded-replica set circumstances by using docker container.

## Requirements

This project uses a Docker container for virtualizing Database circumstances.
Therefore, **Docker** must be installed

To set localhost host environment, **Direnv** must be installed

**how to install direnv?**

install with brew

```sh
brew install direnv
```

set bash configuration(if you use bash)
set zsh configuration(if you use zsh)

```sh
vi ~/.bashrc or vi ~/.zshrc

# add below configuration
eval "$(direnv hook bash)" or eval "$(direnv hook zsh)"

# apply
source ~/.bashrc or source ~/.zshrc
```

## Installation

Pull all the necessary docker image from docker hub and set up replica set configuration

```bash
docker-compose up
```

Set host name so that localhost can connect to docker container's internal ip with given mongodb configuration setting

```bash
direnv allow
```

## Set host for connecting to docker inner network

Changing directory to /dev triggers direnv setting so that hostname mongo-rs0-1, mongo-rs0-2, mongo-rs0-3 will be registered in you pc

```sh
cd dev
```

If you have Err: **direnv: error .envrc is blocked** Run `direnv allow` to approve its content.

```bash
direnv allow
```

This project runs Nine docker containers for mongo replica sets (two sharded servers and one configuration server).
This project also runs a mongos container for illusting the following(with a timeout of 2 minutes, after each command):
1. Starting first replica Set
2. Checking if first replica set is up
3. Populating first replica Set
4. Starting config server replica set
5. Starting local mongos
6. Add first replica as shard
7. Starting second replica set
8. Add second replica as a shard
9. Enable sharding and Shard the populated collection
10. Check sharding status
