//
//  ScheduleTableViewCell.swift
//  MyTeamApp
//
//  Created by 정명곤 on 2022/06/15.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    static let identifier = "ScheduleTableViewCell"
    
    let teamImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 15
        image.layer.masksToBounds = true
        return image
    }()
    
    let teamLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private func setLayout() {
        addSubview(teamImage)
        addSubview(teamLabel)
        addSubview(timeLabel)
        
        teamImage.translatesAutoresizingMaskIntoConstraints = false
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            teamImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            teamImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            teamImage.widthAnchor.constraint(equalToConstant: 30),
            teamImage.heightAnchor.constraint(equalToConstant: 30),
            teamLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            teamLabel.widthAnchor.constraint(equalToConstant: 100),
            teamLabel.leadingAnchor.constraint(equalTo: teamImage.trailingAnchor, constant: 20),
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            timeLabel.leadingAnchor.constraint(equalTo: teamLabel.trailingAnchor, constant: 20),
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
