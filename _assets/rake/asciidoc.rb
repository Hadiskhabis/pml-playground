=begin "asciidoc.rb"             | 2021/09/30 | by Tristano Ajmone | MIT License
================================================================================
Some custom Rake helper methods for automating common Asciidoctor operations.
Adapted from  the "asciidoc.rb" v0.2.0 module from the ALAN i18n project:

  https://github.com/alan-if/alan-i18n/blob/main/_assets/rake/asciidoc.rb
================================================================================
=end

$rouge_dir = "#{$repo_root}/syntax-hl/rouge"

require 'asciidoctor'
require "#{$rouge_dir}/custom-rouge-adapter.rb"

def CreateAsciiDocHTMLTasksFromFolder(target_task, target_folder, dependencies)
  adoc_sources = FileList["#{target_folder}/*.asciidoc"].each do |adoc_fpath|
    doc_src = adoc_fpath.pathmap("%f")
    html_fpath = adoc_fpath.ext('.html')
    task target_task => html_fpath
    file html_fpath => adoc_fpath
    file html_fpath => dependencies
    file html_fpath do
      TaskHeader("Converting Document: #{adoc_fpath}")

      cd "#{$repo_root}/#{target_folder}"
      Asciidoctor.convert_file \
        "#{doc_src}",
        backend: :html5,
        safe: :unsafe,
        attributes: {
          # Don't specify 'rouge-style' nor 'docinfo' here!
          # Let the ADoc sources handle them according to need.
          'source-highlighter' => 'rouge',
          'docinfodir' => $rouge_dir,
        }
      cd $repo_root, verbose: false
    end
  end
end
