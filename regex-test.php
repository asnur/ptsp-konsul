<?php
function url_detection($text)
{
    $url_jakpintas = 'jakpintas.dpmptsp-dki.com';
    $url = '~(?:(https?)://([^\s<]+)|(www\.[^\s<]+?\.[^\s<]+))(?<![\.,:])~i';
    if (strpos($text, $url_jakpintas) !== false) {
        $string = preg_replace($url, '<a href="$0" target="_blank" title="$0" style="color: red; text-decoration:underline;">Dokumen Ini</a>', $text);
    }else{
        $string = preg_replace($url, '<a href="$0" target="_blank" title="$0" style="color: red; text-decoration:underline;">$0</a>', $text);
    }
    return $string;
}

echo url_detection('asnur https://odd.com/chat/pdf_file/123012.pdf');