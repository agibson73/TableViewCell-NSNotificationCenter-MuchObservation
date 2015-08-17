

// alex gibson was here




import UIKit

class CircleView: UIView {

    let circleLayer = CAShapeLayer()
    var circleColor : UIColor!
    
    let backGround = CAShapeLayer()
    
    
    var endArc:CGFloat = 0.0{   // in range of 0.0 to 1.0
        didSet{
            setNeedsDisplay()
        }
    }
    var arcWidth:CGFloat = 10.0
    var arcColor = UIColor.redColor()
    var arcBackgroundColor = UIColor.lightGrayColor()
    
    
    
    // Custom CircleView
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        self.layoutIfNeeded()
        
        //Important constants for circle
        let fullCircle = 2.0 * CGFloat(M_PI)
        // let start:CGFloat = -0.25 * fullCircle
        //let end:CGFloat = endArc * fullCircle + start
        
        let start = -90 * CGFloat(M_PI)/180
        let end = -89 * CGFloat(M_PI)/180

        // Use UIBezierPath as an easy way to create the CGPath for the layer.
        // The path should be the entire circle.
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width)/2, startAngle:start, endAngle:end, clockwise: false)
        
        
        
        
        // Setup the CAShapeLayer with the path, colors, and line width
        circleLayer.path = circlePath.CGPath
        circleLayer.fillColor = UIColor.clearColor().CGColor
        circleLayer.strokeColor = arcColor.CGColor
        circleLayer.lineWidth = 10;
        circleLayer.lineCap = kCALineCapRound
        
        // Don't draw the circle initially
        circleLayer.strokeEnd = endArc
        
        // Add the circleLayer to the view's layer's sublayers
        layer.addSublayer(circleLayer)
        
        
        // Setup the CAShapeLayer with the path, colors, and line width
        backGround.path = circlePath.CGPath
        backGround.fillColor = UIColor.clearColor().CGColor
        backGround.strokeColor = arcBackgroundColor.CGColor
        backGround.lineWidth = 10;
        backGround.lineCap = kCALineCapRound
        
        // Don't draw the circle initially
        backGround.strokeEnd = 0
        
        layer.addSublayer(backGround)
        
        
        

    }


    /**
    Animate the Circle
    
    :param: duration  Obviously Time
    :param: fromValue start of Animation
    :param: toValue   strokeEnd of Animation
    */
    func animateCircle(duration: NSTimeInterval, fromValue : Float,toValue : Float) {
        // We want to animate the strokeEnd property of the circleLayer
   
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        // Set the animation duration appropriately
        animation.duration = duration
        
        // Animate from 0 (no circle) to 1 (full circle)
        animation.fromValue = fromValue
        animation.toValue = toValue
        
        // Do a linear animation (i.e. the speed of the animation stays the same)
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        // really this can be bad but I did it anyway
        animation.removedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        // Do the actual animation
        circleLayer.addAnimation(animation, forKey: "animateCircle")
        
        
    }

}
