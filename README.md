# ABS

一个基于ant的构建系统库

# 依赖变量

## path variable
* asl.root
* asl.tasks.root

# runtime variable
* abs.task.id
* abs.run.id (.ci/hello.properties file, hello is run.id)
* abs.run.img (docker images)
* abs.run.options(docker options)
* ab.run.mode(options: host,dind)
* abs.log.level(options: debug/info/warn)

# Task Spec(任务规范)

## 目录结构

<pre>
    task.id: hello
    + hello
      - .ci.yml [任务插件的构建配置]
      - .gitignore 
      - run.xml [任务插件运行入口]
      - VERSION [版本文件，命名规范参考semver]
      - README.md [文档]
</pre>

# 调试方式

```bash

# mkdir abs-tasks; cd abs-tasks
# git clone asl.git asl
# mkdir hello; cd hello
# touch run.xml
# ../asl/run.sh hello

```
