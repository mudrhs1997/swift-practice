//
//  ViewController.swift
//  ExpandCellLabelApp
//
//  Created by 정명곤 on 2022/03/07.
//

import UIKit

class ExpandCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    /*
     필요한 텍스트가 포함되어야 함.
     expand 상태
     */
    
    //  Model
    struct ExpandDataModel {
        var description: String
        var isExpand: Bool
    }
    
    var dataModels = [ExpandDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textArray = ["Short Text",
                         "long long long long long long long long long long long long long long long",
                         "Short Text", "long long long long long long long long long long long long long long long",
                         "Short Text",
                         "long long long long long long long long long long long long long long long"]
        
        for (_, value) in textArray.enumerated() {
            
            dataModels.append(ExpandDataModel.init(description: value, isExpand: false))
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandCell", for: indexPath) as! ExpandCell
        
        cell.descriptionLabel.text = dataModels[indexPath.row].description
        
        if dataModels[indexPath.row].isExpand == true {
            cell.descriptionLabel.numberOfLines = 0 //  0일 때에 모든 요소 보여줌
        } else {
            cell.descriptionLabel.numberOfLines = 1
        }
        
        //  클릭했을 때의 색깔 등
        cell.selectionStyle = .none
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //  bool값 바꿔주기
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        
        //  1. heightForRowAt 에서 정확한 높이를 지정
        //  2. tableview.reloadDate() -> 어느정도 해결
        //  3. tableView.estimatedSectionHeaderHeight = 0
        //     tableView.estimatedSectionFooterHeight = 0
        //  4. 애니메이션 효과 없애기 -> 확실히 해결 ( .setanimationsEnabled )
        //        UIView.setAnimationsEnabled(false)
        //        tableView.reloadRows(at: [indexPath], with: .none) -> 화면 자동 갱신
        //        UIView.setAnimationsEnabled(true)   //  리로드 후 반드시 true 바꿔줘야 함. 바꾸지 않으면 애니메이션 x
        
        
        
        
        //  퍼포먼스적인 부분 일부 해결
        tableView.reloadData()
        
    }
    



}

