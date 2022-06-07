//
//  CreateViewController.swift
//  DBtest
//
//  Created by 정명곤 on 2022/05/10.
//

import UIKit

class InsertViewController: UIViewController, UITextFieldDelegate {
    
    let dbHelper = DBHelper.shared
    
    let tableview = ViewController()
    
    private let nameField: UITextField = {
       let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.leftViewMode = .always
        field.placeholder = "이름"
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = 8
        field.layer.masksToBounds = true
        return field
    }()
    
    private let ageField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.keyboardType = .numberPad
        field.autocorrectionType = .no
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.leftViewMode = .always
        field.placeholder = "나이"
        field.backgroundColor = .secondarySystemBackground
        field.layer.cornerRadius = 8
        field.layer.masksToBounds = true
        return field
    }()
     
    private let createButton: UIButton = {
       let button = UIButton()
        button.setTitle("Create", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.backgroundColor = .systemGray
        button.isEnabled = false
        return button
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ageField.delegate = self
        
        title = "Create"
        view.backgroundColor = .systemBackground
        
        
        
        makeSubView()
        // Do any additional setup after loading the view.
    }
    
    
    
    func makeSubView() {
        view.addSubview(nameField)
        view.addSubview(ageField)
        view.addSubview(createButton)
        
        nameField.translatesAutoresizingMaskIntoConstraints = false
        ageField.translatesAutoresizingMaskIntoConstraints = false
        createButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nameField.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            nameField.heightAnchor.constraint(equalToConstant: 50),
            ageField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            ageField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            ageField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
            ageField.heightAnchor.constraint(equalToConstant: 50),
            createButton.topAnchor.constraint(equalTo: ageField.bottomAnchor, constant: 100),
            createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            createButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        createButton.addTarget(self, action: #selector(didTapCreateButton), for: .touchDown)
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.location == 0 && range.length != 0 {
            self.createButton.isEnabled = false
            createButton.backgroundColor = .systemGray
        } else {
            self.createButton.isEnabled = true
            createButton.backgroundColor = .systemMint
        }
        
        print(textField.text!)
        
        return true
    }
    
    @objc func didTapCreateButton() {
        
        
        
        guard let nameData = nameField.text else { return }
        guard let ageData = ageField.text else { return }
        
        
        dbHelper.insertData(name: nameData, age: Int(ageData)!)
        
        dbHelper.readData()
        
        
        dismiss(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
