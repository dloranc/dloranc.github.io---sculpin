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
date: {$date}T22:40:00+01:00
categories: []
tags: []
image: ?.jpg
excerpt: ?
draft: true
---

";
fwrite($handle, $data);
