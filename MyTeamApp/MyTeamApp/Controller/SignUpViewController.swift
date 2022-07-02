//
//  SignUpViewController.swift
//  MyTeamApp
//
//  Created by 정명곤 on 2022/06/04.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let dbHelper = DBHelper.shared
    
    //  Email textField
    private let emailTextField: UITextField = {
       let field = UITextField()
        field.keyboardType = .emailAddress
        field.placeholder = "Email Address"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 50))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = 8
        field.layer.masksToBounds = true
        return field
    }()
    
    //  Email Error Label
    private let emailErrorLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 형식에 맞지 않습니다"
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.textColor = .systemRed
        return label
    }()
    
    var emailErrorHeight: NSLayoutConstraint!
    
    
    //  Password textField
    private let passwordTextField: UITextField = {
       let field = UITextField()
        field.placeholder = "Password"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 50))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = 8
        field.layer.masksToBounds = true
        field.textContentType = .oneTimeCode
        
        return field
    }()
    
    //  Password Error Label
    private let passwordErrorLabel: UILabel = {
        let label = UILabel()
        label.text = "8자 이상 입력해주세요"
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.textColor = .systemRed
        return label
    }()
    
    var passwordErrorHeight: NSLayoutConstraint!
    
    //  Name TextField
    private let nameTextField: UITextField = {
       let field = UITextField()
        field.placeholder = "Name"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 50))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = 8
        field.layer.masksToBounds = true
        return field
    }()
    
    //  Submit Button
    private let submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = .link
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "회원가입"
        view.backgroundColor = .systemBackground
        
        
        view.addSubview(emailTextField)
        view.addSubview(emailErrorLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordErrorLabel)
        view.addSubview(nameTextField)
        view.addSubview(submitButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailErrorLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordErrorLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: emailTextField, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 0.5, constant: 0),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: view.frame.width-40),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            NSLayoutConstraint(item: emailErrorLabel, attribute: .leading, relatedBy: .equal, toItem: emailTextField, attribute: .leading, multiplier: 1, constant: 10),
            emailErrorLabel.widthAnchor.constraint(equalToConstant: view.frame.width-40),
            emailErrorLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5),
            passwordTextField.topAnchor.constraint(equalTo: emailErrorLabel.bottomAnchor, constant: 10),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width-40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordErrorLabel.widthAnchor.constraint(equalToConstant: view.frame.width-40),
            passwordErrorLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5),
            NSLayoutConstraint(item: passwordErrorLabel, attribute: .leading, relatedBy: .equal, toItem: passwordTextField, attribute: .leading, multiplier: 1, constant: 10),
            nameTextField.topAnchor.constraint(equalTo: passwordErrorLabel.bottomAnchor, constant: 10),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.widthAnchor.constraint(equalToConstant: view.frame.width-40),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            submitButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 40),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.widthAnchor.constraint(equalToConstant: view.frame.width-40),
            submitButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        submitButton.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
        emailTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        
        emailErrorHeight = emailErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        emailErrorHeight.isActive = true
        
        passwordErrorHeight = passwordErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        passwordErrorHeight.isActive = true
        
        submitButton.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
        
    }
    
    
    @objc func didTapSubmitButton() {
        guard let idData = emailTextField.text else { return }
        guard let passwordData = passwordTextField.text else { return }
        guard let nameData = nameTextField.text else { return }
        
        dbHelper.createUserTable()
        
        dbHelper.insertUserData(id: idData, password: passwordData, name: nameData)
        
        
    }
    
    @objc func textFieldEdited(textField: UITextField) {
        
        if textField == emailTextField {
            
            if isValidEmail(testStr: textField.text!) == true {
                emailErrorHeight.isActive = true
            } else {
                emailErrorHeight.isActive = false
            }
        } else if textField == passwordTextField {
            
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
    
    func isValidEmail(testStr: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
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
