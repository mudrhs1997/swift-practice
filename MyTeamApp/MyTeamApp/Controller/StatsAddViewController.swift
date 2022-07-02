//
//  CreateTeamViewController.swift
//  MyTeamApp
//
//  Created by 정명곤 on 2022/06/23.
//

import UIKit

class StatsAddViewController: UIViewController {
    
    let dbHelper = DBHelper.shared
    var team_name = ""
    
    
    //  Email textField
    private let playerNameTextField: UITextField = {
       let field = UITextField()
        field.keyboardType = .emailAddress
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
        view.backgroundColor = .systemBackground
        
        view.addSubview(playerNameTextField)
        view.addSubview(submitButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        playerNameTextField.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: playerNameTextField, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0),
            playerNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playerNameTextField.widthAnchor.constraint(equalToConstant: view.frame.width-40),
            playerNameTextField.heightAnchor.constraint(equalToConstant: 40),
            submitButton.topAnchor.constraint(equalTo: playerNameTextField.bottomAnchor, constant: 40),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.widthAnchor.constraint(equalToConstant: view.frame.width-40),
            submitButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        submitButton.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
        
    }
    
    @objc func didTapSubmitButton() {
        guard let teamName = playerNameTextField.text else { return }
        dbHelper.insertStatData(name: teamName)
    }

}
