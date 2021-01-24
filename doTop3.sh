for i in `seq 1 1000`; do
python2 spa.py | grep -e "#1" -e "#2" -e "#3" | wc -l | sed 's/ //g'
done
