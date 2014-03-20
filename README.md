This set of shim files enables the git [Tower.app](http://www.git-tower.com/) application to use [Beyond Compare 4](http://www.scootersoftware.com/beta.php?zz=beta4_dl) (currently in beta) as a diff and merge tool.

Beyond Compare 4 has full 3-way merging in a 4 pane layout.

Clone this repository and run the install script to install the plist file and shim shell script in the appropriate directory.

    cd /tmp
    git clone git@github.com:tednaleid/git-tower-beyond-compare-shim.git
    cd git-tower-beyond-compare-shim
    ./install.sh

The shim script assumes that you've downloaded the [Beyond Compare 4](http://www.scootersoftware.com/beta.php?zz=beta4_dl) and have it in your applications directory, and that you've installed the command line tools (in the menus under Beyond Compare->Install Command Line Tools…).  
