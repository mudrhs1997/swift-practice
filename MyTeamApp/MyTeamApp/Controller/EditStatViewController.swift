//
//  CreateTeamViewController.swift
//  MyTeamApp
//
//  Created by 정명곤 on 2022/06/23.
//

import UIKit

class EditStatViewController: UIViewController {
    
    let dbHelper = DBHelper.shared
    var name = ""
    
    private let goalsTextField: UITextField = {
       let field = UITextField()
        field.keyboardType = .numberPad
        field.placeholder = "goals"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 50))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = 8
        field.layer.masksToBounds = true
        return field
    }()
    
    private let assistsTextField: UITextField = {
       let field = UITextField()
        field.keyboardType = .numberPad
        field.placeholder = "assists"
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 50))
        field.leftViewMode = .always
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = 8
        field.layer.masksToBounds = true
        return field
    }()
    
    private let gamesTextField: UITextField = {
       let field = UITextField()
        field.keyboardType = .numberPad
        field.placeholder = "games"
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
        
        view.addSubview(goalsTextField)
        view.addSubview(assistsTextField)
        view.addSubview(gamesTextField)
        view.addSubview(submitButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        goalsTextField.translatesAutoresizingMaskIntoConstraints = false
        assistsTextField.translatesAutoresizingMaskIntoConstraints = false
        gamesTextField.translatesAutoresizingMaskIntoConstraints = false
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: goalsTextField, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 0.3, constant: 0),
            goalsTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goalsTextField.widthAnchor.constraint(equalToConstant: view.frame.width-40),
            goalsTextField.heightAnchor.constraint(equalToConstant: 40),
            assistsTextField.topAnchor.constraint(equalTo: goalsTextField.bottomAnchor, constant: 10),
            assistsTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            assistsTextField.widthAnchor.constraint(equalToConstant: view.frame.width-40),
            assistsTextField.heightAnchor.constraint(equalToConstant: 40),
            gamesTextField.topAnchor.constraint(equalTo: assistsTextField.bottomAnchor, constant: 10),
            gamesTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gamesTextField.widthAnchor.constraint(equalToConstant: view.frame.width-40),
            gamesTextField.heightAnchor.constraint(equalToConstant: 40),
            submitButton.topAnchor.constraint(equalTo: gamesTextField.bottomAnchor, constant: 10),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.widthAnchor.constraint(equalToConstant: view.frame.width-40),
            submitButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        submitButton.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
        
    }
    
    @objc func didTapSubmitButton() {
        guard let goals = goalsTextField.text else { return }
        guard let assists = assistsTextField.text else { return }
        guard let games = gamesTextField.text else { return }
        dbHelper.updateStatsData(name: self.name, goals: Int(goals)!, assists: Int(assists)!, games: Int(games)!)
    }

}
