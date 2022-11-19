import paramiko
import socket

ip = '127.0.0.1'
port = 2222
pwd = 'test123'
user = 'testuser'
client = paramiko.SSHClient()
client.set_missing_host_key_policy(paramiko.AutoAddPolicy())

try: 
    client.connect(hostname=ip, username=user, password=pwd, port=port)
except Exception as e: 
    print(e)
