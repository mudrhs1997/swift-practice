//
//  PopupViewController.swift
//  FloatingButtonApp
//
//  Created by 정명곤 on 2022/03/08.
//

import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var button1: NSLayoutConstraint!
    @IBOutlet weak var button2: NSLayoutConstraint!
    @IBOutlet weak var button3: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        button1.constant = 0
        button2.constant = 0
        button3.constant = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            
            self.button1.constant = 180
            self.button2.constant = 120
            self.button3.constant = 60
            
            
            //  꼭 해야 화면이 갱신됨 ( 지정된 시간만큼 )
            self.view.layoutIfNeeded()
            
        } completion: { completion in
            //  애니메이션 끝나는 시점.
        }

    }
    
    @IBAction func dismissPopup(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            
            self.button1.constant = 0
            self.button2.constant = 0
            self.button3.constant = 0
            
            
            //  꼭 해야 화면이 갱신됨 ( 지정된 시간만큼 )
            self.view.layoutIfNeeded()
            
        } completion: { completion in
            //  애니메이션 끝나는 시점.
            
            self.dismiss(animated: false, completion: nil)
            
        }
        
    }
    
}
