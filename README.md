# SPA
Student Project Allocation.
* NB. This implementation untested.

http://www.dcs.gla.ac.uk/publications/PAPERS/7952/spa-acid.pdf



The above paper didn't work, but it looks similar to the algorithm demostrated on page 12 of
https://peer.asee.org/an-algorithm-for-project-assignment-in-capstone-design.pdf


Our EE4951W class had 100 students pick their top 10 out of 18 projects for groups of 6, and it doesn't take a binomial expansion to realize that's a lot of options!


This algorithm will assign top choices 90% of the time.

I provide the example dataset where random numbers were used for preferences.

Just change the format to fit your situation and the script will run!

Just run python2 spa.py and it will use preferences.csv to assign groups.

Run it multiple times to get new results. The 100 student dataset took 1 second to run.

The folder findBestSolution has scripts to automate 1000 trials in minutes and declare winning arrangements.

I did it 1,000 times and got a normal distribution for the #1 choice assignments for a pool of 120 people.

![alt text](https://github.com/rgbbytes/SPA/blob/master/statistics/histogram.png?raw=true)

I ran the same simulation on the top 3 picks and look what happens to satisfaction!

![alt text](https://github.com/rgbbytes/SPA/blob/master/statistics/histogram3.png?raw=true)
