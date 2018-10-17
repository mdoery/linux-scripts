#!sh/bin
# Script gets the word which is passed in as an argument, and looks for it in two files which are lists of words:
# dict.out.all and all.txt
# If found, uses sed to put a minus in front of the the word in these two files
# Note that all.txt has all words uppercased, so the input is uppercased before replacing the word in all.txt.
# This is my own personal script, for my own personal use, and so it doesn't do a few things carefully.
# For example there's a temporary output file called "jnk" which will get overwritten. I know that when I write to "jnk" that file is a tmp file.
echo "Removing $1 from dict.out.all and from all.txt"
sed "s/\<$1\>/-$1/" dict.out.all > jnk
mv jnk dict.out.all

# all.txt has uppercase words only, so remove the uppercase version
x=$(echo $1 | tr '[:lower:]' '[:upper:]')
sed "s/\<$x\>/-$x/" all.txt > jnk
mv jnk all.txt 
