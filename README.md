# libpomelo2_iOSDemo

## 描述
* Demo使用libpomelo2编译出的静态库，实现连接服务端，发送请求，获取推送

## 编译库
* Demo里使用的库，可在模拟器及真机上使用，并且含tls
* 官方的libpomelo2年久失修，编译起来会有很多问题，如果需要自行编译的，需要稍微修改gyp脚本。如果开启tls，会有部分编译错误，需要自己稍微去修改下源码
* 你也可以用demo里的库和代码，只需要把libpomelo2文件夹拖入工程，再把PomeloHelper加入工程，就可以像demo一样使用了
