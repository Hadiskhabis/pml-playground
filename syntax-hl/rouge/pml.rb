# -*- coding: utf-8 -*- #
# frozen_string_literal: true

=begin
================================================================================
PML Syntax Definition for Rouge          | 2021/07/09 | PML 1.5.0 | Rouge 3.26.0
--------------------------------------------------------------------------------
Copyright (c) by Tristano Ajmone, 2021, released under the MIT License.

  https://www.pml-lang.dev
  http://rouge.jneen.net
================================================================================
=end

module Rouge
  module Lexers
    class PML < RegexLexer
      title "PML"
      desc "PML (Practical Markup Language) www.pml-lang.dev"
      tag 'pml'
      filenames '*.pml'
      mimetypes 'text/x-pml', 'application/x-pml'

      state :whitespace do
        rule %r/\s+/, Text::Whitespace
      end

      state :comment do
        rule %r/(?<!\\)\[-/, Comment::Multiline, :block_comment
      end

      state :root do
        mixin :whitespace
        mixin :comment

        ## Normal Text
        ##############
        rule %r/./, Text # Anything else is just normal text...
      end # :root

      state :block_comment do
        mixin :comment # Because comments are nestable!
        rule %r/\n+/, Text # Consume EOLs!
        rule %r/-\]/, Comment::Multiline, :pop!
        rule %r/./, Comment::Multiline
      end

    end # class
  end
end
