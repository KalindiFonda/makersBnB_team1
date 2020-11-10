describe Cat do
  describe '#initialize' do
    it "creates a cat object" do
      cat = insert_cat
      expect(cat).to be_a Cat
    end
  end
  describe ".all" do
    it "returns all the cats" do
      insert_cat
      cats = Cat.all
      expect(cats.length).to eq 1
      # expect(cats.first).to be_a Cat
    end
  end

  describe ".create" do
    it "creates a new cat profile" do
      Cat.create(name: "Fluffy", description: "The fluffiest cat",
        picture: "https://placekitten.com/g/200/300", price: 300)
      cats = Cat.all
      expect(cats.first).to be_a Cat
      expect(cats.first.name).to eq "Fluffy"
    end
  end
end
