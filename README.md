*UPDATE: As of Tower 2.0.5, there is native support for Beyond Compare, so it should not be necessary to use this shim anymore.*

This set of shim files enables the git [Tower.app](http://www.git-tower.com/) application to use [Beyond Compare 4](http://www.scootersoftware.com/beta.php?zz=beta4_dl) (currently in beta) as a diff and merge tool.  Has support for Tower 2, if you're still using the original version of Tower, you'll want to checkout [this tag](https://github.com/tednaleid/git-tower-beyond-compare-shim/tree/tower_1).

Beyond Compare 4 has full 3-way merging in a 4 pane layout.

Clone this repository and run the install script to install the plist file and shim shell script in the appropriate directory.

    cd /tmp
    git clone git@github.com:tednaleid/git-tower-beyond-compare-shim.git
    cd git-tower-beyond-compare-shim
    ./install.sh

The shim script assumes that you've downloaded the [Beyond Compare 4](http://www.scootersoftware.com/beta.php?zz=beta4_dl) and have it in your applications directory, and that you've installed the command line tools (in the menus under Beyond Compare->Install Command Line Tools…).  

By default [Beyond Compare 4](http://www.scootersoftware.com/beta.php?zz=beta4_dl) does not follow symbolic links when performing a Folder Compare (e.g., git --dir-diff). To resolve the symbolic link issue in the Folder Compare, select "Session > Session Settings" or click on the Rules toolbar button. In the Handling tab, check "Follow symbolic links". If you want to follow symbolic links by default, change the dropdown at the bottom of the dialog from "Use for this view only" to "Also update session defaults" before clicking OK.
