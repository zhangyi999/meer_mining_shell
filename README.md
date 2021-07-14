<!--
 * @Author: zhangyi999
 * @Date: 2021-07-06 15:08:36
 * @LastEditTime: 2021-07-14 10:19:33
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /meer_mining_shell/README.md
-->
# meer testnet 网络挖矿说明

## 硬件最低要求

meer 采用 pow 共识，主要挖矿依赖为`cpu`算力，最低配置要求：2核/4G/40G硬盘/1M带宽

## 挖矿教程

1. 安装： golang 【推荐版本 go1.16】[安装链接](https://golang.google.cn/dl/)
2. 获取 git 上的代码库 [https://github.com/Qitmeer/qitmeer/tree/0.10-dev](https://github.com/Qitmeer/qitmeer/tree/0.10-dev) *** 【注意这里要选 0.10 版本】 ***
    ```bash
    ~ go version
    go version go1.16 darwin/amd64

    git clone https://github.com/Qitmeer/qitmeer/tree/0.10-dev
    
    cd qitmeer

    ~ make
    Done building.
    qitmeer version 0.9.2+dev-1f5defd (Go version go1.16))
    Run "./build/bin/qitmeer" to launch.

    # 依赖安装时如果安装超时则需要配置代理
    export GOPROXY=https://goproxy.io
    ```
3. 创建 testnet 地址
    * 用 qx 工具创建
    ```bash
        # 进入 qitmeer/cmd/qx
        ~ cd qitmeer/cmd/qx
        ~ go build

        # 生成助记词
        ~ qx entropy | qx mnemonic-new
        day this impose priority relax april fiction thunder kiwi twice addict spawn like few all east penalty arrive foster sniff page hold magic erosion

        # 导出种子
        ~ qx mnemonic-to-seed 'day this impose priority relax april fiction thunder kiwi twice addict spawn like few all east penalty arrive foster sniff page hold magic erosion'

        b5ffd6e8aa0f1d0ced012f3e76706929ef852e150bf7ca21a3cd85fe2148a375513dd245e46aa5f6c6ec9f825a18498b49e6981fdce6bc21a8c9fb0884d85b9c

        # 创建私钥
        ~ qx ec-new b5ffd6e8aa0f1d0ced012f3e76706929ef852e150bf7ca21a3cd85fe2148a375513dd245e46aa5f6c6ec9f825a18498b49e6981fdce6bc21a8c9fb0884d85b9c

        5d44b2f75f3513ab22fab82575b1ce41a86480548c5739be7a625a99bc76ca11

        # 创建地址
        ~ qx ec-to-public 5d44b2f75f3513ab22fab82575b1ce41a86480548c5739be7a625a99bc76ca11 | qx ec-to-addr -v testnet

        TmcpXmwHutepH2wL829PekKodQp7HmzNnKX

        # qx 工具并不储存任何数据，以上生成的助记词需要单独保存
    ```
    * 也可直接下载`kahf`钱包，创建`testnet`地址

5. 将配置文件`miner.sh、start.sh、createCuckoo24.sh、createBlake2bd.sh`拷贝到 `qitmeer` 目录下
6. 修改 `start.sh` 配置
   ```bash
    ~ vim start.sh
    network="--testnet"
    mining="--miningaddr TmcpXmwHutepH2wL829PekKodQp7HmzNnKX"
    ...
    # 这里可以使用内网ip
    externalip="--externalip=47.xx.xxx.xx"
   ```
7. 运行 `start.sh` 启动节点，新建窗口运行 `miner.sh` 开始挖矿。

