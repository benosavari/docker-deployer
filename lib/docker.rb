class Docker
  def self.build(image, dockerfile)
    system("docker build -t #{image} -f #{dockerfile} .")
  end

  def self.stop(container)
    system("docker stop #{container} >/dev/null 2>&1")
  end

  def self.remove(container)
    system("docker rm #{container} >/dev/null 2>&1")
  end

  def self.run(app)
    image = app["image"]
    container = app["container_name"]

    ports = (app["ports"] || []).map { |p| "-p #{p}" }.join(" ")
    envs = (app["env"] || {}).map { |k, v| "-e #{k}=#{v}" }.join(" ")

    cmd = "docker run -d --name #{container} #{ports} #{envs} #{image}"

    system(cmd)
  end
end
