//
//  MyIDViewController.swift
//  Setting_Clone_App
//
//  Created by 정명곤 on 2021/12/24.
//

import UIKit

class MyIDViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.isEnabled = false
        }
    }
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func doCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        

    }

    @objc func textFieldDidChange(sender: UITextField) {
        
        if sender.text?.isEmpty == true {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
    }
}
