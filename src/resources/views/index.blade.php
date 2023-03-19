<!DOCTYPE html>
<html lang="fa" dir="rtl">

<head>
    <base href="./">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keyword" content="">
    <title>{{ __('general._title') }}</title>
    @php
    try {
    $filename = 'assets/css/style.css';
    $fileModified = substr(md5(filemtime($filename)), 0, 6);
    } catch (\Exception) {
    $fileModified = '';
    }
    @endphp
    <link href="{{$THEME::CSS_PATH}}/style.css?v={{$fileModified}}" rel="stylesheet">
</head>

<body>
    <div id="root"></div>
    @php
    try {
    $filename = 'assets/js/index.js';
    $fileModified = substr(md5(filemtime($filename)), 0, 6);
    } catch (\Exception) {
    $fileModified = '';
    }
    @endphp
    <script src="{{$THEME::JS_PATH}}/index.js?v={{$fileModified}}"></script>
</body>

</html>