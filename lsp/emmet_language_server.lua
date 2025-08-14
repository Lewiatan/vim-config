return {
  cmd = { 'emmet-language-server', '--stdio' },
  filetypes = {
    'astro',
    'css',
    'eruby',
    'html',
    'htmlangular',
    'htmldjango',
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'less',
    'pug',
    'sass',
    'scss',
    'svelte',
    'templ',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
    'vue',
  },
  root_markers = { 'package.json', '.git' },
  init_options = {
    --- @type table<string, any> https://docs.emmet.io/customization/preferences/
    preferences = {
      ["output.selfClosingStyle"] = "xhtml", -- For React JSX
      ["jsx.enabled"] = true,
    },
    --- @type table<string, string> https://docs.emmet.io/customization/snippets/#variables
    variables = {
      -- Useful for React class names
      ["lang"] = "en",
      ["locale"] = "en-US",
      ["charset"] = "UTF-8"
    },
    --- @type table<string, any> https://docs.emmet.io/customization/snippets/#custom-snippets
    snippets = {
      -- React component snippets
      ["javascriptreact"] = {
        ["rfc"] = "import React from 'react'\n\nconst ${1:${TM_FILENAME_BASE}} = () => {\n\treturn (\n\t\t<div>\n\t\t\t$0\n\t\t</div>\n\t)\n}\n\nexport default ${1:${TM_FILENAME_BASE}}",
        ["rfce"] = "import React from 'react'\n\nfunction ${1:${TM_FILENAME_BASE}}() {\n\treturn (\n\t\t<div>\n\t\t\t$0\n\t\t</div>\n\t)\n}\n\nexport default ${1:${TM_FILENAME_BASE}}",
        ["rcc"] = "import React, { Component } from 'react'\n\nclass ${1:${TM_FILENAME_BASE}} extends Component {\n\trender() {\n\t\treturn (\n\t\t\t<div>\n\t\t\t\t$0\n\t\t\t</div>\n\t\t)\n\t}\n}\n\nexport default ${1:${TM_FILENAME_BASE}}",
      },
      ["typescriptreact"] = {
        ["rfc"] = "import React from 'react'\n\ninterface ${1:${TM_FILENAME_BASE}}Props {\n\t$2\n}\n\nconst ${1:${TM_FILENAME_BASE}}: React.FC<${1:${TM_FILENAME_BASE}}Props> = () => {\n\treturn (\n\t\t<div>\n\t\t\t$0\n\t\t</div>\n\t)\n}\n\nexport default ${1:${TM_FILENAME_BASE}}",
        ["rfce"] = "import React from 'react'\n\ninterface ${1:${TM_FILENAME_BASE}}Props {\n\t$2\n}\n\nfunction ${1:${TM_FILENAME_BASE}}(props: ${1:${TM_FILENAME_BASE}}Props) {\n\treturn (\n\t\t<div>\n\t\t\t$0\n\t\t</div>\n\t)\n}\n\nexport default ${1:${TM_FILENAME_BASE}}",
      }
    }
  }
}
