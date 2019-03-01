from flask import Flask, jsonify
#from psutil import virtual_memory
import socket
import multiprocessing


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


# def get_memory():
#     my_memory = virtual_memory()
#     return my_memory.total


@app.route('/status')
def info():
    a = {
        "hostname": socket.gethostname(),
        "ip address": get_ip(),
        "cpus": multiprocessing.cpu_count(),
        "memory": "get_memory()"
    }
    return jsonify(a)


app.run(port=8080)
