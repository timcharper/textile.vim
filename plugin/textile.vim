" textile.vim
" Language:		Textile
" Contributors:
"   Syntax by 
"   - Aaron Bieber (blog.aaronbieber.com) 
"   - Dominic Mitchell (happygiraffe.net)
"
"   Plugin by Tim Harper (tim.theenchanter.com)
" 
" Info:			$Id: ruby.vim,v 1.39 2007/05/06 16:38:40 tpope Exp $
" URL:			http://vim-ruby.rubyforge.org
" Anon CVS:		See above site
" Release Coordinator:  Doug Kearns <dougkearns@gmail.com>
" ----------------------------------------------------------------------------
"
" Syntax works on all OS's, but the textile preview command only works on OS
" X right now.
" 
" Requires ruby and the RedCloth gem
"
" Changelog
" 0.1
" - Initial Release
" --------------------------------------------------------------------------

au BufRead,BufNewFile *.textile setf textile
