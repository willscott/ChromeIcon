Chrome Icon
===========

I typically keep multiple chrome processes open - one for testing, one logged in to my personal google account with my personal bookmarks, and one logged in to my corporate account.  The problem this rises is how to minimize the hassle of both launching, and distinguishing between the different instances.

Chrome icon solves the identification problem, by changing the application icon of chrome based on a user default key set at launch time.

The plugin is also not chrome-specific, so it should end up letting you set a custom icon on just about any app, which is useful with
applications which like to add badges to their dock icons.

Installation
------------

1. Install SIMBL ()

2. Clone the repository

3. Copy the plugin to ~/Library/Application Support/SIMBL/Plugins/

4. Copy the 'chrome' shell script to somewhere in your path.

Running
-------

Run a profile by typing 'chrome _profile_' from the command line (eg. chrome work).

To add a custom icon to an instance, save it as icon.png in the profile directory
(eg. /Users/will/Library/Application Support/Google/Chrome/work/icon.png), and it
will be used the next time that profile is started.