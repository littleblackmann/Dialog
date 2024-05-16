#!/bin/bash

# 安裝dialog
sudo apt-get install -y dialog > /dev/null 2>&1

# 建立新員工帳號
username=$(dialog --stdout --title "新進員工帳號" --inputbox "請創建新帳號名稱：" 10 50)
if [ $? != 0 ] || [ -z "$username" ]; then
    dialog --title "操作取消" --msgbox "沒有輸入帳號，操作已取消" 5 50
    exit 1
fi

# 設定新員工密碼
password=$(dialog --stdout --title "新進員工密碼" --passwordbox "請設定新密碼：" 10 50)
if [ $? != 0 ] || [ -z "$password" ]; then
    dialog --title "操作取消" --msgbox "沒有設定密碼，操作已取消" 5 50
    exit 1
fi

# 新增用戶
sudo adduser --gecos "" $username --disabled-password
echo "$username:$password" | sudo chpasswd

# 詢問是否要加入sudoers
if dialog --title "權限分配" --yesno "是否將 $username 加入sudoers？" 7 50; then
    sudo usermod -aG sudo $username
fi

# 建立成功
dialog --title "帳號創建成功" --msgbox "帳號 $username 已成功創建。" 5 50
