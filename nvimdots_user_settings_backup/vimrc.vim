let g:clipboard = {
  \   'name': 'WslClipboard',
  \   'copy': {
  \      '+': 'clip.exe',
  \      '*': 'clip.exe',
  \    },
  \   'paste': {
  \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  \   },
  \   'cache_enabled': 0,
  \ }
let g:VM_maps = {}
let g:VM_maps["Exit"]               = '<C-C>'   " quit VM
let g:VM_maps['Find Under']         = '<C-d>'   " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'   " replace visual C-n
let g:VM_maps["Add Cursor Down"]    = '<M-Down>'   " new cursor down
let g:VM_maps["Add Cursor Up"]      = '<M-Up>'   " new cursor up
let g:VM_maps["Toggle Mappings"]    = '<CR>'    " toggle VM buffer mappings

