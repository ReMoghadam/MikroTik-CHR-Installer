# MikroTik CHR Installer On ubuntu ( Hetzner )
Simple and useful installer for MikroTik CHR RouterOS Version 7 & Version 6 via TUI ( Terminal User Interface ).

## Installation
```bash
wget -O mikrotik-chr-installer.sh https://raw.githubusercontent.com/remoghadam/mikrotik-chr-installer/main/install.sh && sudo sh mikrotik-chr-installer.sh
```
به سرور (‌ سیستم عامل ) مورد نظر لاگین کنید, سپس دستور بالا را در ترمینال کپی کنید.
اسکریپت بالا بصورت خودکار نیازمندی ها را دانلود و نصب میکند.

در مرحله بعد بصورت گرافیکی نسخه سیستم عامل میکروتیک مورد نظر ( نسخه ۶ یا ۷ )  را انتخاب کنید تا نصب آن انجام شود.

> کل فرایند نصب از لحظه کپی کردن دستور تا انتخاب و تحویل میکروتیک حداکثر یک دقیقه طول خواهد کشید.




## پیشنهادات
- برای ارتقا یا نصب مجدد, اسکریپت بالا را مجددا کپی کنید
 - از سیستم عامل لینوکس اوبونتو نسخه 24.04 استفاده کنید
 - پردازنده از نوع x86 ( Intel/AMD ) باشد.
 - سرور و پلن CX22 هتزنر تست و جوابگو هست.
- ترجیا از نسخه ۷ سیستم عامل میکروتیک استفاده کنید
- بعد از نصب سریعا وارد روتر شوید و تنظیمات امنیتی (‌نام کاربری و سرویس ها را انجام دهید )
  


## تصویر اسکریپت و محیط TUI

![Screenshot 01 - Main Menu](https://github.com/ReMoghadam/mikrotik-chr-installer/blob/main/Schreenshot-01.png?raw=true)
بعد از کپی کردن دستور در ترمینال با این صفحه مواجه میشوید (‌ ترجیحا از نسخه ۷ استفاده کنید )


![Screenshot 02 - Success](https://github.com/ReMoghadam/mikrotik-chr-installer/blob/main/Schreenshot-02.png?raw=true)
پس از انتخاب و نصب سیستم عامل میکروتیک با پیام بالا مواجه می شوید و  میتوانید به روتر میکروتیک لاگین کنید