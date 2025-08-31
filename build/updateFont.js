const webfont = require('webfont')
const fs = require('fs')
const path = require('path')

const svgs = [
  'symbol-class.svg',
  'chevron-down.svg',
  'chevron-right.svg',
  'chevron-up.svg',
  'chevron-left.svg',
  'project.svg',
  'constructor.svg',
].map((name) => path.join(__dirname, '..', 'icons', name))

async function generateFont() {
  try {
    const result = await webfont.webfont({
      files: svgs,
      formats: ['woff'],
      startUnicode: 0xe000,
      verbose: true,
      normalize: true,
      sort: false,
      fontHeight: 1000,
    })
    const dest = path.join(__dirname, '..', 'theme', 'vscode-10.woff')
    fs.writeFileSync(dest, result.woff, 'binary')
    console.log(`Font created at ${dest}`)
  } catch (e) {
    console.error('Font creation failed.', e)
  }
}

generateFont()
