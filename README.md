# Godot Persian Reshaper


# English

Works with Godot engine v3.1 beta.

## Description

If you don't use Persian, you don't need this code.

Godot engine don't support right to left language like Persian (Farsi).

The first problem is that text written left to right and characters are isolated form.

![image 01](https://raw.githubusercontent.com/2dvision/godot-persian-reshaper/master/godot_persian_reshaper01.jpg)

For solve this problem, First, need reverse letters to right to left.

![image 02](https://raw.githubusercontent.com/2dvision/godot-persian-reshaper/master/godot_persian_reshaper02.jpg)

Then need to reshape characters.

![image 03](https://raw.githubusercontent.com/2dvision/godot-persian-reshaper/master/godot_persian_reshaper03.jpg)

Another problem is line order for wrap text. the line is written bottom to top.

![image 04](https://raw.githubusercontent.com/2dvision/godot-persian-reshaper/master/godot_persian_reshaper04.jpg)

This problem solves with reverse line order.

![image 05](https://raw.githubusercontent.com/2dvision/godot-persian-reshaper/master/godot_persian_reshaper05.jpg)

## Settings

Go to Project Settings > AutoLoad and add ```Persian.gd``` to Singleton.

Go to Project Settings > Display > Window and change

1. Mode to viewport
2. Aspect to keep

## Usage

This code doesn't work on RichTextLabel good.
Don't choose Autowrap in Label Properties.

Add a Label node, then go to the inspector and change

1. Align to Right
2. Grow Direction > Horizontal to Begin

Call Label like this in Label script:

```
Label.text = Persian.reshaper(text, false, 0)
```

1. text = your text string variable
2. true/false = is wrap? If wrap is false, line length don't work.
3. 0 = Line length for wrap text

You can manually change the length of the line, or use this code to adjust that with width Label size.

```
Label.text = Persian.reshaper(text, true, Persian.line_length(Label))
```

P.S. I am a beginner in coding. Take it easy. :))

# Persian

<div dir="rtl">

با گودو انجین v3.1 beta کار می‌کند.

## توضیح

گودو انجین از زبان‌های راست به چپ مانند پارسی پشتیبانی نمی‌کند.

مشکل اول نوشتن کاراکترها از چپ به راست و در حالت ایزوله است.

![image 01](https://raw.githubusercontent.com/2dvision/godot-persian-reshaper/master/godot_persian_reshaper01.jpg)

برای حل این مشکل لازم است تا کاراکترها بصورت راست به چپ معکوس شوند.

![image 02](https://raw.githubusercontent.com/2dvision/godot-persian-reshaper/master/godot_persian_reshaper02.jpg)

بعد لازم است که کاراکترها به شکل درست بازنویسی شود.

![image 03](https://raw.githubusercontent.com/2dvision/godot-persian-reshaper/master/godot_persian_reshaper03.jpg)

مشکل دیگر ترتیب قرار گیری خطوط در زمانی است که حالت wrap برای متن انتحاب می‌شود. در این حالت خط‌ها از پایین به بالا نمایش داده می‌شوند.

![image 04](https://raw.githubusercontent.com/2dvision/godot-persian-reshaper/master/godot_persian_reshaper04.jpg)

برای حل این مشکل باید ترتیب خط‌ها را معکوس کنیم.

![image 05](https://raw.githubusercontent.com/2dvision/godot-persian-reshaper/master/godot_persian_reshaper05.jpg)

## تنظیمات

به مسیر Project Settings > AutoLoad بروید و ```Persian.gd``` را به عنوان Singleton قرار دهید.

به مسیر Project Settings > Display > Window بروید و موارد زیر را تغییر دهید

1. گزینه Mode به viewport
2. گزینه Aspect به keep

## روش استفاده

این کد در RichTextLabel به خوبی کار نمی‌کند.

برای لیبل از Autowrap استفاده نکنید.

یک نود لیبل اضافه کنید، سپس در تنظیمات لیبل موارد زیر را تغییر دهید

1. گزینه Align به Right
2. گزینه Grow Direction > Horizontal به Begin

لیبل را در اسکریپت‌اش به این شکل صدا بزنید

</div>

```
Label.text = Persian.reshaper(text, false, 0)
```

<div dir="rtl">

1. پارامتر اول text = متغییر متن مورد نظر شما است.
2. پارامتر دوم true/false = آیا wrap فعال است؟ اگر نه متغییر «طول خط» کار نمی‌کند.
3. پارامتر 0 = طول خط، زمانی که wrap فعال است.

شما می‌توانید طول خط را دستی تنظیم کنید و یا از کد زیر برای تنظیم آن بر اساس اندازه طول لیبل بصورت خودکار استفاده کنید.

</div>

```
Label.text = Persian.reshaper(text, true, Persian.line_length(Label))
```

<div dir="rtl">
پ. ن. من در کد نویسی تازه کارم. سخت نگیرید. :))
</div>
