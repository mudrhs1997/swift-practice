//
//  ViewController.swift
//  CustomSwitchApp
//
//  Created by 정명곤 on 2022/03/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonCenterX: NSLayoutConstraint!
    
    @IBOutlet weak var switchButton: UIButton!
    
    @IBOutlet weak var switchBackground: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        switchButton.layer.cornerRadius = 50 / 2
        switchBackground.layer.cornerRadius = 50 / 2
        switchBackground.backgroundColor = .yellow
    }

    @IBAction func selectedButton(_ sender: Any) {
        
        
        if buttonCenterX.constant == 75 {
            buttonCenterX.constant = -75
            switchBackground.backgroundColor = .lightGray
        } else {
            buttonCenterX.constant = 75
            switchBackground.backgroundColor = .yellow
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}

