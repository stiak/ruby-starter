class CLI  < Thor
  desc "wave <name>", "Say hello politely"
  def wave(name)
    puts "👋 Hi there #{name}!"
  end
end