=begin "Rakefile" v0.1.3 | 2021/12/27 | by Tristano Ajmone
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

require 'rake/phony'

# ==============================================================================
# --------------------{  P R O J E C T   S E T T I N G S  }---------------------
# ==============================================================================

$rouge_dir = "#{$repo_root}/syntax-hl/rouge"
require "#{$rouge_dir}/custom-rouge-adapter.rb"

ADOC_OPTS_SHARED = <<~HEREDOC
  --failure-level WARN \
  --verbose \
  --timings \
  --safe-mode unsafe \
  --require #{$rouge_dir}/custom-rouge-adapter.rb \
  -a source-highlighter=rouge \
  -a rouge-style@=thankful_eyes \
  -a docinfodir=#{$rouge_dir} \
  -a docinfo@=shared-head
HEREDOC

# ==============================================================================
# -------------------------------{  T A S K S  }--------------------------------
# ==============================================================================

## Tasks
########

task :default => [:rouge, :sguide, :mustache]


## Clean & Clobber
##################
require 'rake/clean'
CLOBBER.include('**/*.html').exclude('**/docinfo.html')
CLOBBER.include('mustache/*.{txt,md,json}').exclude('**/README.md')
# CLOBBER.include('mustache/*.txt', 'mustache/*.md').exclude('**/README.md')


## Syntax HL » Rouge
####################
desc "Rouge Syntax Highlighting"
task :rouge
ROUGE_ADOC_DEPS = FileList[
  'syntax-hl/rouge/*.rb',
  'syntax-hl/rouge/docinfo.html',
  'syntax-hl/rouge/_attr-*.adoc',
  'syntax-hl/rouge/pml-sample.pml',
  '_assets/rake/*.rb'
]
CreateAsciiDocHTMLTasksFromFolder(
  :rouge,
  'syntax-hl/rouge',
  ROUGE_ADOC_DEPS,
  ADOC_OPTS_SHARED
)


## Syntax Guide
###############
desc "Build PML Syntax Guide"
task :sguide

SGUIDE_ADOC = 'syntax-guide/sguide.asciidoc'
SGUIDE_HTML = 'syntax-guide/PML-Syntax-Guide.html'

SGUIDE_ADOC_DEPS = FileList[
  SGUIDE_ADOC,
  'syntax-guide/*.adoc',
  'syntax-hl/rouge/*.rb',
  'syntax-hl/rouge/docinfo.html',
  '_assets/rake/*.rb'
]

SGUIDE_ADOC_OPTS = ADOC_OPTS_SHARED.chomp + " " + <<~HEREDOC
    --out-file=#{SGUIDE_HTML.pathmap("%f")} \
    #{SGUIDE_ADOC.pathmap("%f")}
HEREDOC

task :sguide => SGUIDE_HTML

file SGUIDE_HTML => SGUIDE_ADOC_DEPS do
  AsciidoctorConvert(SGUIDE_ADOC, SGUIDE_ADOC_OPTS)
end


## Mustache
###########
desc "Build mustache templates"
task :mustache => 'mustache/pml_tags.json'

file 'mustache/pml_tags.json' => :phony do |t|
  TaskHeader("PMLC: Exporting JSON Tags")
  cd t.name.pathmap("%d")
  sh "pmlc export_tags"
  cd $repo_root, verbose: false
end

FileList['mustache/*.mustache'].each do |s|
  t = s.sub(/^(.*)__(.*)\.mustache$/, "\\1.\\2")
  task :mustache => t
  file s => 'mustache/pml_tags.json'
  file t => s do |t|
    TaskHeader("Building Mustache Template: #{t.source}")
    cd t.name.pathmap("%d")
    template = t.source.pathmap("%f")
    output = t.name.pathmap("%f")
    sh "mustache pml_tags.json #{template} > #{output}"
    cd $repo_root, verbose: false
  end
end

MUSTACHE_ADOC_DEPS = FileList[
  'mustache/*__asciidoc.mustache'
]

MUSTACHE_ADOC_OPTS = <<~HEREDOC
  --failure-level WARN \
  --verbose \
  --timings \
  --safe-mode unsafe
HEREDOC

CreateAsciiDocHTMLTasksFromFolder(
  :mustache,
  'mustache',
  MUSTACHE_ADOC_DEPS,
  ADOC_OPTS_SHARED
)
