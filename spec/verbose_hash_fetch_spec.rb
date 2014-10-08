require 'verbose_hash_fetch'

RSpec.describe "VerboseHashFetch" do

  let(:hash) { { :foo => "bar" } }

  context "with one argument" do

    it "fetches an existing key" do
      expect(hash.fetch(:foo)).to eq "bar"
    end

    it "raises a KeyError for non existing keys" do
      expect { hash.fetch(:bar) }.to raise_error(KeyError)
    end

    it "raises a KeyError with self.inspect in the message" do
      expect { hash.fetch(:bar) }.to raise_error("key not found: :bar in Hash: {:foo=>\"bar\"}")
    end

  end

  context "with two arguments" do

    it "fetches the existing value" do
      expect(hash.fetch(:foo, "default")).to eq "bar"
    end

    it "uses the 2nd argument when key not found" do
      expect(hash.fetch(:bar, "default")).to eq "default"
    end

  end

  context "with a block" do

    it "fetches the existing value" do
      expect(hash.fetch(:foo) { "default" }).to eq "bar"
    end

    it "evaluates the block when key not found" do
      expect(hash.fetch(:bar) { |k| "default #{k}" }).to eq "default bar"
    end

  end

end
