Scrub JPEG
==========

Why do I need this?
-------------------

Whenever you upload photos to the web, need to really compress JPEGs, or want
to hide embarrassing details about how exactly this photo came to be, you need
to cover all your tracks.

More likely, you may be a photographer who wants to keep his shiny new lens 
parameters his very own little trade secret.


What do I do?
--------------

Exiv2 bindings are required. On MacOSX I suggest homebrew:

`brew install exiv2`

Then just grab the gem:

`gem install scrub_jpeg`


What exactly do I get?
----------------------

### View photo metadata

`$ view_jpeg_info bachelor_party.jpg`

Shows all the incriminating EXIF, IPTC, and XMP tags your friends may have
slyly add to your photo.

### Destroy photo metadata

    $ scrub_jpeg bachelor_party.jpg
    $ scrub_jpeg foo/bar/*.jpg
    $ scrub_jpeg .
    $ scrub_jpeg "my/photos/" "more/photos/*.jp"

Removes all EXIF, IPTC, and XMP tags, leaving only your actual facial expression
to incriminate you. But hey, that's why we have Photoshop™.

The arguments are one or more files, directories, or shell splats. Directories
are not searched recursively and only pick up files with `jpg` or `jpeg` extensions.

**WARNING:** This will overwrite the existing image. Make sure you have backups
and be aware you are deleting all metadata tags.  No undo, no passing go, no collecting $200.


Why not X, Y, or Z?
-------------------

I did not want to write code, I just wanted something that worked predictably.

The existing choices were either convoluted GUI editors that did lots of image
manipulation related tasks, or poorly written shell scripts.

The closest thing I could find was `jhead -purejpeg`, which looked like my meal
ticket, until I ran it on some images and found it modified the actual images!

`scrub_jpeg` uses exiv2 to delete all metadata tags, but will never modify the
actual image. Hopefully it just does one thing well.


Disclaimer
----------

This is alpha software. 

It is provided "AS IS" and without any express or implied warranties, including,
without limitation, the implied warranties of merchantability and fitness for
a particular purpose.

Use at your own risk. And make plenty of backups.
