#!/bin/bash

copy(){
#Условием проверяем является ли текущий файл файлом или директорией
#В случае директории рекурсивно вроваливаемся внутрь
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
	#Делаем проходку по файлам во входной директории
	for filename in *; do
		copy $filename
	done
	cd ../
fi

}
input=$1
output=$2
cd $input
echo "Начало процесса копирования файлов"

shopt -s nullglob dotglob
files=(*)
if [[ !${#files[*]} ]];then
	for filename in *; do
		copy $filename
	done
fi
shopt -u nullglob dotglob

echo "Копирование файлов завершено"
