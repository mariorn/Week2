class Lexiconomitron

  def eat_t input
    input.delete("tT")
  end

  def shazam input
    if input.length > 1
      [eat_t(input.first).reverse, eat_t(input.last).reverse]
    else
      [eat_t(input[0]).reverse]
    end
  end

  def oompa_loompa input
    input.select{|word| word.length <= 3}.map {|word| eat_t(word)}
  end


  RSpec.describe "Lexiconomitron" do 

    let(:lexi){Lexiconomitron.new}

    describe "#eat_t" do
      it "removes every letter t from the input" do
        expect(lexi.eat_t("great scott!")).to eq("grea sco!")
      end
    end

    describe "#shazam" do
      it "reverses the letters and returning only the first and last words" do
        expect(lexi.shazam(["This", "is", "a", "boring", "test"])).to eq(["sih", "se"])
      end
    end

    describe "#oompa_loompa" do
      it "takes the ones which size is three characters of less in the same order" do
        expect(lexi.oompa_loompa(["If", "you", "wanna", "be", "my", "lover"])).to eq(["If", "you", "be", "my"])
      end
    end

    describe "#oompa_loompa" do
      it "takes the ones which size is three characters of less in the same order without t" do
        expect(lexi.oompa_loompa(["If", "you", "wanna", "be", "my", "test"])).to eq(["If", "you", "be", "my"])
      end
    end

    describe "#oompa_loompa" do
      it "takes the ones which size is three characters of less in the same order without t" do
        expect(lexi.oompa_loompa(["If", "you", "wanna", "be", "my", "tea"])).to eq(["If", "you", "be", "my", "ea"])
      end
    end

  end


end