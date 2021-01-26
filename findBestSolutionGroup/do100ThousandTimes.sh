>results3.txt
>results4.txt
>results5.txt
for i in `seq 1 100000`; do
touch runs/"$i".txt
python2 spa.py > runs/"$i".txt
cat runs/"$i".txt | grep -e "#1" -e "#2" -e "#3" | wc -l | sed 's/ //g' >> results3.txt
cat runs/"$i".txt | grep -e "#1" -e "#2" -e "#3" -e "4" | wc -l | sed 's/ //g' >> results4.txt
cat runs/"$i".txt | grep -e "#1" -e "#2" -e "#3" -e "4" -e "5"| wc -l | sed 's/ //g' >> results5.txt
done
cat -n results3.txt | awk '{print $2,$1 ".txt"}' | sort -n | tail -n 10 > topTen.txt
if ["$(cat topTen.txt | sed '10q;d' | awk '{print $1}')" = "$(cat topTen.txt | sed '9q;d' | awk '{print $1}')"]
 then
  cat -n results4.txt | awk '{print $2,$1 ".txt"}' | sort -n | tail -n 10 > topTen.txt
  if ["$(cat topTen.txt | sed '10q;d' | awk '{print $1}')" = "$(cat topTen.txt | sed '9q;d' | awk '{print $1}')"]
   then
    cat -n results5.txt | awk '{print $2,$1 ".txt"}' | sort -n | tail -n 10 > topTen.txt
    if ["$(cat topTen.txt | sed '10q;d' | awk '{print $1}')" = "$(cat topTen.txt | sed '9q;d' | awk '{print $1}')"]
     then
      echo "Couldn't find a winner, the top results are found in files " "$(cat topTen.txt | tail -n 5 | awk '{print $2 " with " $1 " top 5 picks"}')"
     else
     echo "Best possible solution found!"
     cat runs/"$(cat topTen.txt | sed '10q;d' | awk '{print $2}')"
    fi
   else
   echo "Best possible solution found!"
   cat runs/"$(cat topTen.txt | sed '10q;d' | awk '{print $2}')"
  fi
 else
 echo "Best possible solution found!"
 cat runs/"$(cat topTen.txt | sed '10q;d' | awk '{print $2}')"
fi
