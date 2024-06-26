#!/bin/bash

copy(){
#Условием проверяем является ли текущий элемент файлом, иначе считаем его директорией
if [[ -f $1 ]]; then
	find -name $1 -print0 | while IFS= read -r -d '' path
	do
		patht=$path
		suf=${patht##*.}
		suf2=${suf##*/}
		if [[ $suf == $suf2 ]]; then
    			base=$(basename --suffix=".$suf" "$path")
	    		new_path=$output/"$base"$counter".$suf"
    			sudo cp -p "$path" "$new_path"
    			counter="("$(( $counter +1 ))")"
		else
			base=$(basename "$path")
                        new_path=$output/"$base"$counter
                        sudo cp -p "$path" "$new_path"
                        counter="("$(( $counter +1 ))")"
		fi

	done
else
	cd $1
	#Если выбранный элемент - директория, то проходимся по внутренним файлам
	for filename1 in *; do
		copy $filename1
	done
	cd ../
fi

}
input=$1
output=$2
if [[ "$#" -ne 2 ]]; then
    echo "Необходимо указать ровно 2 аргумента: [входная дирректория] [выходная дирректория]"
    exit 1
fi
if [[ ! -d "$1" ]]; then
    echo "Указанная входная директория не существует."
    exit 1
fi
if [[ ! -d "$2" ]]; then
    echo "Указанная выходная директория не существует."
    exit 1
fi
cd $input
echo "Начало процесса копирования файлов"
#проверка на то, пустая ли входная директория
shopt -s nullglob dotglob
files=(*)
if [[ !${#files[*]} ]];then
	for filename in *; do
		copy $filename
	done
fi
shopt -u nullglob dotglob

echo "Копирование файлов завершено"
