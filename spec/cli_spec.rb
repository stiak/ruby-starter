# frozen_string_literal: true

RSpec.describe CLI do
  let(:cli) { CLI.new }

  describe "wave" do
    let(:name) { "rspec" }

    subject(:wave) { cli.wave(name) }

    it "prints some output" do
      allow(cli).to receive(:puts)
      wave
      expect(cli).to have_received(:puts).with("👋 Hi there #{name}!")
    end
  end
end
