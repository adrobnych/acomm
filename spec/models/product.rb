describe 'Product' do

  before do
    class << self
      include CDQ
    end
    cdq.setup
  end

  after do
    cdq.reset!
  end

  it 'should be a Product entity' do
    Product.entity_description.name.should == 'Product'
  end
end
