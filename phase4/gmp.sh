# GMP Phase 4
sed -i '/long long t1;/,+1s/()/(...)/' configure
./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.3.0

make
make html

#if (( RUN_TESTS )); then
#    set +e
#    make check 
#    set -e
#fi

# book recommends running these tests no matter what

make check 2>&1 | tee gmp-check-log

PASS_COUNT=$(awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log)
if [ "$PASS_COUNT" !>= "" ];
then
    echo "ERROR: GMP tests failed. Check /sources/stage6/gmp_test.log for more info."
    exit -1
fi

make install
make install-html

