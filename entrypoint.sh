#!/bin/sh -l

echo ""
echo "Executing yak with the following arguments: "
echo "---------------------------------------------"
echo "$@"
echo "---------------------------------------------"
echo ""

PATH=$PATH:/usr/src/app/script

yak --noconfig --nochecksums $@

EXITCODE=$?

test $EXITCODE -eq 0 || echo "($EXITCODE) yak failed, check logs";

exit $EXITCODE
