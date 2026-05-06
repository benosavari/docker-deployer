
require_relative "./lib/config"
require_relative "./lib/docker"

config = Config.load("deploy.yaml")
app = config["app"]

image = app["image"]
container = app["container_name"]

puts "Building image: #{image}"
Docker.build(image, app["dockerfile"])

puts "Stopping existing container (if any)..."
Docker.stop(container)

puts "🧹 Removing existing container (if any)..."
Docker.remove(container)

puts "▶Running new container..."
Docker.run(app)

puts "Deployment complete!"