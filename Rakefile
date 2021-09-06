=begin "Rakefile" v0.0.1 | 2021/09/30 | by Tristano Ajmone
================================================================================
This is an initial Rakefile proposal for Alan-i18n.  It's fully working and uses
namespaces to separate tasks according to locale, but it could do with some
further improvements.

* Clobbering is global, I haven't found a way to implement namespace clobbering,
  so if you 'Rake clobber' you'll have to 'Rake' in order not to loose tracked
  files. Namespaced clobbering would improve working on specific locales.
* Beware that CDing to a directory is a persistent action affecting all future
  'sh' commands -- always remember to 'cd $repo_root' before issuing shell
  commands from Rake, or manipulating task paths (working dir is affected!).
================================================================================
=end


# Custom helpers shared among ALAN repos ...

require './_assets/rake/globals.rb'
require './_assets/rake/asciidoc.rb'


## Tasks
########

task :default => :rouge


## Clean & Clobber
##################
require 'rake/clean'
CLOBBER.include('**/*.html').exclude('**/docinfo.html')


## Syntax HL » Rouge
####################
desc "Rouge Syntax Highlighting"
task :rouge
ROUGE_ADOC_DEPS = FileList[
  'syntax-hl/rouge/*.rb',
  'syntax-hl/rouge/docinfo.html',
  '_assets/rake/*.rb'
]
CreateAsciiDocHTMLTasksFromFolder(:rouge,'syntax-hl/rouge', ROUGE_ADOC_DEPS)
