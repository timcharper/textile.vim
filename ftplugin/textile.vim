" textile.vim
" Syntax by 
" - Aaron Bieber (blog.aaronbieber.com) 
" - Dominic Mitchell (happygiraffe.net)
"
" Plugin by Tim Harper (tim.theenchanter.com)
" 
" The textile preview command only works on OS X right now. (but can be
" easily modified for other OS's).
" 
" Requires ruby and the RedCloth gem
"
" Changelog
" 0.1
" - Initial Release

command! -nargs=0 TextileRenderFile call TextileRenderBufferToFile()
command! -nargs=0 TextileRenderTab call TextileRenderBufferToTab()
command! -nargs=0 TextilePreview call TextileRenderBufferToPreview()
noremap <buffer> \tp :TextilePreview<CR>
noremap <buffer> \tf :TextileRenderFile<CR>
noremap <buffer> \tr :TextileRenderTab<CR>
setlocal ignorecase
setlocal wrap
setlocal lbr

function! TextileRender(lines)
  let text = join(a:lines, "\n")
  let html = system("ruby -e \"require 'rubygems'; require 'redcloth'; puts(RedCloth.new(\\$stdin.read).to_html(:textile))\"", text)
  return split("<html><head><title>" . bufname("%") . "</title><body>\n" . html . "\n</body></html>", "\n")
endfunction

function! TextileRenderFile(lines, filename)
  return writefile(TextileRender(getbufline(bufname("%"), 1, '$')), a:filename)
endfunction

function! TextileRenderBufferToPreview()
  let filename = "/tmp/textile-preview.html"
  call TextileRenderToFile(getbufline(bufname("%"), 1, '$'), filename)

  " Modify this line to make it compatible on other platforms
  call system("open -a Safari ". filename)
endfunction

function! TextileRenderBufferToFile()
  let filename = input("Filename:", substitute(bufname("%"), "textile$", "html", ""), "file")
  call TextileRenderToFile(getbufline(bufname("%"), 1, '$'), filename)
  echo "Rendered to '" . filename . "'"
endfunction

function! TextileRenderBufferToTab()
  let html_lines = TextileRender(getbufline(bufname("%"), 1, '$'))
  tabnew
  call append("^", html_lines)
  set syntax=html
endfunction

