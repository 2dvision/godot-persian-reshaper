# Godot Persian Reshaper

Reconstruct Persian sentences in Godot engine.

# English
## Description
This plugin works with Godot engine v3.x.

Godot engine don't support right to left language like Persian (Farsi). This problem is solve in Godot engine 4.

The first problem is that text written left to right and characters are isolated form.

![image 01](https://user-images.githubusercontent.com/16509592/150971982-b1c9fe5e-74e0-4d30-83f5-0272d3abbecc.jpg)

For solve this problem, First need reverse letters to right to left.

![image 02](https://user-images.githubusercontent.com/16509592/150972007-ada624c8-20f9-4e93-9197-0a654e2fa9fb.jpg)

Then need to reshape characters.

![image 03](https://user-images.githubusercontent.com/16509592/150972013-5df8540c-958b-4a09-94dc-1a15edf7c8b0.jpg)

Another problem is line order for multi-line text. the lines written bottom to top.

![image 04](https://user-images.githubusercontent.com/16509592/150972016-5c8a1cf4-8ab5-4095-be9a-1619065ba84e.jpg)

This problem solves with reverse lines order.

![image 05](https://user-images.githubusercontent.com/16509592/150972024-e6eab910-1c83-4f1f-8edd-3db519f9b482.jpg)

## Install plugin

Download this repo and copy "addons" folder to your project root directory.

Then go to Project > Project Settings... > Plugins and enable "Persian Reshaper" plugin.

Plugin GUI added to the top of Godot engine panel.

## Settings

This code don't work on RichTextLabel good.   
Don't choose Autowrap in Label Properties.

Add a Label node, then go to the inspector and change

1. Align to Right
2. Grow Direction > Horizontal to Begin

## Usage

### GUI
You could use GUI in plugin panel.

### Single line text in code
Call Label like this in Label script:

```
var txt := "پارسی شکر است."
$Label.text = Persian.reshaper(txt)
```

### Multi-line text in code
If you want enable Autowrap for Multi-line text, Add the second parameter numerically, That is line length.

Line length is all characters (letter, number, space) that are in a line.

```
$Label.text = Persian.reshaper(txt, 36)
```

P.S. I am beginner in coding. Take it easy. :))

# Persian

<div dir="rtl">
بازسازی جمله‌های فارسی در گودو انجین

## توضیح
این افزونه با گودو انجین 3.x کار می‌کند.

گودو انجین از زبان‌های راست به چپ مانند پارسی پشتیبانی نمی‌کند.
این مشکل در گودو انجین نسخه ۴ حل شده است.

مشکل اول نوشتن کاراکترها از چپ به راست و در حالت ایزوله است.

![image 01](https://user-images.githubusercontent.com/16509592/150971982-b1c9fe5e-74e0-4d30-83f5-0272d3abbecc.jpg)

برای حل این مشکل لازم است تا کاراکترها بصورت راست به چپ معکوس شوند.

![image 02](https://user-images.githubusercontent.com/16509592/150972007-ada624c8-20f9-4e93-9197-0a654e2fa9fb.jpg)

بعد لازم است که کاراکترها به شکل درست بازنویسی شود.

![image 03](https://user-images.githubusercontent.com/16509592/150972013-5df8540c-958b-4a09-94dc-1a15edf7c8b0.jpg)

مشکل دیگر ترتیب قرار گیری خطوط در زمانی است که حالت wrap برای متن انتخاب می‌شود. در این حالت خط‌ها از پایین به بالا نمایش داده می‌شوند.

![image 04](https://user-images.githubusercontent.com/16509592/150972016-5c8a1cf4-8ab5-4095-be9a-1619065ba84e.jpg)

برای حل این مشکل باید ترتیب خط‌ها را معکوس کنیم.

![image 05](https://user-images.githubusercontent.com/16509592/150972024-e6eab910-1c83-4f1f-8edd-3db519f9b482.jpg)

## نصب

برای نصب افزونه این رپوزیتوری را دانلود کنید و فولدر «addons» را در مسیر اصلی پروژه خود کپی کنید.

سپس به مسیر Project > Project Settings... > Plugins بروید و پلاگین «Persian Reshaper» فعال کنید

پانل گرافیکی افزونه در بالای پنجره گودو انجین قرار می‌گیرد.

## تنظیمات
این کد در RichTextLabel به خوبی کار نمی‌کند.   
برای نود لیبل از Autowrap استفاده نکنید.

یک نود لیبل اضافه کنید، سپس در تنظیمات لیبل موارد زیر را تغییر دهید

1. گزینه Align به Right
2. گزینه Grow Direction > Horizontal به Begin

## روش استفاده

### رابط گرافیکی
شما می‌توانید از رابط گرافیکی در پانل افزونه استفاده کنید.

### متن‌های تک خط در کد
لیبل را در اسکریپت‌اش به این شکل صدا بزنید

</div>

```
var txt := "پارسی شکر است."
$Label.text = Persian.reshaper(txt)
```

<div dir="rtl">

### متن‌های چند خط در کد
اگر می‌خواهید حالت Autowrap برای متن شما فعال شود، پارامتر دوم را به شکل عددی وارد کنید. این عدد طول خط شما است.

طول خط شامل همه کاراکترهایی (حرف، عدد، فاصله) است که در یک خط قرار می‌گیرند.
</div>

```
$Label.text = Persian.reshaper(txt, 36)
```

<div dir="rtl">
پ. ن. من در کد نویسی تازه کارم. سخت نگیرید. :))
</div>
