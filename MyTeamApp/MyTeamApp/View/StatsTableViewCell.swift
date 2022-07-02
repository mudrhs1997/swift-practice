//
//  StatsTableViewCell.swift
//  MyTeamApp
//
//  Created by 정명곤 on 2022/06/15.
//

import UIKit

class StatsTableViewCell: UITableViewCell {
    static let identifier = "StatsTableViewCell"
    
     let rankLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        return label
    }()
    
     let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
     let gamesLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    let goalsLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let assistsLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let pointsLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setLayout() {
        addSubview(rankLabel)
        addSubview(nameLabel)
        addSubview(gamesLabel)
        addSubview(goalsLabel)
        addSubview(assistsLabel)
        addSubview(pointsLabel)
        
        rankLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        gamesLabel.translatesAutoresizingMaskIntoConstraints = false
        goalsLabel.translatesAutoresizingMaskIntoConstraints = false
        assistsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        

        NSLayoutConstraint.activate([
            rankLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            rankLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: rankLabel.trailingAnchor, constant: 40),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            gamesLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            gamesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            goalsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            goalsLabel.trailingAnchor.constraint(equalTo: assistsLabel.leadingAnchor, constant: -40),
            assistsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            assistsLabel.trailingAnchor.constraint(equalTo: pointsLabel.leadingAnchor, constant: -50),
            pointsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            pointsLabel.trailingAnchor.constraint(equalTo: gamesLabel.leadingAnchor, constant: -60)
        ])

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
