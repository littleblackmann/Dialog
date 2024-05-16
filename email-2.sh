#!/bin/bash
# HR的Email
hr_email="kchbk2000@gmail.com"

# emali視窗
dialog --title "歡迎" --msgbox "歡迎你加入本公司，想要告訴你加入本公司的美好\n剛加入都會有一些緊張的心情\n
你不用說我們都懂 請輸入你的Gmail 你將會收到本公司對你的愛" 10 50 

# 新進員工的email
email=$(dialog --stdout --title "歡迎您的加入，請輸入您的Gmail" --inputbox "請輸入您的Gmail:" 8 50)

# 確認email是否輸入
if [ -z "$email" ]; then
    dialog --title "錯誤" --msgbox "沒有輸入Gmail，請重新再來..." 5 50
    clear
    exit 1
fi

# 呼叫Python腳本發送郵件給新員工
python3 /home/black/dialog專案/test_email.py "$email"

# 呼叫Python腳本發送郵件給HR
python3 /home/black/dialog專案/test_email.py "$hr_email"

# 顯示訊息
dialog --title "Email已發送" --msgbox "歡迎您的加入，Email已寄至 $email" 10 50
