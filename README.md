**want**

Run some interesting commands without install. (`want` saves me a lot of time.)

`want` was inspired by [zeit/install-node](https://github.com/zeit/install-node).


<br/>
<br/>

### Usage

- use zsh: 

    `echo 'want () { curl -sd "$*" https://want.now.sh | bash -s --; }' >> ~/.zshrc`
    
    `source ~/.zshrc`

- use bash:

    `echo 'want () { curl -sd "$*" https://want.now.sh | bash -s --; }' >> ~/.bashrc`
    
    `source ~/.bashrc`
    
- use with sudo:

    `echo 'want-sudo () { curl -sd "$*" https://want.now.sh | sudo bash -s --; }' >> ~/.bashrc`
    
    `source ~/.bashrc`
    
    and run `want-sudo`.

<br/>

### Run

run `want <command>`:

- npm_proxy_on: `want npm_proxy_on`

- npm_proxy_off: `want npm_proxy_off`

- See the project catalogue for more commands.

<br/>

### Features

 - No packages, use immediately.

 - Without symbols: `want npm proxy on` == `want npm_proxy_on`.
 
 - List all commands: `want ls`.
 
 - Auto search: returns similar results when not found.
 
<br/>


### LICENSE
[MIT](LICENSE)
