schema "001" do 
	entity "Product" do
		string :id, optional: false 
		string :name, optional: false
	  integer32 :price, optional: false

		belongs_to :category
	end

	entity "Category" do
		string :name, optional: false
		has_many :products
	end
end