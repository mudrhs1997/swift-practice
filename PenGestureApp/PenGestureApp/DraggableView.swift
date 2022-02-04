//
//  DraggableView.swift
//  PenGestureApp
//
//  Created by 정명곤 on 2021/12/24.
//

import UIKit

class DraggableView: UIView {
    
    var dragType = DragType.none
    
    init() {
        super.init(frame: CGRect.zero)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(dragging))
        self.addGestureRecognizer(pan)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(dragging))
        self.addGestureRecognizer(pan)
//        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func dragging(pan: UIPanGestureRecognizer) {
        switch pan.state {
        case .began:
            print("began")
        case .changed:
            let delta = pan.translation(in: self.superview)
            var myPosition = self.center
            
            if dragType == .x {
                myPosition.x += delta.x
            } else if dragType == .y {
                myPosition.y += delta.y
            } else {
                myPosition.x += delta.x
                myPosition.y += delta.y
            }
            
            
            self.center = myPosition
            
            pan.setTranslation(CGPoint.zero, in: self.superview)
            
        case .ended, .cancelled:
            print("ended cancelled")
            if self.frame.minX < 0 {
                self.frame.origin.x = 0
            }
            
            if let hasSuperView = self.superview {
                if self.frame.maxX > hasSuperView.frame.maxX {
                    self.frame.origin.x = hasSuperView.frame.maxX - self.bounds.width
                }
                
            }
            
        default:
            break
        }
    }
}
