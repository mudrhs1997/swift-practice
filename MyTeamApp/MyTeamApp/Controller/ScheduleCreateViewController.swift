//
//  CreateTeamViewController.swift
//  MyTeamApp
//
//  Created by 정명곤 on 2022/06/23.
//

import UIKit

class ScheduleCreateViewController: UIViewController {
    
    let dbHelper = DBHelper.shared
    
    
    private let teamNameTextField: UITextField = {
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
    
    private let matchDayField: UITextField = {
        let field = UITextField()
        field.keyboardType = .emailAddress
        field.placeholder = "Match Day"
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
        
        view.addSubview(teamNameTextField)
        view.addSubview(matchDayField)
        view.addSubview(submitButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        teamNameTextField.translatesAutoresizingMaskIntoConstraints = false
        matchDayField.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: teamNameTextField, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 0.7, constant: 0),
            teamNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            teamNameTextField.widthAnchor.constraint(equalToConstant: view.frame.width-40),
            teamNameTextField.heightAnchor.constraint(equalToConstant: 40),
            matchDayField.topAnchor.constraint(equalTo: teamNameTextField.bottomAnchor, constant: 10),
            matchDayField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            matchDayField.widthAnchor.constraint(equalToConstant: view.frame.width-40),
            matchDayField.heightAnchor.constraint(equalToConstant: 40),
            submitButton.topAnchor.constraint(equalTo: matchDayField.bottomAnchor, constant: 40),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.widthAnchor.constraint(equalToConstant: view.frame.width-40),
            submitButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        submitButton.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
        
    }
    
    @objc func didTapSubmitButton() {
        guard let teamName = teamNameTextField.text else { return }
        guard let date = matchDayField.text else { return }
        dbHelper.insertScheduleData(name: teamName, date: date)
        self.navigationController?.popViewController(animated: true)
    }

}
