# -*- coding: utf-8 -*- #
# frozen_string_literal: true

=begin
================================================================================
PML Syntax Definition for Rouge          | 2021/07/10 | PML 1.5.0 | Rouge 3.26.0
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


      ## Reusable Variables
      #####################
      custom_id = '[a-zA-Z][a-zA-Z0-9_]*' # Will change in the future!
      # pml_token = "[a-z][a-z_]*"          # PML tags & attributes.
      pml_token = '[a-z][a-z_]*'          # PML tags & attributes.

      def self.all_tags
        @all_tags ||= Set.new %w(
          admon audio b c caption ch code const div doc el html i image input
          insert insert_code link list monospace nl note output p quote sp span
          strike sub sup table table_data tc text tfooter theader tr verbatim
          video xref youtube_video
        )
      end


      state :whitespace do
        rule %r/\s+/, Text::Whitespace
      end

      state :comment do
        rule %r/(?<!\\)\[-/, Comment::Multiline, :block_comment
      end

      ## Escape Sequences
      ###################
      state :escape do
        rule %r/\\[\[\]=\\]/, Str::Escape
      end

      ## Constant Parameter
      #####################
      state :parameter do
        rule %r/<<(?=#{custom_id}>>)/, Punctuation, :param_inside
        rule %r/<<(?=.*?>>)/, Punctuation, :param_invalid
      end

      state :root do
        mixin :whitespace
        mixin :escape
        mixin :comment
        mixin :parameter

        rule %r/(?<!\\)(?=\[#{pml_token})/, Punctuation, :maybe_node

        ## Normal Text
        ##############
        rule %r/./, Text # Anything else is just normal text...
      end # :root


      state :maybe_node do
        rule %r/\[#{pml_token}/ do |m|
          tag = m[0].delete('[')
          if self.class.all_tags.include? tag
            token Name::Tag
            pop!
            push :node_inside
          else
            token Error
            pop!
            push :node_invalid_inside
          end
        end
      end

      state :node_inside do
        rule %r/(?<!\\)[\]]/, Name::Tag, :pop!
        mixin :root
      end

      state :node_invalid_inside do
        rule %r/(?<!\\)[\]]/, Error, :pop!
        mixin :root
      end

      state :block_comment do
        mixin :comment # Because comments are nestable!
        rule %r/\n+/, Text # Consume EOLs!
        rule %r/-\]/, Comment::Multiline, :pop!
        rule %r/./, Comment::Multiline
      end

      state :param_inside do
        rule %r/>>/, Punctuation, :pop!
        rule %r/#{custom_id}/, Name::Constant
      end

      state :param_invalid do
        rule %r/>>/, Punctuation, :pop!
        rule %r/[^>]/, Error
      end
    end # class
  end
end
