describe 'Category' do

  before do
    class << self
      include CDQ
    end
    cdq.setup
  end

  after do
    cdq.reset!
  end

  it 'should be a Category entity' do
    Category.entity_description.name.should == 'Category'
  end
end
