//
//  TeamSelectViewController.swift
//  MyTeamApp
//
//  Created by 정명곤 on 2022/06/14.
//

import UIKit

class TeamSelectViewController: UIViewController {
    
    var teamArray: [Team] = []
    var user_id = ""
    
    let dbHelper = DBHelper.shared
    
    private let selectTeamTableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TeamSelectTableViewCell.self, forCellReuseIdentifier: "TeamSelectTableViewCell")
        
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Select Team"
        view.backgroundColor = .systemBackground
        
        view.addSubview(selectTeamTableView)
        
        selectTeamTableView.dataSource = self
        selectTeamTableView.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTeamButton))
        
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.hidesBackButton = true
        
        teamArray = dbHelper.readTeamData()
        selectTeamTableView.reloadData()
        
    }
    
    
    override func viewDidLayoutSubviews() {
        
        NSLayoutConstraint.activate([
            selectTeamTableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            selectTeamTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            selectTeamTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            selectTeamTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
        ])
        
        selectTeamTableView.rowHeight = UITableView.automaticDimension
        selectTeamTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    @objc func addTeamButton() {
        dbHelper.createTeamTable()
        dbHelper.createUserTeamTable()
        
        let vc = CreateTeamViewController()
        vc.user_id = user_id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    

}

extension TeamSelectViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.teamArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let teamVC = HomeViewController()

        teamVC.teamInfo = teamArray[indexPath.row]
        teamVC.modalPresentationStyle = .fullScreen

        self.present(teamVC, animated: true, completion: nil)
//        dbHelper.deleteTeam(name: String(teamArray[indexPath.row].name))
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TeamSelectTableViewCell", for: indexPath) as? TeamSelectTableViewCell else { fatalError() }
        
        cell.teamImage.image = UIImage(named: String(teamArray[indexPath.row].image))
        cell.teamNameLabel.text = String(teamArray[indexPath.row].name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
