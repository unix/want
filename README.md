**want**

Run some interesting commands without install. (`want` saves me a lot of time.)

`want` was inspired by [zeit/install-node](https://github.com/zeit/install-node).

Try once: `curl -s https://want.now.sh | bash -s --`

<br/>
<br/>

### Usage

**set alias once**

`alias want(){curl -sd "$*" https://want.now.sh | bash -s --}`

**OR, set to bashrc**

`echo 'want(){curl -sd "$*" https://want.now.sh | bash -s --}' >> ~/.bashrc`
`source ~/.bashrc`

**OR, set to zshrc**

`echo 'want(){curl -sd "$*" https://want.now.sh | bash -s --}' >> ~/.zshrc`
`source ~/.zshrc`

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
