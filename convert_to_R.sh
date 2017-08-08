> R_datafile.csv 
spongefile=$(mktemp)
tempfile=$(mktemp)
echo "ebin" > "$tempfile"
grep -v NITER run_iterations.dat |cut -d ' ' -f 1|sort -nu >> "$tempfile"
while read line ; do 
    if [[ -n "$(echo "$line"|grep NITER)" ]] ; then
        iteration=$(echo "$line" |cut -d ' ' -f 3) 
        paste -d ',' R_datafile.csv "$tempfile" > "$spongefile"
        mv "$spongefile" ./R_datafile.csv && rm "$tempfile"
        tempfile=$(mktemp) 
        echo "w_$iteration,h_$iteration" > "$tempfile"
    else
        echo "$line"|cut -d ' ' -f 2- |tr ' ' ','>> "$tempfile"
    fi
done < run_iterations.dat
rm "$tempfile"