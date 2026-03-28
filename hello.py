import os
import time
import sys

# The exact output requested by the assignment
print("Hello, DevOps!")
sys.stdout.flush()

# Keep the container alive ONLY if it's running inside Nomad
if os.environ.get("NOMAD_TASK_NAME"):
    while True:
        time.sleep(3600)