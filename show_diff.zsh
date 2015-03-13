

DOTFILES=(.*)

for file in ${DOTFILES};
do
    if [[ ${DOTFILES} != "(.git|show_diff)" ]]
    then
        echo "Diffing ~/${file} ${file}"
        diff ~/${file} ${file}
    fi

done
