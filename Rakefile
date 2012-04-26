task :default => :deploy
 
desc 'Build and deploy'
task :deploy do
  sh 'rsync -rtzh --progress --delete public/ explo@www.explo.org:public_html/facesofexplo/'
end
