#!/bin/bash

cd complete

echo "Launching Spring+AngularJS app in background..."
/usr/local/bin/spring run app.groovy &

sleep 30

echo "Checking if it started in the allotted time..."
curl -s http://localhost:8080 > actual.html

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
