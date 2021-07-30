<!--
 * @Author: zhangyi999
 * @Date: 2021-07-06 15:08:36
 * @LastEditTime: 2021-07-31 00:26:58
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /meer_mining_shell/README.md
 https://github.com/zhangyi999/meer_mining_shell/releases/download/0.10-dev/qimeer-miner.zip
-->
# meer testnet 网络挖矿说明

## 硬件最低要求

meer 采用 pow 共识，主要挖矿依赖为`cpu`算力，最低配置要求：2核/4G/40G硬盘/1M带宽【推荐系统 Ubuntu】

## 挖矿教程

编译版本为简化版，适合快速安装

### 步骤

1. 下载安装包 [https://github.com/zhangyi999/meer_mining_shell/releases/download/0.10-dev/miner.zip](https://github.com/zhangyi999/meer_mining_shell/releases/download/0.10-dev/miner.zip)

```bash
~ wget https://github.com/zhangyi999/meer_mining_shell/releases/download/0.10-dev/miner.zip
```

2. 解压安装包
```bash
~ unzip miner.zip

miner.sh  miner.zip  qitmeerd  qitmeer-miner  solo.conf  start.sh
```
3. 下载`kahf`钱包，创建`testnet`地址
4. 替换地址
```bash
~ vim solo.conf

...
#miner address 钱生成的地址，一个节点一个地址
mineraddress=TnRsZeGK3zHRdCt1pgFiUMdyNDToyp7jB6v
...
# node rpc user 这里要和 start.sh 文件对应
rpcuser=test
  # node rpc password
rpcpass=test

:wq


~ vim start.sh

...
mining="--miningaddr TnXXXXXXXXXXXX"
...
rpc="--rpclisten 127.0.0.1:1234 --rpcuser test --rpcpass test"

:wq
```

5. 启动挖矿
```bash
~ chmod a+x miner.sh
~ chmod a+x start.sh

./start.sh
./miner.sh
```

6. 区块浏览器查询[https://testnet.meerscan.io/address/TnXXXXXXXX](https://testnet.meerscan.io)