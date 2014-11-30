# Class: helloworld
#
# This module manages helloworld
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#

class helloworld {
notify {"Hello World.":} 	

#Write a file out to c:/tmp

file { "C://tmp//helloworld.txt":
     	content => "Hi from puppet!",
    }

}
