The Faces of Explo
==================

_Author: [Donald L. Merand](http://donaldmerand.com)_

This is the source code for [this page](http://www.explo.org/facesofexplo/). Sometimes you get an idea ("What would happen if we merged all of our 1300 ID photos into one photo?"), and you have to run with it.

I thought you might like to see the development process behind the page. I used this page as an opportunity to learn how to use a Rakefile to help automate deployment. I'm particularly proud of the part where the [CoffeeScript](http://jashkenas.github.com/coffee-script/) and the [SCSS](http://sass-lang.com/) are automatically watched and compiled as you code them. Also interesting: the tasks to deploy using [rsync](http://rsync.samba.org/) and the task to prepare images for the web using the [ImageMagick](http://www.imagemagick.org/) _mogrify_ utility.

I owe a debt to the [Google HTML/CSS Style Guide](http://google-styleguide.googlecode.com/svn/trunk/htmlcssguide.xml), from which I learned a whole slew of interesting things for this project. Did you know that you don't need to close a &lt;p&gt; tag in HTML5?
