//
//  ViewController.swift
//  FloatingButtonApp
//
//  Created by 정명곤 on 2022/03/08.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    //  화면 전환할 때에 사용할 수 있는 설정
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPopup" {
            let popupVC = segue.destination as! PopupViewController
            
            //  백그라운드 투명하게 만들기 위한 설정
            popupVC.modalPresentationStyle = .overFullScreen
            
            
        }
    }
    
}

