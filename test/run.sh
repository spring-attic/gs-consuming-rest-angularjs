#!/bin/sh

cd $(dirname $0)

BO0T_VERSION=1.4.0.RELEASE

if ! [ -d "$HOME/.sdkman/bin" ]; then
    curl -s get.sdkman.io | bash
    sleep 10
fi
[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ] && source "$HOME/.sdkman/bin/sdkman-init.sh"
if ! [ -d "$HOME/.sdkman/springboot/$BOOT_VERSION" ]; then
    echo "Y" | sdk install springboot $BOOT_VERSION
    sdk use springboot $BOOT_VERSION
fi

cd ../complete
spring run app.groovy &
sleep 20
curl -s http://localhost:8080 > actual.html
kill `jps | grep JarLauncher | cut -d " " -f 1`

echo "Let's look at the actual results: `cat actual.html`"
echo "And compare it to: `cat ../test/expected.html`"

if diff -w ../test/expected.html actual.html
    then
        echo SUCCESS
        ret=0
    else
        echo FAIL
        ret=255
        exit $ret
fi
rm -rf actual.html

exit
