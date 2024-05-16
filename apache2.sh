#!/bin/bash

updateProgress() 
{
    echo "XXX"  # dialog格式
    echo $1    # 進度條百分比
    echo $2    # 進度條訊息
    echo "XXX"
}

dialog --title "安裝程序" --msgbox "因為公司需求 會進行安裝作業" 8 30

{
    for i in $(seq 1 35); do
        updateProgress $i "更新套件清單中..."
        sleep 0.1
    done
    sudo apt-get update > /dev/null 2>&1

    for i in $(seq 36 98); do
        updateProgress $i "安裝Apache2和PHP..."
        sleep 0.1
    done
    sudo apt-get install -y apache2 php php-xml  > /dev/null 2>&1

    for i in $(seq 99 100); do
        updateProgress $i "安裝完成"
        sleep 0.5
    done  
    
    sudo a2enmod rewrite
    sudo service apache2 restart
} | dialog --title "安裝套件中" --gauge "安裝進度" 10 70 0

dialog --title "安裝完成" --msgbox "Apache2和PHP安裝完成 稍後請觀看員工四大守則，歡迎你的加入" 5 70
