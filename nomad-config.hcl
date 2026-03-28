plugin "docker" {
  config {
    endpoint = "tcp://127.0.0.1:2375"
    
    # THIS IS THE MAGIC FIX:
    # Tell Nomad on Windows to accept Linux containers
    allow_caps = ["audit_write", "chown", "dac_override", "fowner", "fsetid", "kill", "mknod", "net_bind_service", "setfcap", "setgid", "setpcap", "setuid", "sys_chroot"]
    
    # If the above doesn't work, sometimes Nomad needs this explicit flag:
    # (Remove the '#' on the next line if the allow_caps doesn't immediately fix it)
    # image_type = "linux" 
  }
}

client {
  options {
    "docker.caps.whitelist" = "all"
    # Force the node class to linux so Nomad stops expecting Windows workloads
    "node_class" = "linux"
  }
}