```shell
$ docker-compose up
$ docker-compose run --rm web bin/rails c
$ docker-compose stop
```

## 看容器内的进程

```shell
$ docker top daemon_dave	
$ sudo docker exec -d daemon_dave touch /etc/new_config_file #执行命令
$ sudo docker exec -t -i daemon_dave /bin/bash #进行交互式命令
```

