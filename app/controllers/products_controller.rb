class ProductsController<UIViewController
	def viewDidLoad
		super

		self.title = "Products"

		right_button = UIBarButtonItem.alloc.initWithTitle("Update", 
			style: UIBarButtonItemStyleBordered, target:self, action:'refresh_products')
  		self.navigationItem.rightBarButtonItem = right_button

  		left_button = UIBarButtonItem.alloc.initWithTitle("Reset", 
			style: UIBarButtonItemStyleBordered, target:self, action:'reset_products')
  		self.navigationItem.leftBarButtonItem = left_button


		@table = UITableView.alloc.initWithFrame(self.view.bounds)
		@table.autoresizingMask = UIViewAutoresizingFlexibleHeight
		self.view.addSubview(@table)
		@table.dataSource = self
		@products = Product.all.array
 		@table.delegate = self

	end

 def viewDidAppear(animated)
    @products = Product.all.array
    @table.reloadData
  end
		
	def tableView(tableView, numberOfRowsInSection: section)
		Product.count
	end

	def tableView(tableView, cellForRowAtIndexPath: indexPath)
		@reuseIdentifier ||= "CELL"

		

		product = @products[indexPath.row]
		cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier)
		cell ||= UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault,
			reuseIdentifier: @reuseIdentifier)

		cell.textLabel.text = product.name
		cell
	end


    def refresh_products
		BubbleWrap::HTTP.get("http://127.0.0.1:4567/products") do |response|
 			result_data = BubbleWrap::JSON.parse(response.body.to_str)
 			create_new_products(result_data["pupils"])
 		end
	end

	def create_new_products array_of_names
		some_category = Category.first
		if some_category == nil
			some_category = Category.create(id: "100008966", name: "gadgets")
		end


		array_of_names.each do |name|
			Product.create(category: some_category, id: "10000#{name}", name: name, price: 10001)
		end
		cdq.save

		@products = Product.all.array
    	@table.reloadData
	end	

	def reset_products
		Product.all.each do |product|
			product.destroy
		end
		cdq.save

		@products = Product.all.array
    	@table.reloadData
	end
end