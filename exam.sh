# !/bin/bash

# 寫入答案文件
> answers.txt

# 顯示歡迎訊息
dialog --clear --title "新進人員小小測驗" --msgbox "\nHi，新進夥伴，公司非常歡迎您的到來~我們來做個簡單的新人小測驗吧！不用緊張，放輕鬆~深呼吸準備開始囉！" 10 50

# 提示開始測驗
dialog --title "開始測驗" --msgbox "\n        題目總共10題，是非題跟選擇題。\n\n        請選擇每個題目中最合適的答案。" 10 50

# 函數定義是非題
ask_yesno_question() {
    dialog --clear --title "$1" --yesno "$2" 10 50
    if [ $? -eq 0 ]; then
        echo "(O)" >> answers.txt
    else
        echo "(X)" >> answers.txt
    fi
}

# 函數定義選擇題
ask_choice_question() {
    selected_option=$(dialog --clear --title "選擇題" --menu "$2" 15 50 4 \
                            A "$3" \
                            B "$4" \
                            C "$5" \
                            D "$6" \
                            3>&1 1>&2 2>&3)
    echo "$selected_option" >> answers.txt
}

# 開始測驗
ask_yesno_question "是非題" "\n同事因為上班快要遲到，所以請我先幫他打卡，我覺得沒關係。"
ask_yesno_question "是非題" "\n員工可以將公司的機密文件上傳至個人雲端或是郵寄至個人電子信箱以便在家工作。"
ask_choice_question "選擇題" "\n員工如需請長期假期（超過三天），應提前多久提交請假申請？" "3個工作日" "4個工作日" "1個工作日" "7個工作日"
ask_choice_question "選擇題" "\n員工對於工作表現突出的獎勵可能包括以下哪些？" "加薪" "表揚" "晉升" "全部都是"
ask_choice_question "選擇題" "\n保密協議規範中，員工應如何處理公司機密信息？" "自行使用" "轉告親友" "任意外洩" "嚴格保密，不得外泄"
ask_choice_question "選擇題" "\n在工作中遇到挑戰時，你會怎麼做？" "逃避困難" "主動尋求解決方案" "抱怨問題" "放棄"
ask_choice_question "選擇題" "\n如果你的同事長期遲到或缺席，你會？" "不理會" "提醒他們" "向主管舉報" "自行調整作息"
ask_choice_question "選擇題" "\n你認為工作態度對於工作的執行完成性有多重要？" "不重要" "一般" "很重要" "非常重要"
ask_choice_question "選擇題" "\n如果你發現同事正在外洩公司的機密信息，你會？" "視而不見" "跟其他同事分享" "向主管匯報" "自行處理"

# 顯示結果
dialog --clear --title "測驗結果" --msgbox "$(cat answers.txt)" 20 60

# 删除答案文件
rm answers.txt

# 完成測驗
dialog --clear --title "感謝您參與測驗" --msgbox "\n恭喜您完成我們的新進人員小測驗，歡迎加入我們的團隊！請好好享受在公司的愉快時光哦！" 10 50
