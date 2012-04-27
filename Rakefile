local_site_dir = "public"
scripts_dir = "#{local_site_dir}/assets/scripts"
css_dir = "#{local_site_dir}/assets/css"

user = "explo"
remote_url = "www.explo.org"
remote_site_dir = "public_html/facesofexplo"



#usually I'm developing, and I just want all of my assets to compile as I work...
task :default => "watch:all"

namespace :compile do
  scss_compile = "scss --update #{css_dir}"
  coffee_compile = "coffee -c #{scripts_dir}"

  desc 'Compile SCSS files'
  task :scss do
    sh scss_compile
  end

  desc 'Compile CoffeeScript files'
  task :coffee do
    sh coffee_compile
  end

  desc 'Compile all assets'
  task :all do
    sh scss_compile
    sh coffee_compile
  end
end

namespace :watch do
  scss_watch = "scss --watch #{css_dir}"
  coffee_watch = "coffee -w -c #{scripts_dir}" 

  desc "Watch SCSS files for changes"
  task :scss do
    system scss_watch
  end

  desc "Watch CoffeeScript files for changes"
  task :coffee do
    system coffee_watch
  end

  #copied/hacked this code from https://github.com/imathis/octopress/blob/master/Rakefile
  desc "Watch all assets for changes"
  task :all do
    puts "monitoring assets for changes and auto-compiling..."
    scssPid = Process.spawn(scss_watch)
    coffeePid = Process.spawn(coffee_watch)

    trap("INT") {
      [scssPid, coffeePid].each { |pid| Process.kill(9, pid) rescue Errno::ESRCH }
      exit 0
    }

    [scssPid, coffeePid].each { |pid| Process.wait(pid) }
  end
end
 
desc 'Deploy to Explo site - WARNING WILL DELETE REMOTE FILES NOT ON LOCAL MACHINE'
task :deploy do
  sh "rsync -rtzh --progress --delete #{local_site_dir}/ #{user}@#{remote_url}:#{remote_site_dir}/"
end
