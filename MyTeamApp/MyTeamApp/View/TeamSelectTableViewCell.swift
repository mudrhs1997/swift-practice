//
//  TeamSelectTableViewCell.swift
//  MyTeamApp
//
//  Created by 정명곤 on 2022/06/14.
//

import UIKit

class TeamSelectTableViewCell: UITableViewCell {
    
    // Team Image
    let teamImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "swift")
        image.layer.cornerRadius = 25
        image.layer.masksToBounds = true
        return image
    }()
    
    //  Team Name
    let teamNameLabel: UILabel = {
       let label = UILabel()
        label.text = "팀 이름"
        return label
    }()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func setConstraints() {
        
        addSubview(teamImage)
        addSubview(teamNameLabel)
        
        
        teamImage.translatesAutoresizingMaskIntoConstraints = false
        teamNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            teamImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            teamImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            teamImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            teamImage.widthAnchor.constraint(equalToConstant: 50),
            teamImage.heightAnchor.constraint(equalToConstant: 50),
            teamNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            teamNameLabel.leadingAnchor.constraint(equalTo: teamImage.trailingAnchor, constant: 15),
            teamNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            teamNameLabel.heightAnchor.constraint(equalToConstant: 30),
            teamNameLabel.widthAnchor.constraint(equalToConstant: 100)
            
        ])
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
