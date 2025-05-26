loader = Zeitwerk::Loader.new
loader.tag = File.basename(__FILE__, ".rb")
loader.push_dir("#{__dir__}/lib")
loader.inflector.inflect "cli" => "CLI"
loader.setup
