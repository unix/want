const { readFileSync, readdirSync, existsSync, statSync } = require('fs')
const { join } = require('path')
const pkg = require('../package')
const rootPath = join(__dirname, '../')
const ignoreReg = /^(?!\.|node_modules|user|api|install_want)/

const getFolders = () => readdirSync(rootPath)
  .filter(item => {
    const dir = join(rootPath, item)
    return statSync(dir).isDirectory() && ignoreReg.test(item)
  })

const color = "$(tput setaf 2 2>/dev/null || echo '')"
const cyan="$(tput setaf 6 2>/dev/null || echo '')"
const white="$(tput setaf 0 2>/dev/null || echo '')"
const background="$(tput setab 7 2>/dev/null || echo '')"
const gray="$(tput setaf 7 2>/dev/null || echo '')"
const nocolor = "$(tput sgr0 2>/dev/null || echo '')"
const bold="$(tput bold 2>/dev/null || echo '')"
const commands = `
echo "${gray}All commands:${nocolor}"
echo "  ${bold}${getFolders().join(', ')}\n"
echo "${gray}> Input [${color}want <Command>${nocolor}${gray}] to run/search."
echo ""`
const welcome = `
echo "\n  ${background}${white} WANT ${nocolor} "
echo "  -- Commands for human 😘😘 \n"
echo "${bold}${gray}  ${bold}version: ${pkg.version}"
echo "${bold}${gray}  ${bold}read & help: ${pkg.repository}\n"`

const notFound = param => {
  const name = param.replace(/\?$/, '')
  const results = getFolders()
    .filter(item => item.includes(name))
  const showSearch = name.length > 1 && results.length
  let str = `echo "${gray}No shell named ${cyan}${name}${nocolor}.";`
  if (showSearch) {
    str += `
echo "${bold}${gray}Do you want ${nocolor}👉 "
echo "  ${results.join(', ')}"
echo ''`
  }
  return str
}

module.exports = async (req, res) => {
  if (!req.body || typeof req.body !== 'object') return res.send(welcome)
  
  const keyword = Object.keys(req.body)
    .join('_')
    .replace(/[%20|' ']/g, '_')
  
  if (!keyword || keyword === '/') return res.send(welcome)
  if (keyword === 'ls') return res.send(commands)
  
  const sh = join(rootPath, keyword, 'index.sh')
  if (!existsSync(sh)) return res.send(notFound(keyword))
  
  const content = readFileSync(sh, 'utf-8')
  res.end(content)
}
