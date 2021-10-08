# -*- coding: utf-8 -*- #
# frozen_string_literal: true

=begin
================================================================================
PML Syntax Definition for Rouge          | 2021/10/08 | PML 2.1.0 | Rouge 3.26.1
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

      ## Text Styles Trackers
      #######################
      text_italic = 0
      text_bold = 0

      ## Reusable Variables
      #####################
      custom_id = '[a-zA-Z][a-zA-Z0-9_]*'  # Will change in the future!
      pml_token = '[a-z][a-z_]*'           # PML tags & attributes.
      pml_pptag = '![a-z][-a-z_]*'         # PML pre-processor tags.
      end_brack = '(?<!\\\\)[\\]]'         # Unescaped ']'.

      def self.all_tags
        # All PML v2.1.0 tags, except preprocessor tags ([!* .. ])
        @all_tags ||= Set.new %w(
          admon audio b c caption ch code div doc el header html i image input
          insert_code link list monospace nl note output p quote sp span strike
          sub subtitle sup table table_data tc text tfooter theader title tr
          verbatim video xref youtube_video
        )
      end

      ## Reusable Mixins
      ##################

      state :whitespace do
        rule %r/\s+/, Text::Whitespace
      end

      state :comment do
        rule %r/(?<!\\)\[-/, Comment::Multiline, :block_comment
      end

      # @FIXME: v1.5.0 rules!
      state :escape do
        rule %r/\\[\[\]=\\]/, Str::Escape
      end

      ## Root Context
      ###############
      start do # Initialize tracking vars at each highlighting
        text_italic = 0
        text_bold = 0
      end

      state :root do
        mixin :whitespace
        mixin :escape
        mixin :comment

        rule %r/(?<!\\)(?=\[#{pml_pptag})/, Punctuation, :maybe_ppnode
        rule %r/(?<!\\)(?=\[#{pml_token})/, Punctuation, :maybe_node

        # Anything else is just normal text...
        rule %r/./ do |m|
          if text_italic != 0
            token Generic::Emph
          elsif text_bold != 0
            token Generic::Strong
          else
            token Text
          end
        end
      end # :root

      ## Sub-Contexts
      ###############

      state :block_comment do
        mixin :comment # Because comments are nestable!
        rule %r/\n+/, Text # Consume EOLs!
        rule %r/-\]/, Comment::Multiline, :pop!
        rule %r/./, Comment::Multiline
      end

      ## Nodes
      ########

      state :maybe_node do
        rule %r/\[#{pml_token}/ do |m|
          tag = m[0].delete('[')
          if self.class.all_tags.include? tag
            token Name::Tag
            pop!
            case tag
            when 'i'
              text_italic += 1
              push :italic_inside
            when 'b'
              text_bold += 1
              push :bold_inside
            else
              push :node_inside
            end
          else
            token Error
            pop!
            push :node_invalid_inside
          end
        end
      end

      state :node_inside do
        rule %r/#{end_brack}/, Name::Tag, :pop!
        mixin :root
      end

      state :node_invalid_inside do
        rule %r/#{end_brack}/, Error, :pop!
        mixin :root
      end

      state :italic_inside do
        rule %r/#{end_brack}/ do |m|
          text_italic -= 1 unless text_italic == 0
          token Name::Tag
          pop!
        end
        mixin :root
      end

      state :bold_inside do
        rule %r/#{end_brack}/ do |m|
          text_bold -= 1 unless text_bold == 0
          token Name::Tag
          pop!
        end
        mixin :root
      end

      ## Preprocessor Nodes
      #####################

      state :maybe_ppnode do
        rule %r/\[#{pml_pptag}/ do |m|
          tag = m[0].delete('[')
          case tag
          when '!set'
            token Keyword::Pseudo
            pop!
            push :set_inside
          when '!get'
            pop!
            token Keyword::Pseudo
            push :get_inside
          else
            token Error
            pop!
            pop!
            # push :node_invalid_inside
          end
        end
      end
      state :param_id do
        rule %r/#{custom_id}(?=[\s=\]])/, Name::Constant
        rule %r/[^\s=\]]+/, Error
      end

      state :ppnode_end do
        rule %r/#{end_brack}/, Keyword::Pseudo, :pop!
      end

      state :set_inside do
        mixin :whitespace
        mixin :ppnode_end
        mixin :param_id
        rule %r/=/, Operator, :set_value
        # rule %r/(=)(\s*)([^\s\]]+)/ do |x|
        #   groups Operator, Text, Text
        #   # pop!
        # end
      end

      state :set_value do
        mixin :whitespace
        mixin :ppnode_end
        # @TODO: Parse value quoted & unquoted
        rule %r/[^\s\]]+/, Text, :pop!
      end

      state :get_inside do
        mixin :whitespace
        mixin :ppnode_end
        mixin :param_id
      end

    end # class
  end
end
