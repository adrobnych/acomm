class AppDelegate

  include CDQ

  def application(application, didFinishLaunchingWithOptions:launchOptions)
  	@window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds) 
  	@window.makeKeyAndVisible

  	products_controller = ProductsController.alloc.initWithNibName(nil, bundle: nil)
	nav_controller = UINavigationController.alloc.initWithRootViewController(products_controller)
	
	@window.rootViewController = nav_controller

  	cdq.setup
    true
  end
end
