<?php
require '_app/core/Setup.php';
file_exists('config.php') ? Setup::start() : Setup::install();