# geoip

An [Oh-My-Zsh](http://ohmyz.sh/) plugin get IP Geo information from free [API](http://ip-api.com/), available for Linux and Mac OS X, not test on Windows. (Support in both Chinese and English).

### How to install
- Clone this repo to your Oh-My-Zsh plugin directory or custom directory

```
cd $ZSH_CUSTOM
cd plugins
git clone https://github.com/nylqd/geoip.git
```
- Enable `geoip` in the `.zshrc` file. You'll find the zshrc file in your `$HOME` directory. Open it with your favorite text editor and you'll see a spot to list all the plugins you want to load. For example, this line might begin to look like this:

```
plugins=(git bundler osx rake ruby)

# add geoip 
plugins=(git bundler osx rake ruby geoip)
```
- After add `geoip` to plugin list, the only thing you need to do is let `.zshrc` file go into effect by using this command `source .zshrc`.

- Now, you are all set.


### Usage
- If `geoip` command is called without an argument, get Geo information of current IP address.
- If `geoip` command is called with an IP address or URL like `geoip 8.8.8.8`, get Geo information of given IP address or URL.

### Example
```
# geoip 114.114.114.114

IP地址: 114.114.114.114
位置: 中国 -> 江苏省 -> 南京
时区: Asia/Shanghai
运营商: "International Pioneering Park"

# geoip 8.8.8.8

IP Address: 8.8.8.8
Location: "United States" -> California -> "Mountain View"
Timezone: America/Los_Angeles
ISP: Google

# geoip github.com

IP Address: 192.30.253.113
Location: "United States" -> California -> "San Francisco"
Timezone: America/Los_Angeles
ISP: GitHub
```

