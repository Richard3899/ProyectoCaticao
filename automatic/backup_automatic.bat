set anio=%date:~6,4%
set mes=%date:~3,2%
set dia=%date:~0,2%
set fecha=%dia%-%mes%-%anio%
set hora=%time:~0,2%
set minuto=%time:~3,2%
set segundo=%time:~6,2%
set tiempo=%hora%-%minuto%-%segundo%
set nombreBackup=CPA_Caticao_%fecha%_%tiempo%.sql
mysqldump -u root -proot caticao > C:\laragon\www\ProyectoCaticao\backups\%nombreBackup%