#!/bin/bash

cd /usr/local/docpath/licenseserver/licenseserver/Bin

if [[ "$MODEONLINE" == 'true' ]]; then
  args=' -modeonline'
else
  args=''
fi

exec java -jar dplicenseserver.jar -start$args

