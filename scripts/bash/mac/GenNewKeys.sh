#!/bin/bash
#
#
#
#
usermail=creative@cpossibilities.com
gituser=michaelcolletti
imaginarygituser=sampleuserpleasechange
keygen -t rsa -b 4096 -C "creative@cpossibilities.com"
printf "Checking Agent \n"
eval "$(ssh-agent -s)"
#mac specific add to  ~/.ssh/config
#EOF <<
#Host *
#  AddKeysToAgent yes
#  UseKeychain yes
#  IdentityFile ~/.ssh/id_rsa
#EOF >>
ssh-add -K ~/.ssh/id_rsa
ssh-keygen -t rsa -b 4096 -C "creative@cpossibilities.com"
pbcopy < ~/.ssh/id_rsa.pub
printf "Now that the key is in your clipboard, goto https://github.com/$imaginarygituser login and goto Settings --> SSH and GPG Keys "
printf "and paste the clipboard's contets there \n"
