# Docker Support


## 实现原理

1. 通过`docker run -t -d` 启动一个后台容器（挂在当前工作空间）, 获取container id
2. 通过`docker top`命令检查容器启动状态
3. 通过`docker exec -t container.id command` 执行脚本
4. 通过`docker stop --time=1`停止容器
5. 通过`docker rm -f`清理容器

# 举例 demo

## 1. 启动后台容器

`docker run -t -d -u 0:0 -v /root/.m2:/root/.m2 -w /data/ws -v /data/ws:/data/ws:rw,z -e *** maven:3-alpine cat`

需要提供的信息： 
1. 启动用户
2. 映射工作空间`-v ws.dir:ws.path`
3. 设置工作路径`-w ws.dir`
4. 环境变量`-e ***`

## `docker top`

`docker top ${container.id} -eo pid.comm`

## `docker exec -t ${container.id} abs_command`


## `docker stop --time=1 ${container.id}`

## `docker rm -f ${container.id}`

