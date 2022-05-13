//
//  PaintView.swift
//  Paint
//
//  Created by Zhandos Baimurat on 13.05.2022.
//

import UIKit

@IBDesignable
class PaintView: UIView {
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.darkGray
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Begin")
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Move")
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("End")
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Cancelled")
    }

    override func draw(_ rect: CGRect) {
        self.createCircle()
        UIColor.purple.setStroke()
        path.stroke()
    }
    func createCircle() {
        path = UIBezierPath(ovalIn: self.bounds)
        path.close()
    }
    
    func createRectangle() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: (self.frame.size.width / 2) - (self.frame.size.width / 4), y: (self.frame.size.height / 2) - (self.frame.size.height / 4)))
        path.addLine(to: CGPoint(x: (self.frame.size.width / 2) + (self.frame.size.width / 4), y: (self.frame.size.height / 2) - (self.frame.size.height / 4)))
        path.addLine(to: CGPoint(x: (self.frame.size.width / 2) + (self.frame.size.width / 4), y: (self.frame.size.height / 2) + (self.frame.size.height / 4)))
        path.addLine(to: CGPoint(x: (self.frame.size.width / 2) - (self.frame.size.width / 4), y: (self.frame.size.height / 2) + (self.frame.size.height / 4)))
        path.close()
    }
    
    func createTriangle() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: (self.frame.size.width / 2) - (self.frame.size.width / 4), y: (self.frame.size.height / 2) + (self.frame.size.height / 4)))
        path.addLine(to: CGPoint(x: (self.frame.size.width / 2) + (self.frame.size.width / 4), y: (self.frame.size.height / 2) + (self.frame.size.height / 4)))
        path.addLine(to: CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2))
        path.close()
    }
}
