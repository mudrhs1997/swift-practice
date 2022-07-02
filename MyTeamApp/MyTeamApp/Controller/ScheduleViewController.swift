//
//  ScheduleViewController.swift
//  MyTeamApp
//
//  Created by 정명곤 on 2022/06/15.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    var scheduleArray: [Schedule] = []
    var teamInfo: Team?
    let dbHelper = DBHelper.shared
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ScheduleTableViewCell.self, forCellReuseIdentifier: ScheduleTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        dbHelper.createScheduleTable()
        scheduleArray = dbHelper.readScheduleData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.frame = view.bounds
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addScheduleButton))
        tableView.refreshControl = UIRefreshControl()
        
        tableView.refreshControl?.addTarget(self, action: #selector(pullToRefresh(_:)), for: .valueChanged)
    }
    
    @objc func addScheduleButton() {
        dbHelper.createStatTable()
        let vc = ScheduleCreateViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func pullToRefresh(_ sender: Any) {
        scheduleArray = dbHelper.readScheduleData()
        tableView.reloadData()
    }
}

extension ScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.scheduleArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dbHelper.deleteSchedule(name: String(scheduleArray[indexPath.row].OpponentName))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleTableViewCell.identifier, for: indexPath) as? ScheduleTableViewCell else {
            fatalError()
        }
        
        cell.teamLabel.text = String(scheduleArray[indexPath.row].OpponentName)
        cell.timeLabel.text = String(scheduleArray[indexPath.row].date)
        
        return cell
    }
    
    
}
