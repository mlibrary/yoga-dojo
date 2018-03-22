require 'bowling_game'

RSpec.describe BowlingGame do
  subject(:game) { described_class.new }

  describe "#score" do
    context "with a gutter game" do
      before(:each) { 20.times { game.roll(0) } }

      it "returns zero" do
        expect(game.score).to eq 0 
      end
    end

    context "with all ones" do
      before(:each) { 20.times { game.roll(1) } } 

      it "returns 20" do
        expect(game.score).to eq 20
      end
    end

    context "with a spare" do
      before(:each) do
        game.roll(7)
        game.roll(3)
        game.roll(4)
        17.times { game.roll(0) }
      end

      it "returns 18" do
        expect(game.score).to eq 18
      end
    end

    context "with a spare in the 10th frame" do
      before(:each) do
        18.times { game.roll(0) }
        game.roll(7)
        game.roll(3)
        game.roll(5)
      end

      it "returns 15" do
        expect(game.score).to eq 15
      end
    end

    context "with a strike" do
      before(:each) do
        game.roll(10)
        game.roll(2)
        game.roll(5)
        16.times { game.roll(0) }
      end

      it "returns 24" do
        expect(game.score).to eq 24
      end
    end

    context "with a strike/gutter/four" do
      before(:each) do 
        game.roll(10)
        game.roll(0)
        game.roll(3)
        game.roll(7)
        15.times { game.roll(0) }
      end

      it "returns 23" do
        expect(game.score).to eq 23
      end
    end

    context "with a perfect game" do
      before(:each) { 12.times { game.roll(10) }}

      it "returns 300" do
        expect(game.score).to eq 300
      end
    end

  end
end
