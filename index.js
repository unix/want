const { readFileSync, readdirSync, existsSync, statSync } = require('fs')
const { text } = require('micro')
const { join } = require('path')
const pkg = require('./package')
const getFolders = () => readdirSync(__dirname)
  .filter(item => {
    const dir = join(__dirname, item)
    return statSync(dir).isDirectory() && /^(?!\.|node_modules|user)/.test(item)
  })
const color = "$(tput setaf 2 2>/dev/null || echo '')"
const cyan="$(tput setaf 6 2>/dev/null || echo '')"
const red="$(tput setaf 1 3>/dev/null || echo '')"
const nocolor = "$(tput sgr0 2>/dev/null || echo '')"
const underline="$(tput smul 2>/dev/null || echo '')"
const bold="$(tput bold 2>/dev/null || echo '')"
const commands = `
echo "${underline}${cyan}WANT commands:${nocolor}"
echo "${bold}${red}> ${nocolor}${bold}${getFolders().join(', ')}"
echo "${bold}${red}> ${nocolor}input [${color}want <Command>${nocolor}] to run."
echo ""`
const welcome = `
echo "${underline}${cyan}WANT -- online shells.${nocolor} 😘😘"
echo "${bold}${red}> ${nocolor}${bold}version: ${pkg.version}"
echo "${bold}${red}> ${nocolor}${bold}read & help: ${pkg.repository}"
echo "${bold}${red}> ${nocolor}${bold}commands: want ls"
echo ""`
const find = (name) => getFolders().filter(item => item.includes(name))
const notFound = (param) => {
  const name = param.replace(/\?$/, '')
  const results = find(name)
  const showSearch = name.length > 1 && results.length
  let str = `echo "${bold}Not found shell with ${cyan}${name}${nocolor}.";echo ''`
  if (showSearch) {
    str += `
echo "${bold}Do you want:"
echo "${bold}${red}> ${nocolor}${results.join(', ')}"
echo ''`
  }
  return str
}

module.exports = async (req, res) => {
  let param = await text(req)
  if (req.url === '/.as') {
    param = 'install_want'
  }
  if (!param || param === '/') return welcome
  if (param === 'ls') return commands
  const sh = join(__dirname, param.replace(/[%20|' ']/g, '_'), 'index.sh')
  if (!existsSync(sh)) return notFound(param)
  
  const content = readFileSync(sh, 'utf-8')
  res.end(content)
}
