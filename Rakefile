#Author: Donald L. Merand

local_site_dir = "public"
assets_dir = "#{local_site_dir}/assets"
scripts_dir = "#{assets_dir}/scripts"
css_dir = "#{assets_dir}/css"
images_dir = "#{assets_dir}/images"

user = "explo"
remote_url = "www.explo.org"
remote_site_dir = "public_html/facesofexplo"


#usually I'm developing, and I just want all of my assets to compile as I work...
task :default => "watch:all"


namespace :compile do
  #you'll be needing scss and/or coffeescript in your path for this to work
  scss_compile = "scss --update #{ENV['SCSS_OPTIONS']} #{css_dir}"
  coffee_compile = "coffee -c #{ENV['COFFEE_OPTIONS']} #{scripts_dir}"

  desc "Compile SCSS files in #{css_dir}"
  task :scss do
    directory css_dir
    sh scss_compile
  end

  desc "Compile CoffeeScript files in #{scripts_dir}"
  task :coffee do
    directory scripts_dir
    sh coffee_compile
  end

  desc 'Compile all assets'
  task :all => [:scss, :coffee] do
    puts "All assets compiled!"
  end
end


namespace :images do
  #this requires the "mogrify" command, which is part of ImageMagick
  desc "prepare images for web"
  task :prepare do
    abort("rake aborted") if ask("This will destructively compress images in #{images_dir}. Proceed?", ["y", "n"]) == "n"
    directory images_dir
    #there's probably a more idiomatic way to do this in ruby. It won't work in windows :/
    sh "find -E #{images_dir} -regex '.*\\.(jpg|png|gif)' -exec mogrify -strip -interlace line -quality 50 {} \\;"
  end
end


namespace :watch do
  #you'll be needing scss and/or coffeescript in your path for this to work
  scss_watch = "scss --watch #{ENV['SCSS_OPTIONS']} #{css_dir}"
  coffee_watch = "coffee -w -c #{ENV['COFFEE_OPTIONS']} #{scripts_dir}" 

  desc "Watch #{css_dir} for changes"
  task :scss do
    directory css_dir
    system scss_watch
  end

  desc "Watch #{scripts_dir} for changes"
  task :coffee do
    directory scripts_dir
    system coffee_watch
  end

  #copied/hacked this code from https://github.com/imathis/octopress/blob/master/Rakefile
  desc "Watch all assets for changes"
  task :all do
    puts "monitoring assets for changes and auto-compiling..."
    directory css_dir
    directory scripts_dir
    scssPid = Process.spawn(scss_watch)
    coffeePid = Process.spawn(coffee_watch)

    trap("INT") {
      [scssPid, coffeePid].each { |pid| Process.kill(9, pid) rescue Errno::ESRCH }
      exit 0
    }

    [scssPid, coffeePid].each { |pid| Process.wait(pid) }
  end
end
 

desc "Compile assets and deploy to #{remote_url}" + 
  " - WARNING WILL DELETE REMOTE FILES NOT ON LOCAL MACHINE"
task :deploy => 'compile:all' do
  exclude = ""
  if File.exists?('./rsync-exclude')
    exclude = "--exclude-from '#{File.expand_path('./rsync-exclude')}'"
  end
  sh "rsync -rtzh --progress #{exclude} --delete #{local_site_dir}/ #{user}@#{remote_url}:#{remote_site_dir}/"
end


#also from https://github.com/imathis/octopress/blob/master/Rakefile
#love those UI functions!
def get_stdin(message)
  print message
  STDIN.gets.chomp
end
def ask(message, valid_options)
  if valid_options
    answer = get_stdin("#{message} #{valid_options.to_s.gsub(/"/, '').gsub(/, /,'/')} ") while !valid_options.include?(answer)
  else
    answer = get_stdin(message)
  end
  answer
end
