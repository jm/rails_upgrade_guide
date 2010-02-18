namespace :stats do
  task :report => [:header, :wc, :pages, :footer]
  
  task :header do
    puts
    puts "** Stats report **"
  end
  
  task :wc do
    count = `wc -w text/**/*.mdown`.split("\n").last.match(/\s*(.*) total/)[1]
    puts "Total word count is \t#{count}"
  end
  
  task :pages do
    count = `strings output/pdf/ysat_html.pdf | grep /Count`.match(/\/Count (.*)/)[1].to_i
    puts "Current page count is \t#{count}"
  end
  
  task :momentum do
    
  end
  
  task :footer do
    puts
  end
end