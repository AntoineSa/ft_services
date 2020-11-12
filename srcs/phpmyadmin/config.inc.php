<?php

$cfg['blowfish_secret'] = 'ce8ZzWHhUQSBPhE6GrqX]s-JchNnxIj{';

$i = 1;

$cfg['Servers'][$i]['auth_type'] = 'cookie';

$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;

$cfg['Servers'][$i]['host'] = 'mysql-service';
$cfg['Servers'][$i]['port'] = '3306';
$cfg['Servers'][$i]['user'] = 'admin';
$cfg['Servers'][$i]['password'] = 'psswd';

$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';

$cfg['ZeroConf'] = 'true';

$cfg['PmaAbsolutUri'] = './';

