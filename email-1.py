import email.message
import smtplib
import sys

recipient_email = sys.argv[1]  # 命令列參數:收件者的信箱

# 準備訊息設定
msg = email.message.EmailMessage()
msg["From"] = "b0986816338@gmail.com"  # 寄件人
msg["To"] = recipient_email  # 收件人
msg["Subject"] = "雲端班的新進同仁，歡迎您的加入"

# 純HTML內容
html_content = """
<html>
    <body>
      <h1>雲端班的新進同仁，歡迎您加入我們賺大錢集團</h1>
      <p>恭喜！ 透過嚴格的甄選，您成功脫穎而出，成為了賺大錢集團的一員。 這說明您不僅擁有出色的技能，還擁有與我們共同前進的勇氣和決心。 </p>
      <h2>您將參與前所未有的專案中，和一群開朗的夥伴一起工作。</h2>
      <p>別擔心，我們知道新人總是有很多問題，這也是為什麼每位新成員剛來的時候都很緊張。 </p>
      <p>最後，再次歡迎您的加入！ 我們相信您的到來不僅會為賺大錢集團帶來新的活力和靈感，還會讓我們的咖啡消耗量達到新的高度。 準備好了嗎？ 讓我們一起迎接挑戰，創造奇蹟，偶爾也能放鬆一下，享受這段旅程。 </p>
      <p>如有任何疑問或需要協助，請隨時與我們聯繫。 期待與您一起工作，共創美好未來。 </p>
    </body>
</html>
"""
msg.add_alternative(html_content, subtype='html')

# 純文字內容
#msg.set_content(""" """)

# 連線到 SMTP Server, 驗證寄件者身分並傳送郵件
# 到網路上查詢 gmail 的 smtp server
server = smtplib.SMTP_SSL("smtp.gmail.com", 465)
server.login("自己的@gmail.com", "金鑰")  # 使用你的實際登入訊息
server.send_message(msg)
server.close()
