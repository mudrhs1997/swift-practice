//
//  ViewController.swift
//  DBtest
//
//  Created by 정명곤 on 2022/05/10.
//

import UIKit

class ViewController: UIViewController {
    
    var dataArray: [Model] = []
    
    let dbHelper = DBHelper.shared
    
    private let createButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    private let insertButton: UIButton = {
        let button = UIButton()
        button.setTitle("Insert", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    private let updateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Update", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    private let deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()

    private let customTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.dataArray = dbHelper.readData()
        customTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DBTest"
        view.backgroundColor = .systemBackground
        
        customTableView.delegate = self
        customTableView.dataSource = self
        
        customTableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        view.addSubview(createButton)
        view.addSubview(insertButton)
        view.addSubview(updateButton)
        view.addSubview(deleteButton)
        view.addSubview(customTableView)
        
        
        
        customTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([customTableView.topAnchor.constraint(equalTo: createButton.bottomAnchor),
                                     customTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                                     customTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     customTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)])
        
        customTableView.rowHeight = UITableView.automaticDimension
        customTableView.estimatedRowHeight = UITableView.automaticDimension
        
        
        createButton.addTarget(self, action: #selector(didTapCreateButton), for: .touchUpInside)
        insertButton.addTarget(self, action: #selector(didTapInsertButton), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        createButton.frame = CGRect(x: 0, y: view.safeAreaInsets.top + 10, width: view.frame.width/4, height: 30)
        insertButton.frame = CGRect(x: createButton.frame.width, y: view.safeAreaInsets.top + 10, width: view.frame.width/4, height: 30)
        updateButton.frame = CGRect(x: insertButton.frame.minX+insertButton.frame.width , y: view.safeAreaInsets.top + 10, width: view.frame.width/4, height: 30)
        deleteButton.frame = CGRect(x: updateButton.frame.minX+updateButton.frame.width, y: view.safeAreaInsets.top+10, width: view.frame.width/4, height: 30)
        
        
    }

    @objc func didTapCreateButton(){
        dbHelper.createTable()
        
        self.dataArray = dbHelper.readData()
        
        
        self.customTableView.reloadData()
    }
    
    @objc func didTapInsertButton(){
        let vc = InsertViewController()
        
        DispatchQueue.main.async {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
        else { fatalError() }
        
        cell.idLabel.text = String(dataArray[indexPath.row].id)
        cell.nameLabel.text = String(dataArray[indexPath.row].name)
        if let age = dataArray[indexPath.row].age {
            cell.ageLabel.text = String(age)
        }
        cell.deleteButton.backgroundColor = .green
        
        
        
        return cell
    }
    
    
    
}
