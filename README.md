# Задача скрипта

Данный скрипт на bash на вход принимает два параметра - две директории (входная директория и выходная директория). 
Во входной директории могут находиться как файлы, так и вложенные директории (внутри которых тоже могут быть как файлы, так и папки) - уровень вложенности может быть любой.
Скрипт "обходит" входную директорию и копирует все файлы из нее (и из всех сложенных директорий) в выходную директорию - но уже без иерархии, а просто все файлы - внутри выходной директории.
# Принцип работы
## Ввод
Pапуск скрипта производится командой с передачей двух аргументов: bash TZ1.sh |входная директория| |выходная директория|
