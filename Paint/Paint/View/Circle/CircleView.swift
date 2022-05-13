//
//  CustomView.swift
//  Paint
//
//  Created by Zhandos Baimurat on 13.05.2022.
//

import UIKit

class CustomView: UIView {
    
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
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
}
