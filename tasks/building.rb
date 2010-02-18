namespace :build do
  task :all => [:html, :latex, :pdf, :html_pdf]
  task :setup => [:clobber, :make_directories, :merge, :copy_assets]
  
  task :html => [:setup] do
    puts "--- building html"
    `maruku --html --output="output/html/ysat.html" output/markdown/merged.mdown`
    puts "*** DONE WITH HTML"
    puts
  end
  
  task :html_pdf => [:setup, :html] do
    puts "--- building html-pdf"
    `prince -i html output/html/ysat.html -o output/pdf/ysat_html.pdf`
    puts "*** DONE WITH HTML-PDF"
  end
  
  task :pdf => [:setup] do
    puts "--- building pdf"
    `maruku --pdf --output="output/pdf/ysat.pdf" output/markdown/merged.mdown`
    `cp ysat.pdf output/pdf/`
    `rm *.pdf *.log *.aux *.out *.tex`
    
    puts "*** DONE WITH PDF"
    puts
  end
  
  task :latex => [:setup] do
    puts "--- building tex"
    `maruku --tex --output="output/tex/ysat.tex" output/markdown/merged.mdown`
    puts "*** DONE WITH TEX"
    puts
  end
  
  task :clobber do
    puts "--- clobbering files"
    `rm -rf output/*`
  end
  
  task :merge do
    puts "--- merging down markdown files"
    `cat text/**/*.mdown > output/markdown/merged.mdown`
    puts
  end
  
  task :make_directories do
    `mkdir output/html output/pdf output/tex output/markdown`
  end
  
  task :copy_assets do
    `cp src/style.css output/html/style.css`
    `cp src/images/* output/html/`
    `cp src/preamble.tex preamble.tex`
  end
  
  task :publish do
    puts "hah.  right."
  end
end