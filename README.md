# Задача скрипта

Данный скрипт на bash на вход принимает два параметра - две директории (входная директория и выходная директория). 
Во входной директории могут находиться как файлы, так и вложенные директории (внутри которых тоже могут быть как файлы, так и папки) - уровень вложенности может быть любой.
Скрипт "обходит" входную директорию и копирует все файлы из нее (и из всех сложенных директорий) в выходную директорию - но уже без иерархии, а просто все файлы - внутри выходной директории.
# Принцип работы
## Ввод
Для рабоыт скрипта понадобятся права администратора
Запуск скрипта производится командой с передачей двух аргументов: bash TZ1.sh `входная директория` `выходная директория`
## Работа скрипта
Скрипт рекурсивно проходит по директориям и копирует поочерёдно все файлы сохраняя все параметры файлы (права доступа, последнее время обращения и т.п.). Так же скрипт пропускает скрытые файлы. Возможное возникновение проблемы одинаковых названий у разных файлов решено тем, что в выходной директории они будут иметь названия вида \*имя\*(\*номер дубликата имени\*)   
## Пример работы скрипта
*Входная директория*
![*Входная директория*](https://github.com/bananzi/TechnicalProgramming/assets/54536912/61caec47-f045-4833-aa15-2f608bf7f3f3)

*Выходная директория*
![*Выходная директория*](https://github.com/bananzi/TechnicalProgramming/assets/54536912/b6f32480-e7b6-4805-ab34-cda0a2cf200c)
