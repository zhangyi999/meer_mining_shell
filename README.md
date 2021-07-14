<!--
 * @Author: zhangyi999
 * @Date: 2021-07-06 15:08:36
 * @LastEditTime: 2021-07-15 00:08:57
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /meer_mining_shell/README.md
-->
# meer testnet 网络挖矿说明

## 硬件最低要求

meer 采用 pow 共识，主要挖矿依赖为`cpu`算力，最低配置要求：2核/4G/40G硬盘/1M带宽【推荐系统 Ubuntu】

## 挖矿教程

挖矿需要部署 **【0.10-dev 版本】** 节点，然后开启挖矿程序

### 步骤

1. 安装： golang 【推荐版本 go1.16】[安装链接](https://golang.google.cn/dl/)
2. 获取 git 上的代码库 [https://github.com/Qitmeer/qitmeer/tree/0.10-dev](https://github.com/Qitmeer/qitmeer/tree/0.10-dev)  **【注意这里要选 0.10-dev 版本】**
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
        ~ qx ec-to-public 5d44b2f75f3513ab22fab82575b1ce41a86480548c5739be7a625a99bc76ca11 | qx ec-to-addr -v mixnet

        XmnqZubH9ZkBpv2n79DaYYfrZZsmZxWCppx

        # qx 工具并不储存任何数据，以上生成的助记词需要单独保存
    ```
    > 也可直接下载`kahf`钱包，创建`testnet`地址

4. 启动节点
    ```bash
    # 将 start.sh 脚本拷贝至 qitmeer 目录下
    ~ vi start.sh

    mining="--miningaddr XmnqZubH9ZkBpv2n79DaYYfrZZsmZxWCppx"
    ...
    # 如果取消对外方位，记得在云节点安全组里配置相应端口
    rpc="--rpclisten 0.0.0.0:1234 --rpcuser admin --rpcpass 123"
    ...
    # 配置节点 ip 地址
    externalip="--externalip=xx.xxx.xxx.x"

    :wq

    chmod +x start.sh

    # 启动节点
    sudo ./start.sh
    ```

5. 下载【qitmeer-miner Ubuntu 编译】[https://github.com/zhangyi999/meer_mining_shell/releases/download/0.10-dev/qitmeer-miner](https://github.com/zhangyi999/meer_mining_shell/releases/download/0.10-dev/qitmeer-miner)
    ```bash
    ~ git clone git@github.com:zhangyi999/meer_mining_shell.git
    ~ cd meer_mining_shell
    ~ wget https://github.com/zhangyi999/meer_mining_shell/releases/download/0.10-dev/qitmeer-miner

    ~ vi solo.conf
    
    #miner address【修改挖矿地址】
    mineraddress=XmnqZubH9ZkBpv2n79DaYYfrZZsmZxWCppx
    # node rpc server
    # 改为节点 ip 【内网可以配置为 内网ip】
    rpcserver=http://xx.xxx.xx.xx:1234
    # node rpc user【设置节点 rpc 用户名】
    rpcuser=admin
    # node rpc password【设置节点 rpc 密码】
    rpcpass=123
    ...
    # network privnet|testnet|mainnet|mixnet
    network=mixnet

    :wq

    chmod +x qitmeer-miner
    
    # 开始挖矿
    sudo ./qitmeer-miner  -C solo.conf
    ```
