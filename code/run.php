#!/usr/local/bin/php

<?php

$content = sprintf(
    'Datetime: %s, uid: %d',
    date('Y-m-d H:i:s'),
    posix_getuid(),
);

file_put_contents(
    filename: 'output.txt',
    data: $content . "\n",
    flags: FILE_APPEND,
);
