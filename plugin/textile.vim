noremap  \tp :call TextilePreview()<CR>

function! TextileRender(lines)
  let text = join(a:lines, "\n")
  return split(system("ruby \"require 'rubygems'; require 'redcloth'; puts(RedCloth.new($stdin.read).to_html(:textile))\"", text), "\n")
endfunction

function! TextileRenderToFile(lines, filename)
  return writefile(TextileRender(getbufline(bufname("%"), 1, '$')), a:filename)
endfunction

function! TextilePreview()
  let filename = "/tmp/textile-preview.html"
  call TextileRenderToFile(getbufline(bufname("%"), 1, '$'), filename)
  call system("open -a Safari ". filename)
endfunction

