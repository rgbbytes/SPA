# SPA
Student Project Allocation.
* NB. This implementation untested.

http://www.dcs.gla.ac.uk/publications/PAPERS/7952/spa-acid.pdf
^ this link doesn't work and I couldn't find the paper^

Sina here, our EE4951W class had 100 students pick their top 10 projects out of 18 for groups of 6, and it doesn't take a binomial expansion to realize that's a lot of options!
This algorithm will assign top choices 90% of the time if the choices are truly random. However, assuming one project is very popular, 90% will get at least their 2nd choice.
I provide the example data where random numbers were generated for preferences.

Just run python2 spa.py and it will use preferences.csv to assign groups.
Run it multiple times to get new results. IT IS SOOOOO FAST. The 100 student dataset took 1 second.
You will end up with unassigned and poorly assigned students and in this case, you can manually assign these students.
Since it runs a randomizer, you can run it a hundred times and get different results.
In fact, I said "just YOLO it" and did it 1,000 times and got a normal distribution for the #1 choice assignments for a pool of 120 people (I ended up adding professors in the Canvas class as students too and didn't take them out).
As you can see, most of the class can be satisfied and if you keep running it, you can ensure everyone gets their top pick!

![alt text](https://github.com/rgbbytes/SPA/blob/master/statistics/histogram.png?raw=true)

I then said "YOLO YOLO YOLO" and ran the same simulation on the top 3 picks and look what happens to satisfaction!

![alt text](https://github.com/rgbbytes/SPA/blob/master/statistics/histogram3.png?raw=true)


To do it yyourself, go to Canvas, select all names from the class and place in a text file called names.txt and clean it using something like

    cat namesMessy.txt | grep -v "\t" | grep -v 2021 | grep -v Student | grep -v Teacher > names.txt

After it's clean, use

    cat names.txt | awk '{print system("shuf -i 1-18 -n 10 | tr \"r\n\" \" \"")}' | awk '{print "\""$1"\",\""$2"\",\""$3"\",\""$4"\",\""$5"\",\""$6"\",\""$7"\",\""$8"\",\""$9"\",\""$10"\""}' > randomPreferences.csv

Now merge them,

    paste -d "" names.csv randomPreferences.csv | sed 's/, /,/g' >> class.csv

In order to respect the privacy of the class, I used a little randmonization for the names and protected my own key security by not revealing the continuous output of my SSL RNG.

    cat randomPreferences.csv | awk '{print system("openssl rand -base64 52| tr -d \"\r\n\"| head -c 3") "\"," $0}'| awk '{print "\""$0}' > anonymizedPreferences.csv

Then, combine the original CSV file with project info with the fake students.

    cat preferencesBase.csv anonymizedPreferences.csv > preferences.csv

If you want to test the validity of this algorithm with popular projects, change everyone's favorite to 1 and you'll get the result I did, most people still get their 2nd or 3rd choice.
