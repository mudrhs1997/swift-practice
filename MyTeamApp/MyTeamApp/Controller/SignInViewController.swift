//
//  SignInViewController.swift
//  MyTeamApp
//
//  Created by 정명곤 on 2022/06/04.
//

import UIKit

class SignInViewController: UIViewController {
    
    var userArray: [User] = []
    
    let dbHelper = DBHelper.shared
    
    // Email TextField
    private let emailTextField: UITextField = {
        let field = UITextField()
        field.keyboardType = .emailAddress
        field.autocapitalizationType = .none
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.leftViewMode = .always
        field.placeholder = "Email Address"
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = 8
        field.layer.masksToBounds = true
        return field
    }()
    
    // Password Text View
    private let passwordTextField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.leftViewMode = .always
        field.placeholder = "Password"
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = 8
        field.layer.masksToBounds = true
        return field
    }()
    
    // Sign in Button
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    
    // Sign up Button
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.backgroundColor = .systemGray2
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "로그인"
        view.backgroundColor = .systemBackground
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        
        signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        userArray = dbHelper.readUserData()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: emailTextField, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 0.5, constant: 0),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: view.frame.width-40),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width-40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalToConstant: view.frame.width-40),
            signInButton.heightAnchor.constraint(equalToConstant: 40),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 10),
            signUpButton.widthAnchor.constraint(equalToConstant: view.frame.width-40),
            signUpButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func didTapSignUpButton() {
        let vc = SignUpViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func didTapSignInButton() {
        let vc = TeamSelectViewController()
        guard let id = emailTextField.text else { return }
        vc.user_id = id
        
        if loginCheck(id: emailTextField.text!, pwd: passwordTextField.text!) {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func loginCheck(id: String, pwd: String) -> Bool {
        for user in userArray {
            if user.id == id && user.password == pwd {
                return true
            }
        }
        return false
    }

}
