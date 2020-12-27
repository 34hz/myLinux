# Ubuntu 初始化流程
- 查看最新文件 [github](https://github.com/34hz/myLinux/edit/main/myConfig_ubuntu/ubuntuInstall.md)
## 环境环境配置
### 换源
```sh
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo sed -i 's/security.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list
sudo sed -i 's/archive.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list
sudo apt update && apt-get upgrade	
```
其他apt命令
```sh
sudo apt-get update  更新源
sudo apt-get install package 安装包
sudo apt-get remove package 删除包
sudo apt-cache search package 搜索软件包
sudo apt-cache show package  获取包的相关信息，如说明、大小、版本等
sudo apt-get install package --reinstall  重新安装包
sudo apt-get -f install  修复安装
sudo apt-get remove package --purge 删除包，包括配置文件等
sudo apt-get build-dep package 安装相关的编译环境
sudo apt-get upgrade 更新已安装的包
sudo apt-get dist-upgrade 升级系统
sudo apt-cache depends package 了解使用该包依赖那些包
sudo apt-cache rdepends package 查看该包被哪些包依赖
sudo apt-get source package  下载该包的源代码
sudo apt-get clean && sudo apt-get autoclean 清理无用的包
sudo apt-get check 检查是否有损坏的依赖
```

### 安装常用依赖
sudo apt install
`vim curl git wget nodejs ccls npm ranger make cmake zsh zsh-autosuggestions zsh-syntax-highlighting autojump htop`
`fcitx-bin fcitx-table smplayer`

## 配置vim
![Vim](https://www.runoob.com/wp-content/uploads/2015/10/vi-vim-cheat-sheet-sch.gif)
### 检查依赖

- node.js `sudo apt install nodejs`
- ccls`sudo apt install ccls`
- npm`sudo apt install npm -y`
- 一键安装`sudo apt install nodejsccls npm -y`
### 1> 在家目录下创建vim配置文件`.vimrc`文件

`vim ~/.vimrc`
根据自己需求修改配置文件
我的`.vimrc` [github](https://github.com/34hz/myLinux/blob/main/myConfig_ubuntu/vimrc)

### 2> 安装插件plug
如果网络不好建议直接拷贝我的整个'.vim'文件夹覆盖到`~/.vim` [文件夹地址](https://github.com/34hz/myLinux/blob/main/myConfig_ubuntu/vim.tar) 然后可直接跳过后面所有的vim配置操作

- 终端运行
`curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

### 3> 安装插件(科学上网)
vimrc中的相关键位映射
```
map PS :PlugStatus<CR> 
map PI :PlugInstall<CR> 
```

可视模式下运行大写`PS`为查询插件状态

可视模式下运行大写`PI`为安装插件

### 4> 配置coc插件(代码补全插件)

- 错误提示

```
[coc.nvim] javascript file not found, please compile the code or use release branch.
 ENTER or type command to continue
```

- 解决办法
  1. 进入coc.nvim目录
     `cd ~/.vim/plugged/coc.nvim/`
  2. 挂梯子执行`install.sh`
     `./install.sh`
  3. 进入vim执行命令
     可视窗口下运行`PS`
- 还不行的话,拷贝整个.vim文件夹

## 配置zsh

### 安装主题`oh-my-zsh`

`sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"`
`sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"`
- 解决443问题,修改hosts
`sudo vi /etc/hosts`添加以下内容保存即可 （IP地址查询后相应修改，可以ping不同IP的延时 选择最佳IP地址）
```
# GitHub Start
52.74.223.119 github.com
192.30.253.119 gist.github.com
54.169.195.247 api.github.com
185.199.111.153 assets-cdn.github.com
151.101.76.133 raw.githubusercontent.com
151.101.108.133 user-images.githubusercontent.com
151.101.76.133 gist.githubusercontent.com
151.101.76.133 cloud.githubusercontent.com
151.101.76.133 camo.githubusercontent.com
151.101.76.133 avatars0.githubusercontent.com
151.101.76.133 avatars1.githubusercontent.com
151.101.76.133 avatars2.githubusercontent.com
151.101.76.133 avatars3.githubusercontent.com
151.101.76.133 avatars4.githubusercontent.com
151.101.76.133 avatars5.githubusercontent.com
151.101.76.133 avatars6.githubusercontent.com
151.101.76.133 avatars7.githubusercontent.com
151.101.76.133 avatars8.githubusercontent.com
# GitHub End
```
- 切换默认终端

  查看当前所有终端

  `cat /etc/shells`

  更换终端

  `chsh -s /bin/zsh`

- 重启`reboot`

### zsh安装插件
- 安装补全插件

`git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions`

- 语法高亮插件

`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`


### 安装powerlevel10k主题(请先安装对应字体)

`git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k`

字体网站 [Nerd-Fonts](https://github.com/ryanoasis/nerd-fonts#font-installation)
`https://www.nerdfonts.com/` 

#### wsl2配置
下载Hack 安装到win10字体,在终端配置文件中开启
`fontFace": "Hack NF"`


#### Ubuntu系统安装字体方法

cd到下载目录
```
sudo cp *.ttf /usr/share/fonts
cd /usr/share/fonts
mkfontscale
sudo apt install xfonts-utils
mkfontdir
fc-cache -fv
```
### **然后编辑 zsh的配置文件**

`vim ~/.zshrc`
我的.zshrc文件[github](https://github.com/34hz/myLinux/blob/main/myConfig_ubuntu/zshrc)

- 开启安装的插件
修改`.zshrc` 中的 `plugins` .默认应该是 `plugins=(git)` 改为
```
plugins=(git
autojump                                                                  
zsh-autosuggestions
zsh-syntax-highlighting
)
```
- 开启上面安装的主题powerlevel10k
修改`.zshrc` 中的变量 `ZSH_THEME`为
`ZSH_THEME="powerlevel10k/powerlevel10k"`

## 宝塔面板

### 资源链接

一键安装命令:

`wget -O install.sh http://download.bt.cn/install/install-ubuntu_6.0.sh && sudo bash install.sh`

### 查看信息
`sudo bt`
### 更新脚本

`curl http://download.bt.cn/install/update6.sh|bash`

### bt重启服务(**若点击更新后没生效，请尝试重启面板服务：**)

` bt restart`
