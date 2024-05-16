# 20240318_Dialog專案發表
專案緣起：因應使用者在使用Linux時的需求與權限，我們可以給與不同的設定模式進行帳號管理，在此我們提供一個TUI互動選單模式，讓管理者可以簡單操作完成帳號建立。

> * 創作者： Amber,Black
> * 指導老師：阿甘老師
> * 創作起始日：2024/03/07
> * 最後更新日：2024/03/12
> * 使用系統：Ubuntu22.04.4_Server

---
## 20240306_討論會議 
### 主題發想及架構
* **主腳本（執行全部腳本）**
這個腳本的目的是串聯其他所有的腳本，以便一鍵完成整個新進員工的入職流程。它將會按順序執行其他五個腳本並呼叫一個py檔。
* **創建使用者帳號密碼**
這個腳本將包含你原來的adduser.sh功能，並加以擴展，以符合新的需求。
* **自動發送郵件**
透過郵件的形式發送給新員工歡迎加入的內容。
* **安裝進度條**
因公司需求需安裝apache跟php服務。
* **員工守則**
設計簡易版的員工守則讓新進員工閱讀。
* **小測驗**
設計員工守則閱讀完的小測驗。

---
## 20240307_討論會議
### 製作所需的檔案並修改
1. - [ ] 專案主題內容調整
1. - [ ] 新進員工自行創建帳號密碼
1. - [ ] 發送至email
1. - [ ] 顯示安裝進度條
1. - [ ] 進入員工守則
1. - [ ] 進行測驗

---
## 20240311_討論會議（最終版）
### 最後修正調整及確認執行成果
1. - [ ] 帳號：adduser.sh
1. - [ ] 郵件：email2.sh
1. - [ ] 郵件：test_email.py
1. - [ ] 安裝：apache2.sh
1. - [ ] 守則：rules.sh
1. - [ ] 測驗：exam.sh
1. - [ ] 成果：allrun.sh

---
## 故事主題：新進員工的報到日
2024年3月18是小雲到賺大錢公司的報到日，公司將配發一台筆電給他，請他遠端登入幫自己創建一組新的帳號密碼以及完成員工守則的小測驗。本公司也顧慮到新進員工不免會有緊張的心情，同時也發送一封郵件對新進員工信心喊話，並且非常歡迎他加入本公司。

## 程式檔案簡易說明
---
### **adduser.sh**
是一個為新進員工建立個人帳戶的自動化腳本。我們使用了Linux系統中的dialog工具來提供一個圖形化介面，使帳戶創建過程更加友善和直觀。
為了確保dialog工具在執行腳本前已經安裝好，所有必要的安裝指令都被置於腳本開頭過簡單的互動式對話框，新員工可以輕鬆輸入自己的訊息，包括使用者名稱等，腳本則負責在系統中建立對應的使用者帳戶。
這不僅提高了入職流程的效率，也使得新進員工的第一步體驗更加順暢。

---
### **email-2.sh**
email2.sh腳本專為發送歡迎郵件給新進員工設計。鑑於其需要利用郵件發送功能，該腳本依賴系統能夠處理郵件發送的命令和配置。因此，為了簡化操作流程，相關的郵件傳送準備工作（例如安裝mailutils或設定郵件伺服器資訊）我們直接在adduser.sh腳本執行之前完成。
email.sh透過取得新進員工的信箱地址，自動發送一封預先定義的歡迎郵件，旨在給新員工留下良好的第一印象，同時減少HR部門的工作負擔。

---
### **email-1.py**
email-1.py 腳本是一個使用Python編寫的自動化郵件發送工具，旨在簡化和自動化發送郵件的過程。此腳本透過標準的SMTP協議，連接到指定的郵件伺服器（如Gmail），並傳送預先定義的郵件內容給指定的收件者利用Python的email庫建立郵件內容，包括支援發送純文字和HTML格式的郵件，讓郵件內容更加豐富和適應多種場景。

---
### **rules.sh**
rules.sh腳本的目的是向新進員工提供公司的重要守則，以確保他們在入職後了解並遵守公司的規定。該腳本包含了關於出勤時間、保密責任、行為規範、業務準則和學習獎勵等方面重點。使新進員工在入職當日就對公司的規範有所初步的了解，並且能遵守公司的相關規定，以確保工作有良好的表現。

---
### **exam.sh**
exam.sh腳本是針對員工守則（rules.sh）的重點內容進行測驗。該腳本有是非題跟選擇題。透過測驗了解新進員工的工作態度以及是否有了解並記得公司的重點規範。另外，腳本還包含了顯示測驗結果和刪除答案文件。刪除文件的程式碼可以依據需求選擇是否保留使用。

---
## 工作分配
* **Black**
1. 創建使用者帳戶密碼 (adduser.sh)
1. 使用者輸入Email,發送一封歡迎Email (email2.sh)
1. 創建一個安裝apache2,php進度條 (apache2.sh)
1. 實機操作

* **Amber**
1. 員工守則 (rules.sh)
1. 員工測驗 (exam.sh)
1. 彙整及報告 

---
## Note
[python發送Email參考影片](https://www.youtube.com/watch?v=YQboCnlOb6Y)
[python發送Email參考網站](https://medium.com/%E8%A1%8C%E9%8A%B7%E6%90%AC%E9%80%B2%E5%A4%A7%E7%A8%8B%E5%BC%8F/python%E5%AF%A6%E7%8F%BEgmail%E5%AE%A2%E8%A3%BD%E5%8C%96%E4%BF%A1%E4%BB%B6%E5%A4%A7%E9%87%8F%E7%99%BC%E9%80%81-%E5%9F%BA%E7%A4%8E%E7%AF%87-a98e0c804e51)

![gmail的smtp](https://hackmd.io/_uploads/rkCmep7Q0.png)

---
## 檔案執行順序
* **allrun.sh**
1. adduser.sh 
1. email-2.sh 
1. email-1.py 
1. apache2.sh
1. rules.sh 
1. exam.sh

---

## 遠端無密碼登錄ssh
### windows上先產生公鑰
`ssh-keygen`

---

### SCP公鑰到Ubuntu上
`scp C:\Users\SCE\.ssh\id_rsa.pub black@10.167.223.50:/home/black/.ssh/authorized_keys`

---

### 範例：
`scp C:\Users\[User_name]\.ssh\id_rsa.pub [User_name]@[IP]:/home/[User_name]/.ssh/authorized_keys`

[SSH免密碼登入參考網站](https://dywang.csie.cyut.edu.tw/dywang/linuxserver/node6.html)
[虛擬老師參考網站](https://chat.openai.com/auth/login)

---
## 設定sudo無密碼(因為腳本裡有sudo apt指令所以需要無密碼)
`sudo visudo`
### 更改最底下的文字
> 把
> %sudo  ALL=(ALL:ALL) ALL
> 改成
> %sudo  ALL=(ALL:ALL) NOPASSWD: ALL

[Sudo權限無密碼參考網站](https://ubuntu-for-newbie.kejyun.com/docs/privilege/sudo-no-passowrd/)
[虛擬老師參考網站](https://chat.openai.com/auth/login)

---
## 遠端登入虛擬機後直接執行dialog
`vim /home/black/.bashrc`

---

### 進去之後最底下輸入這段
```
if [ ! -z "$SSH_CONNECTION" ]; then
    /home/black/dialog專案/allrun.sh
fi
```

---
### 範例：
```
if [ ! -z "$SSH_CONNECTION" ]; then
    /home/[ID]/[要執行檔案的位置]/[執行的檔案名]
fi
```
[直接執行dialog參考網站](https://hackmd.io/@osense-rd-public/rkJAFfa79)
[虛擬老師參考網站](https://chat.openai.com/auth/login)








