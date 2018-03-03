class FileSecrets
  
  attr_reader :base
  
  class << self
    # Get a file value using from the default base.
    def get(key)
      new.get(key)
    end
    
    alias_method :[], :get
  end

  # Create a new file secrets accessor. The files will be loaded relative to the
  # provided base directory. If none is provided, it will default to using the
  # directory set in the FILE_SECRETS_BASE environment variable or the current
  # working directory.
  def initialize(base = nil)
    @base = (base || ENV['FILE_SECRETS_BASE'] || Dir.pwd)
  end
  
  # Get the contents of the file specified (relative to the base directory).
  # If the file does not exist, this method will return nil. Any trailing
  # line delimiters will be stripped from the returned value.
  def get(key)
    file_name = File.join(key.split('/'))
    file_path = File.expand_path(file_name, base)
    if File.exist?(file_path) && File.file?(file_path)
      File.read(file_path).chomp
    else
      nil
    end
  end
  
  alias_method :[], :get
end
