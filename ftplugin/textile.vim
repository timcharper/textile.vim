" textile.vim
" Syntax by 
" - Aaron Bieber (blog.aaronbieber.com) 
" - Dominic Mitchell (happygiraffe.net)
"
" Plugin by Tim Harper (tim.theenchanter.com)
" 
" Syntax works on all OS's, but the textile preview command only works on OS
" X right now.
" 
" Requires ruby and the RedCloth gem
"
" Changelog
" 0.1
" - Initial Release

noremap <buffer> \tp :call TextilePreview()<CR>

function! TextileRender(lines)
  let text = join(a:lines, "\n")
  return split(system("ruby -e \"require 'rubygems'; require 'redcloth'; puts(RedCloth.new(\\$stdin.read).to_html(:textile))\"", text), "\n")
endfunction

function! TextileRenderToFile(lines, filename)
  return writefile(TextileRender(getbufline(bufname("%"), 1, '$')), a:filename)
endfunction

function! TextilePreview()
  let filename = "/tmp/textile-preview.html"
  call TextileRenderToFile(getbufline(bufname("%"), 1, '$'), filename)

  " Modify this line to make it compatible on other platforms
  call system("open -a Safari ". filename)
endfunction

