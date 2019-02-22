from flask import Flask
import subprocess


app = Flask(__name__)


# status = {
#     "hostname": subprocess.run(["hostname"]),
#     "ip address": subprocess.run(["ifconfig"]),
#     "cpus": subprocess.run(["sysctl", "-n", "hw.physicalcpu"]),
#
# }

@app.route('/status')
def getStatus():
    return 'Hello Status Page'

app.run(port= 8080)