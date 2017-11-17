import smtplib
 
server = smtplib.SMTP('smtp.gmail.com', 587)
server.starttls()
server.login("admin@gmail.com", "xyz")
 
msg = "YOU LOST!"
server.sendmail("admin@gmail.com", "player@gmail.com", msg)
server.quit()