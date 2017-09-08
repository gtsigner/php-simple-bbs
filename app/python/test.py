  import docker
  client = docker.from_env()
  print client.containers.run("alpine", ["echo", "hello", "world"])