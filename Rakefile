task :default => :deploy
 
desc 'Deploy to Explo site'
task :deploy do
  sh 'rsync -rtzh --progress --delete public/ explo@www.explo.org:public_html/facesofexplo/'
end
