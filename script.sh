LOG='/root/smartfe-archive.log'
SRC="/backup/"
DST="/cache/"
PREFIX="-enc.7z"
for i in `ls $SRC | grep Smartfe| grep -v "enc" | grep -v "md5"`
do
  ARCHNAME=$DST$i$PREFIX
  echo "Copying $SRC$i to local storage /ca ..." >>$LOG 2>&1
  cp $SRC$i $DST$i
  cp $SRC$i.md5 $DST$i.md5

  echo "Archiving $SDT$i ... " >>$LOG 2>&1
  7za -mx0 a $ARCHNAME $DST$i $DST$i.md5 -p$1
  echo "Revoming tmpfile" >>$LOG 2>&1
  rm $DST$i $DST$i.md5
  echo "Moving encrypted arch to S3" >>$LOG 2>&1
  mv $ARCHNAME $SRC
  echo "Done" >>$LOG 2>&1
done

#while IFS= read -r i; 
#do 
#  ARCHNAME=$DST$i$PREFIX
#  echo "Copying $SRC$i to local storage /cache ..." >>$LOG 2>&1
#  cp $SRC$i $DST$i
#  echo "Archiving $SDT$i ... " >>$LOG 2>&1
#  7za -mx0 a $ARCHNAME $DST$i -p$1
#  echo "Revoming tmpfile" >>$LOG 2>&1
#  rm $DST$i
#  echo "Moving encrypted arch to S3" >>$LOG 2>&1
#  mv $ARCHNAME $SRC
#  echo "Done" >>$LOG 2>&1
#   echo $i
#done < /home/m.dubrovniy/last-gz.log
#for i in `ls /backup | grep Smart | grep .7z`
#do
#echo $i >> all-7z.log
#done
