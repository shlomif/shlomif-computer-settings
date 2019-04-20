cat ~/.histfile | perl -lpE 's/[ \t]+$//' | sus > ~/todel.txt
