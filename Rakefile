local_site_dir = "public"
remote_site_dir = "public_html/facesofexplo"
scripts_dir = "#{local_site_dir}/assets/scripts"
css_dir = "#{local_site_dir}/assets/css"

user = "explo"
remote_url = "www.explo.org"



task :default => "watch:all"

desc 'Compile CSS and CoffeeScripts'
task :compile do
  sh 'scss --update public/assets/css/'
  sh 'coffee -c public/assets/scripts/*.coffee'
end

namespace :watch do
  desc "Watch SCSS files for changes"
  task :watch_scss do
    sh "scss --watch #{css_dir}"
  end

  desc "Watch CoffeeScript files for changes"
  task :watch_coffee do
    sh "coffee -w -c #{scripts_dir}"
  end

  desc "Watch all assets for changes"
  multitask :all => [:watch_scss, :watch_coffee] do
    puts "monitoring assets for changes and auto-compiling..."
  end
end
 
desc 'Deploy to Explo site - WARNING WILL DELETE REMOTE FILES NOT ON LOCAL MACHINE'
task :deploy do
  sh "rsync -rtzh --progress --delete #{local_site_dir}/ #{user}@#{remote_url}:#{remote_site_dir}/"
end
