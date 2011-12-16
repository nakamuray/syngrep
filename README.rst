===========================
syngrep - syntax aware grep
===========================

:usage:

  syngrep [-s syntax_pattern] /pattern/ file [file...]

example::

  $ syngrep -s function /Grep/ syngrep.vim
  syngrep.vim:8:vimFunction:function SyntaxGrep(args, ...)
  $ syngrep -s function /Grep/ '**/*.vim'
  syngrep.vim:8:vimFunction:function SyntaxGrep(args, ...)
