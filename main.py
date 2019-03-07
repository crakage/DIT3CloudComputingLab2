from flask import Flask, jsonify
import socket
import multiprocessing
from subprocess import Popen, PIPE


app = Flask(__name__)


def get_ip():  # found in stackoverflow.com
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        # doesn't even have to be reachable
        s.connect(('10.255.255.255', 1))
        IP = s.getsockname()[0]
    except:
        IP = '127.0.0.1'
    finally:
        s.close()
    return IP

def get_pub_ip():
    with Popen(["dig", "+short", "myip.opendns.com", "@resolver1.opendns.com"], stdout=PIPE) as proc:
        ipAddr = str(proc.stdout.read())
        ip = ipAddr[2:-3]
    return ip

def get_memory():
    with Popen(["awk", "/MemTotal/ {print $2}", "/proc/meminfo"], stdout=PIPE) as proc:
        memStr = str(proc.stdout.read())
        mem = memStr[2:-3]
    return mem


@app.route('/status')
def info():
    a = {
        "hostname": socket.gethostname(),
        "ip address": get_ip(),
        "public ip": get_pub_ip(),
        "cpus": multiprocessing.cpu_count(),
        "memory": get_memory()
    }
    return jsonify(a)


app.run(host='0.0.0.0', port=8080)

