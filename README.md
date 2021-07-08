<!--
 * @Author: zhangyi999
 * @Date: 2021-07-06 15:08:36
 * @LastEditTime: 2021-07-08 12:22:32
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /meer_mining_shell/README.md
-->
# meer 内测网挖矿说明
meer mining shh

## 云节点挖矿要做什么？

1. 准备硬件： 2核/4G/40G硬盘/1M带宽
2. 安装 golang 【版本 go1.16】
3. 获取 git 上的代码库 [mixnet 版本](https://github.com/Qitmeer/qitmeer/tree/0.10-dev)
4. 创建 mixnet 地址
    * 用 qx 工具创建，进入 `qitmeer/cmd/qx` 目录，`go build` 生成 qx 文件
    * 创建助记词 `qx entropy | qx mnemonic-new`
    * 创建 mixnet 地址 `qx  mnemonic-to-entropy'...mnemonic word...' | qx ec-new | qx ec-to-public | qx ec-to-addr -v mixnet`
    * 获得 X 开头的地址
    * 也可直接 下载 `kahf` 钱包内测版，生成地址

5. 配置文件，拷贝 `miner.sh、start.sh、createCuckoo24.sh、createBlake2bd.sh` 到 `qitmeer` 下
6. 修改 `start.sh` 文件中 `mining '改为上面的地址'` ， `ip 改为云节点 IP`
7. 运行 `start.sh` 启动节点，新建窗口运行 `miner.sh` 开始挖矿。
