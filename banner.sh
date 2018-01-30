#!/bin/bash

read -d "~" -p "Silahkan Paste Banner anda disini (\"~\" jika sudah selesai):
" line

cat > /etc/issue.net <<-END
$line

################################################################################
##                                                                            ##
##                   ALL SUPPORTED BY PHREAKERS JATENG OFFICIAL               ##
##                         SCRIPT CREATED BY FINEST MEDIA                     ##
##                                                                            ##                                                              ##
################################################################################
##################  CLOSE BANNER INI AGAR ANDA BISA BROWSING  ##################
END

service dropbear restart
service ssh restart
