//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport


class DrawingView: UIView {
        
    var numberOfIterations: Int  // default value

    init(frame: CGRect, iterations: Int) {
        self.numberOfIterations = iterations // Assign a value here
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        numberOfIterations = 5
        super.init(coder: coder)

    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
               
        // Drawing code here.
        drawLine(n: numberOfIterations, d1: 0, x1:self.frame.size.height/2, y1:self.frame.size.height/2, dx:self.frame.size.height/3, dy:self.frame.size.height/3);

    }
    
    func drawLine(n: Int, d1: Int, x1:CGFloat, y1:CGFloat, dx:CGFloat, dy:CGFloat){
        // Drawing code here.
        
        if n <= 0 {
            
            let path = UIBezierPath()
            path.move(to: CGPoint(x: x1, y: y1))
            path.addLine(to: CGPoint(x: x1+dx, y: y1+dy))
            path.lineWidth = 1.0
            path.stroke()
            
        } else {
            
            let nx = (dx / 2)
            let ny = (dy / 2)
            let dx2 = -ny + nx
            let dy2 = nx + ny
            
            if d1==0 {
                
                drawLine(n: n-1, d1: 0, x1:x1, y1:y1, dx:dx2, dy:dy2);
                
                let x2 = x1 + dx2;
                let y2 = y1 + dy2;
                
                drawLine(n: n-1, d1: 1, x1:x2, y1:y2, dx:dy2, dy:-dx2);
                
            } else if d1==1 {
                
                drawLine(n: n-1, d1: 0, x1:x1, y1:y1, dx:dy2, dy:-dx2);
                
                let x2 = x1 + dy2;
                let y2 = y1 - dx2;
                
                drawLine(n: n-1, d1: 1, x1:x2, y1:y2, dx:dx2, dy:dy2);
            }
        }
    }
    
}

let view = DrawingView(frame: CGRect(x: 0, y: 0, width: 500, height: 500), iterations: 10)

view.backgroundColor = .white
PlaygroundPage.current.liveView = view

