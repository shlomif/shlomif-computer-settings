cat ~/.histfile | perl -lpE 's%^:\s*[0-9]+:[0-9]+;%%; s/[ \t]+$//' | sus > ~/todel.txt
