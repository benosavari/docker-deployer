require "yaml"

class Config
  def self.load(file)
    YAML.load_file(file)
  end
end
