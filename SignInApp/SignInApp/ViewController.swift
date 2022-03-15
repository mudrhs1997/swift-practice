//
//  ViewController.swift
//  SignInApp
//
//  Created by 정명곤 on 2022/03/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailError: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordError: UILabel!
    
    var emailErrorHeight: NSLayoutConstraint!
    var passwordErrorHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //  textfield 값이 변경되는 것을 캐치하는 게 없음
        
        emailTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        
        emailErrorHeight = emailError.heightAnchor.constraint(equalToConstant: 0)
        emailErrorHeight.isActive = true
        
        
        passwordErrorHeight = passwordError.heightAnchor.constraint(equalToConstant: 0)
        passwordErrorHeight.isActive = true
        
        
        
    }
    
    @objc func textFieldEdited(textField: UITextField) {
        
        if textField == emailTextField {
            print("\(textField.text!)")
            
            if isValidEmail(testStr: textField.text!) == true {
                //  에러표시가 나오지 않아야 함
                emailErrorHeight.isActive = true
            } else {
                emailErrorHeight.isActive = false
            }
            
        } else if textField == passwordTextField {
            print("\(textField.text!)")
            
            if isValidPassword(pw: textField.text!) == true {
                passwordErrorHeight.isActive = true
            } else {
                passwordErrorHeight.isActive = false
            }
        }
        
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    //  정규식 - regular expression
    func isValidEmail(testStr:String) -> Bool {
        
           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
           let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
           return emailTest.evaluate(with: testStr)
    }
    
    func isValidPassword(pw: String?) -> Bool {
        
        if let hasPassword = pw {
            if hasPassword.count < 8 {
                return false
            }
        }
        return true
    }
}

