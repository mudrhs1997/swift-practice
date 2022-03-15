//
//  ViewController.swift
//  PopupComplexApp
//
//  Created by 정명곤 on 2022/03/14.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showPopup(_ sender: Any) {
        
        //  PopupViewController
        let storyBoard = UIStoryboard.init(name: "PopupViewController", bundle: nil)
        
        //  공식처럼 사용함
        let popupVC = storyBoard.instantiateViewController(withIdentifier: "popupVC_ID")
        
        //  외워야 할 메소드
        popupVC.modalPresentationStyle = .overFullScreen
        
        self.present(popupVC, animated: true, completion: nil)
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

