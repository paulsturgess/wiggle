class WiggleAnimation

  def self.load
    _animation = CAKeyframeAnimation.animationWithKeyPath("transform")
    valLeft = NSValue.valueWithCATransform3D(
      CATransform3DMakeRotation(0.06, 0.0, 0.0, 1.0)
    )
    valRight = NSValue.valueWithCATransform3D(
      CATransform3DMakeRotation(-0.06, 0.0, 0.0, 1.0)
    )
    _animation.setValues [valLeft, valRight]
    _animation.setAutoreverses true
    _animation.setDuration 0.125
    _animation.setRepeatCount 99999999
    _animation
  end

end

class MyController < UIViewController

  def viewDidLoad
    super
    view.addSubview(button)
  end

  def button
    @button ||= UIButton.buttonWithType(UIButtonTypeRoundedRect).tap do |button|
      button.setTitle('Start', forState:UIControlStateNormal)
      button.addTarget(self, action:'actionTapped', forControlEvents:UIControlEventTouchUpInside)
      button.frame = [[100, 260], [view.frame.size.width - 200, 40]]
    end
  end

  def actionTapped
    button.addAnimation(
      WiggleAnimation.load, forKey: "wiggle"
    )
  end
end

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = MyController.alloc.init
    rootViewController.title = 'Wiggle'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    true
  end
end