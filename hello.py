import os
import time
import sys


print("Hello, DevOps!")
sys.stdout.flush()

if os.environ.get("NOMAD_TASK_NAME"):
    while True:
        time.sleep(3600)