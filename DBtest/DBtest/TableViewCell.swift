//
//  TableViewCell.swift
//  DBtest
//
//  Created by 정명곤 on 2022/05/10.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let dbHelper = DBHelper.shared
    
    let idLabel: UILabel = UILabel()
    let ageLabel: UILabel = UILabel()
    let nameLabel: UILabel = UILabel()
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("X", for: .normal)
        return button
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    private func setConstraint(){
        addSubview(idLabel)
        addSubview(nameLabel)
        addSubview(ageLabel)
        addSubview(deleteButton)
        
        nameLabel.textColor = .systemBlue
        
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            idLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            idLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            idLabel.widthAnchor.constraint(equalToConstant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: idLabel.leadingAnchor, constant: 30),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalToConstant: 100),
            ageLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 30),
            ageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            ageLabel.widthAnchor.constraint(equalToConstant: 50),
            ageLabel.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: -30),
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            deleteButton.widthAnchor.constraint(equalToConstant: 30),
            deleteButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
