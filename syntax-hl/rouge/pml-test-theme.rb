# -*- coding: utf-8 -*- #
# frozen_string_literal: true

=begin
================================================================================
Custom Rouge theme for testing the PML lexer (WIP).
Elements are added to the theme as they are implemented in the PML syntax.
================================================================================
=end

module Rouge
  module Themes
    class PMLTestTheme < CSSTheme
      name 'pml-test-theme'

      palette :black    => '#000000'
      palette :blue     => '#0b8dff'
      palette :brown    => '#c19a6b'
      palette :cyan     => '#5adaff'
      palette :green    => '#2ecb55'
      palette :grey     => '#aaaaaa'
      palette :magenta  => '#ff00ff'
      palette :orange   => '#ffae2b'
      palette :pink     => '#ffbcd9'
      palette :purple   => '#b180ed'
      palette :red      => '#ff0000'
      palette :white    => '#ffffff'
      palette :yellow   => '#ffff00'


      style Text,                     :fg => :white, :bg => :black
      style Comment,
            Comment::Multiline,       :fg => :brown, :italic => true
      style Error,                    :fg => :white, :bg => :red

    end
  end
end
