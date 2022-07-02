//
//  StatsHeaderUIView.swift
//  MyTeamApp
//
//  Created by 정명곤 on 2022/06/22.
//

import UIKit

class StatsHeaderUIView: UIView {

    private let rankLabel: UILabel = {
        let label = UILabel()
        label.text = "순위"
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "선수"
        return label
    }()
    
    private let gamesLabel: UILabel = {
        let label = UILabel()
        label.text = "경기수"
        return label
    }()
    
    private let goalsLabel: UILabel = {
        let label = UILabel()
        label.text = "득점"
        return label
    }()
    
    private let assistsLabel: UILabel = {
        let label = UILabel()
        label.text = "도움"
        return label
    }()
    
    private let pointsLabel: UILabel = {
        let label = UILabel()
        label.text = "공격포인트"
        return label
    }()
    
    private func setLayout() {
        
        addSubview(rankLabel)
        addSubview(nameLabel)
        addSubview(gamesLabel)
        addSubview(goalsLabel)
        addSubview(assistsLabel)
        addSubview(pointsLabel)
        
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        gamesLabel.translatesAutoresizingMaskIntoConstraints = false
        goalsLabel.translatesAutoresizingMaskIntoConstraints = false
        assistsLabel.translatesAutoresizingMaskIntoConstraints = false
        rankLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        

        NSLayoutConstraint.activate([
            rankLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            rankLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: rankLabel.trailingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            gamesLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            gamesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            goalsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            goalsLabel.trailingAnchor.constraint(equalTo: assistsLabel.leadingAnchor, constant: -10),
            assistsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            assistsLabel.trailingAnchor.constraint(equalTo: pointsLabel.leadingAnchor, constant: -10),
            pointsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            pointsLabel.trailingAnchor.constraint(equalTo: gamesLabel.leadingAnchor, constant: -10)
        ])

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray3
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
