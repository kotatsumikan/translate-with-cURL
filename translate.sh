#!/bin/bash

{
    SOURCELANG=en
    TRANSLATELANG=ja

    # I am IE.  I am not cURL.
    UA="Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)"
    TEXT=${@}

    curl -s -A "${UA}" http://translate.google.com -d sl=${SOURCELANG} -d tl=${TRANSLATELANG} -d text="${TEXT}" |
    sed -ne "/^.*TRANSLATED_TEXT='/,/';/p" |
    sed -e "s/^.*TRANSLATED_TEXT='//g" |
    sed -e "s/';.*//g"|
    # decode
    sed -e "s/\\\\x26#39;/'/g"|
    sed -e "s/\\\\x26quot;/\"/g"
}
