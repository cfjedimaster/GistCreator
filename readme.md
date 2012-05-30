
# Read Me


GistCreator is a ColdFusion Builder extension for creating Gists. It requires you to have an existing
Github username and password. It works with ColdFusion Builder 2 and ColdFusion 10, but the ColdFusion 10
requirement is only within the "settings" keyword in Application.cfc. That could be removed in seconds.

## Installation Notes

ColdFusion Builder has two ways to install extensions. One is to take the files for the extension and use the Import 
button in the extension view. If you clone the repository, you will want to use that option as well as ensuring you 
extract the files under your web root.

Github also allows you to download a zip of the file contents. This is where things may cause you trouble. ColdFusion
Builder also has an Install option that works with zips. But if your zip is not in the right format, then the install
will not work. If you grab the zip from Github, do **not** use this option. Instead, extract the files first and use
the Import option.

## Updates

5/30/2012: Scott Stroz found that gistservice.cfc was using CF10 syntax for implicit structs. I figured I might as well remove
the other CF10 thing too. So this will now fully work in CF9+

5/29/2012: Based on a suggest by Andy Matthews, the extension now returns the embed url in a nice little box you can quickly cut and paste.
