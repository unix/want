<img src="demo.webp" width="600" height="300" />

## want

Run the shell command from GitHub without install.

Want is the tool I used to manage shell commands, you can try using Want by following the documentation below,
or by [adding some new commands](https://github.com/unix/want/issues/new). If you need to manage all the content yourself,
fork this repository and redeploy it.

<br/>

### Setup

Depending on your terminal, choose a way to install:

- For "ZSH" users:

  `echo 'want () { curl -sd "$*" https://want.unix.bio | bash -s --; }' >> ~/.zshrc`

  `source ~/.zshrc`

- For "Bash" users (default on macOS or Linux):

  `echo 'want () { curl -sd "$*" https://want.unix.bio | bash -s --; }' >> ~/.bashrc`

  `source ~/.bashrc`

- For "fish" users:

  Insert the following command in `~/.config/fish/config.fish`

  ```fish
  function want
    curl -sd $argv https://want.unix.bio | bash -s --
  end
  ```

  and run `source ~/.config/fish/config.fish`.

- With sudo (Not recommended):

  `echo 'want-sudo () { curl -sd "$*" https://want.unix.bio | sudo bash -s --; }' >> ~/.bashrc`

  `source ~/.bashrc`

  and run `want-sudo`.

<br/>

### Run

After completing the **Setup** steps above, jsut run `want`.

<br/>

### Features

- No packages, use immediately.

- Without symbols: `want npm proxy on` == `want npm_proxy_on`.

- List all commands: `want ls`.

- Auto search: returns similar results when not found.

<br/>

### LICENSE

[MIT](https://raw.githubusercontent.com/unix/want/master/LICENSE)
