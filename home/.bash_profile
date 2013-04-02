files=$(ls ~/.profile.d/*.sh \
           ~/.profile.d/private/*.sh \
           ~/.composure/*.inc \
           ~/.composure/private/*.inc \
           2>/dev/null)

for file in $files; do
    source $file
done

fortune ~/.fortune/*.txt
