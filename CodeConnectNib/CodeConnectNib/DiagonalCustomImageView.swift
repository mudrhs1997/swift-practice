//
//  DiagonalCustomImageView.swift
//  CodeConnectNib
//
//  Created by 정명곤 on 2022/03/14.
//

import UIKit


//  외워야 할 어노테이션 ( 스토리보드와 연동 )
@IBDesignable
class DiagonalCustomImageView: UIImageView {

    //  대각선으로 잘린 사각형을 그린다.
    //  bezierPath
    
    //  path -> layer
    
    //  layer -> mask
    
    //  내가 만든 커스텀 코드 -> storyboard 연동
    
    //  스토리보드에서 변경할 수 있도록 함
    @IBInspectable var innerHeight: CGFloat = 0
    
    func makePath() -> UIBezierPath {
        let path = UIBezierPath()
        
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: 0))
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint.init(x: 0, y: self.bounds.height - innerHeight))
        path.close()
        
        return path
    }
    
    func pathToLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = makePath().cgPath
        
        return shapeLayer
    }
    
    func makeMask() {
        self.layer.mask = pathToLayer()
    }
    
    //  해당 오브젝트가 그려질 때
    override func layoutSubviews() {
        makeMask()
    }

}
