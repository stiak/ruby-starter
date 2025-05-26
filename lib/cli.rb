class CLI  < Thor
  desc "wave", "Say hello politely"
  def wave(name)
    puts "👋 Hi there #{name}!"
  end
end