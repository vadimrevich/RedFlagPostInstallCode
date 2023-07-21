# BUILD

## Закачка платформеннозависимых модулей на сервер

- Зарегистрируйте ftp сервер с парольным доступом.
- Измените в файлах *.\\files.netip4.ru\\Progs\\NIT\\RedFlagPostInstallCode\\\<Platform\>\\loadmaindownloadfile.bat*, *.\\\<Platform\>\\X\\Distrib\\RedFlagPostInstallCode\\install.cmd*, *.\\\<Platform\>\\X\\Distrib\\RedFlagPostInstallCode\\downloads.cmd* доменное имя и учётные записи этого сервера.
- Скопируйте в каталоги *.\\\<Platform\>\\X\\Distrib\\RedFlagPostInstallCode\\* файл *wget.exe*, скаченный из Интернета (внимательно смотрите, чтобы он поддерживался соответствующей платформой).
- Загрузите файлы на сервер (см. файл FEATURES.md).
- Скопируйте каталог *.\\\<Platform\>\\X\\Distrib\\RedFlagPostInstallCode\\* в каталог *.\\Reverse.RedFlag\\\<Platform\>\\* для каждой платформы и туда же — файл unzip.exe.
- В каталоге *.\\Reverse.RedFlag\\\<Platform\>\\* заархивируйте каталог `RedFlagPostInstallCode\` (создайте zip архив с удалением каталога) любым комерческим или некоммерческим архиватором.
- Содержимое этих каталогов Вы можете использовать для установки админ-пака, установки обновлений Windows, помощью в настройке компьютера или пентестинге.

