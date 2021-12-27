class CustomRougeAdapter < (Asciidoctor::SyntaxHighlighter.for 'rouge')
  register_for 'rouge'

  # Defer loading Rouge until the `load_library` method is called:
  def load_library
    require 'rouge'
    # The "pml.rb" lexer & custom themes must be in same folder as this script!
    herepath=File.expand_path(File.dirname(__FILE__))
    require "#{herepath}/pml.rb"
    require "#{herepath}/pml-test-theme.rb" # DELME IN PRODUCTION!
    :loaded
  end

  def format node, lang, opts
    opts[:transform] = proc do |pre, code|
      code['class'] = %(language-#{lang}) if lang
      # Add to the generated <pre> tag  the`lang=` attribute,
      # in order to control CSS styling of code blocks:
      #   <pre class="rouge highlight" lang="pml">
      pre['lang'] = %(#{lang}) if lang
    end
    super
  end

end
