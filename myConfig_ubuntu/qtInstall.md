# Qt5安装和配置(Qt5.4.1)//了解
下载地址：
http://download.qt.io/archive/qt/ 
ubuntu 32位下载：qt-opensource-linux-x86-5.4.1.run 
ubuntu 64位下载：qt-opensource-linux-x64-5.4.1.run 

ubuntu18.04以上建议下载Qt的较新版本：
qt-opensource-linux-x64-5.11.2.run

-------------------------------------------------------------- 
#Qt5.4安装示意（32位ubuntu 16.04，上课用的开发环境）
1）下载qt安装包
   qt-opensourse-linux-x86-5.4.1.run
2）运行安装程序
    `chmod +x qt-opensource-linux-x64-5.14.2.run`
	./qt-opensourse-linux-x86-5.4.1.run`
	注：根据提示，默认安装在主目录下
3）环境变量配置(PATH)
思路：将Qt相关的可执行程序所在路径添加到PATH中
	/home/panda/.App/qt/5.14.2/gcc_64/bin
	/home/panda/.App/qt/Tools/QtCreator/bin

	`sudo vim /etc/environment`
	
	```
	PATH="/home/panda/.App/qt/Tools/QtCreator/bin:/home/panda/.App/qt/5.14.2/gcc_64/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"

	```

4）重启系统测试
  执行“qmake -v”正常看到Qt的版本信息
  执行“qtcreator”正常可以进入Qt的集成开发环境界面
--------------------------------------------------------------  
#问题：提示缺少libgstreamer...相关库
解决：在线安装
`sudo apt-get install libgstreamer0.10-0`
`sudo apt-get install libgstreamer-plugins-base0.10-0`

问题：编译Qt程序时提示缺少libgl...相关库(没有安装openGL)
解决：在线安装
`sudo apt-get install libgl1-mesa-dev`
