module.exports = {
  // 一行最多字符数(默认值80)
  printWidth: 80,
  // 使用 2 个空格缩进(默认值2)
  tabWidth: 2,
  // 不使用制表符，而使用空格来缩进行(默认值false)
  useTabs: false,
  // 行尾不需要有分号(默认值true，即行尾需要有分号)
  semi: false,
  // 使用单引号(默认值false,即使用双引号)
  singleQuote: true,
  // 对象的 key 仅在必要时用引号(默认值as-needed)
  quoteProps: 'as-needed',
  // jsx 不使用单引号，而使用双引号(默认值false)
  jsxSingleQuote: false,
  // 末尾逗号(默认值all)
  trailingComma: 'all',
  // 大括号内的首尾需要空格(默认值true)
  bracketSpacing: true,
  // jsx 标签的反尖括号不需要换行(默认值false，即需要换行)
  jsxBracketSameLine: false, // 此选项在 v2.4.0 中已弃用
  bracketSameLine: false, // 替代jsxBracketSameLine
  // 箭头函数，只有一个参数的时候，也需要括号(默认值always)
  arrowParens: 'always',
  // 每个文件格式化的范围是文件的全部内容(默认值0,Infinity)
  rangeStart: 0,
  rangeEnd: Infinity,
  // 不需要写文件开头的 @prettier(默认值false)
  requirePragma: false,
  // 不需要自动在文件开头插入 @prettier(默认值false)
  insertPragma: false,
  // 默认情况下，Prettier 不会更改 Markdown 文本中的换行(默认值preserve)
  proseWrap: 'preserve',
  // 遵循每个元素默认CSS的display值来识别其中的空格是否重要，以避免添加或删除重要空格的方式包装标签(默认值css)
  htmlWhitespaceSensitivity: 'css',
  // 是否缩进 Vue 文件中 <script> 和 <style> 标记内的代码(默认值false)
  vueIndentScriptAndStyle: false,
  // 换行符(默认值lf)
  /*
  "lf"– 仅换行 ( \n)，在 Linux 和 macOS 以及 git 存储库中常见
  "crlf"- 回车+换行字符 ( \r\n)，在 Windows 上常见
  "cr"- 仅回车符 ( \r)，很少使用
  "auto"- 维护现有的行结尾（通过查看第一行之后使用的内容来标准化一个文件中的混合值）
  */
  endOfLine: 'lf',
  // 如果 Prettier 可以自动识别嵌入代码，则对其进行格式化(默认值auto)
  embeddedLanguageFormatting: 'auto',
  // 会在 HTML、JSX、Vue 和 Angular 中格式化为每个属性单独占一行(默认值false)
  singleAttributePerLine: true
}
