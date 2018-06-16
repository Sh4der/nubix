# nubix-intelligent-packman.py
# create a new nubix tar ball, this is a base version for the ai controlled packet manager
#
# this Script is part of nubix-toolchain Version 1
# author: Jan-Frederic Kurzweil
# version: 0.1.1
# license: GNU/GPL V2

#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import sys
import tarfile

from array import array

package_name=""
package_subdirs=array
package_install=""
package_tdir=""

def create_nubix_package():
    package_name=sys.argv[1]
    print("setting package name to %s" % package_name)
    package_tdir="/etc/" + sys.argv[1]
    print("setting package install directory %s" % package_tdir)
    package_bldir="/usr/bin/"
    print("setting binary link directory %s" % package_bldir)
    package_subdirs=sys.argv[2:]  
    print("setting included directory and files %d" % len(package_subdirs))
    
    package_install="#!/bin/bash\n"
    package_install+="echo \"starting installer script for " + package_name + "\"\n"
    package_install+="mkdir -p /etc/" + package_name + "\n"
    package_install+="echo \"installing base directorys and files\"\n"
    for sub in package_subdirs:
        package_install+="cp -r " + sub + " " + package_tdir +"/\n"
        
    package_install+="echo \"installing binarys into /usr/bin/\"\n"
    for sub in package_subdirs:
        if os.path.isfile(sub) == True:
            package_install+="ln -s " + package_tdir + "/" + sub + " " + package_bldir + "\n"  
        
    install = open("install.sh", "w")
    install.write(package_install)
    install.close()
    
    tar = tarfile.open(package_name + ".tar.gz", "w:gz")
    for sub in package_subdirs:
        tar.add(sub)
    tar.add("install.sh")
    tar.close()

    os.remove("install.sh")
if __name__ == "__main__":
    if len(sys.argv) > 1:
        create_nubix_package()
    else:
        print("usage: <package-name> <subdir/file> <subdir/file> ... ")
