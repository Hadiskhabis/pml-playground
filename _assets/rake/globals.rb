=begin "globals.rb"            | 2021/09/30 | by Tristano Ajmone | MIT License
================================================================================
Some custom Rake helpers required by our custom Ruby modules.
Adapted from  the "globals.rb" v0.2.0 module from the ALAN i18n project:

  https://github.com/alan-if/alan-i18n/blob/main/_assets/rake/globals.rb
================================================================================
=end

$repo_root = pwd

# Define OS-specific name of Null device, for redirection
case RUBY_PLATFORM
when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
  $devnull = "NUL"
else
  $devnull = "/dev/null"
end

def TaskHeader(text)
  hstr = "## #{text}"
  puts "\n#{hstr}"
  puts '#' * hstr.length
end
