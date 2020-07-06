<img src="demo.webp" width="600" height="300" />

## want

Run any commands without install.

Do you need to add any new scripts? [Please let me know](https://github.com/unix/want/issues/new)

<br/>

<br/>

### Usage

- `zsh` user:

    `echo 'want () { curl -sd "$*" https://want.now.sh | bash -s --; }' >> ~/.zshrc`

    `source ~/.zshrc`

- `bash` user (default on MacOS or Linux):

    `echo 'want () { curl -sd "$*" https://want.now.sh | bash -s --; }' >> ~/.bashrc`

    `source ~/.bashrc`
    
- `fish` user:

  Insert the following command in `~/.config/fish/config.fish`
  
  ```fish
  function want
    curl -sd $argv https://want.now.sh | bash -s --
  end
  ```
  
  and run `source ~/.config/fish/config.fish`

- use with sudo:

    `echo 'want-sudo () { curl -sd "$*" https://want.now.sh | sudo bash -s --; }' >> ~/.bashrc`

    `source ~/.bashrc`

    and run `want-sudo`.

<br/>

### Run

Just run `want` in your terminal.

<br/>

### Features

 - No packages, use immediately.

 - Without symbols: `want npm proxy on` == `want npm_proxy_on`.

 - List all commands: `want ls`.

 - Auto search: returns similar results when not found.

<br/>


### LICENSE
[MIT](LICENSE)
