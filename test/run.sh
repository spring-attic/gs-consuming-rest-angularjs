cd $(dirname $0)
cd ../complete
spring run app.groovy &
PID=$!
sleep 10
curl -s http://localhost:8080 > actual.html
kill -9 $PID

echo "Let's look at the actual results: `cat actual.html`"
echo "And compare it to: `cat ../test/expected.html`"

if diff -w ../test/expected.html actual.html
    then
        echo SUCCESS
        let ret=0
    else
        echo FAIL
        let ret=255
        exit $ret
fi
rm -rf actual.html

exit
