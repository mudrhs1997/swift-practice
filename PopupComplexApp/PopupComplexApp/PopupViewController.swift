//
//  PopupViewController.swift
//  PopupComplexApp
//
//  Created by 정명곤 on 2022/03/14.
//

import UIKit

class PopupViewController: UIViewController {

    //  view 밖은 선택이 안됨 -> Button을 View 밖에 놓고 정렬한다
    @IBAction func doneAction(_ sender: Any) {
        
        print("press done action")
    }
    
    @IBAction func closePopup(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
