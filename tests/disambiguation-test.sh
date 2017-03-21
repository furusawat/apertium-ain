CORPUS=../corpus/ain.corpus2.basic.txt
MORPH=../ain.automorf.bin
RLX=../../ain.rlx.bin
TOKENS=`cat ${CORPUS} | lt-proc ${MORPH} | sed 's/$\W*\^/$\n^/g' | wc -l`
ANALYSES=`cat ${CORPUS} | lt-proc ${MORPH} | sed 's/$\W*\^/$\n^/g' | cut -f2- -d'/' | sed 's/\//\n/g' | wc -l`
DISAMB=`cat ${CORPUS} | lt-proc ${MORPH} | cg-proc ${RLX} | sed 's/$\W*\^/$\n^/g' | cut -f2- -d'/' | sed 's/\//\n/g' | wc -l`
AMBIGPRE=`calc $ANALYSES/$TOKENS`
AMBIGPOST=`calc $DISAMB/$TOKENS`
echo "Ambiguity before disambiguation: ${AMBIGPRE}"
echo "Ambiguity after disambiguation: ${AMBIGPOST}"
