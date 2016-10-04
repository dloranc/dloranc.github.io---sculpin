<?php

$date = date('Y-m-d');
if (!empty($argv[2])) {
    $date = $argv[2];
}
$file = 'source/_posts/' . $date . '-' . str_replace('_', '-', $argv[1]) . '.md';

$title = ucwords(str_replace('_', ' ', $argv[1]));
$handle = fopen($file, 'w');
$data = "---
title: {$title}
tags: []
categories: []

---

";
fwrite($handle, $data);
