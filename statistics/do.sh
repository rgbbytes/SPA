for i in `seq 1 1000`; do
python2 spa.py | grep -v "#1" | wc -l | sed 's/ //g'
done
