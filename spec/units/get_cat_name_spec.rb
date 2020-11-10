describe Cat do
  describe '#initialize' do

  end
  describe ".all" do
    it "returns all the cats" do
      insert_cat
      cats = Cat.all
      expect(cats.length).to eq 1
    end
  end

end
