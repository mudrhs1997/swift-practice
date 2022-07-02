//
//  StatsViewController.swift
//  MyTeamApp
//
//  Created by 정명곤 on 2022/06/15.
//

import UIKit

class StatsViewController: UIViewController {
    
    let dbHelper = DBHelper.shared
    var StatsArray: [Stats] = []
    var teamInfo: Team?
    
    private let statTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(StatsTableViewCell.self, forCellReuseIdentifier: StatsTableViewCell.identifier)
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(statTableView)
        
        statTableView.delegate = self
        statTableView.dataSource = self

        let headerView = StatsHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 30))
        statTableView.tableHeaderView = headerView
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addStatsButton))
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        statTableView.frame = view.bounds
        
        statTableView.rowHeight = UITableView.automaticDimension
        statTableView.estimatedRowHeight = UITableView.automaticDimension

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         
        StatsArray = dbHelper.readStatsData()
        statTableView.reloadData()
        
    }
    
    @objc func addStatsButton() {
        dbHelper.createStatTable()
        let vc = StatsAddViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

extension StatsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.StatsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StatsTableViewCell.identifier, for: indexPath) as? StatsTableViewCell else {
            fatalError()
        }
        cell.nameLabel.text = String(StatsArray[indexPath.row].name)
        cell.goalsLabel.text = String(StatsArray[indexPath.row].goals)
        cell.assistsLabel.text = String(StatsArray[indexPath.row].assists)
        cell.gamesLabel.text = String(StatsArray[indexPath.row].games)
        cell.pointsLabel.text = String(StatsArray[indexPath.row].goals+StatsArray[indexPath.row].assists)
        
                
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = EditStatViewController()
        vc.name = String(StatsArray[indexPath.row].name)
        self.present(vc, animated: true)

//        dbHelper.deleteStat(name: String(StatsArray[indexPath.row].name))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
