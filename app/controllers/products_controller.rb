class ProductsController<UIViewController
	def viewDidLoad
		super

		@table = UITableView.alloc.initWithFrame(self.view.bounds)
		@table.autoresizingMask = UIViewAutoresizingFlexibleHeight
		self.view.addSubview(@table)
		@table.dataSource = self
	end

		
	def tableView(tableView, numberOfRowsInSection: section)
		Product.count
	end

	def tableView(tableView, cellForRowAtIndexPath: indexPath)
		@reuseIdentifier ||= "CELL"

		@products ||= Product.all.array

		product = @products[indexPath.row]
		cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier)
		cell ||= UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault,
			reuseIdentifier: @reuseIdentifier)

		cell.textLabel.text = product.name
		cell
	end
end