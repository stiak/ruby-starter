# frozen_string_literal: true

RSpec.describe CLI do
  let(:cli) { CLI.new }

  describe "wave" do
    subject(:wave) { cli.wave }

    it "prints some output" do
      allow(cli).to receive(:puts)
      wave
      expect(cli).to have_received(:puts).with("👋 Hi there!")
    end
  end
end
