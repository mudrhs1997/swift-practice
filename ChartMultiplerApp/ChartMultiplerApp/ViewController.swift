//
//  ViewController.swift
//  ChartMultiplerApp
//
//  Created by 정명곤 on 2022/03/13.
//

import UIKit


extension NSLayoutConstraint {
    func changeMultiplier(value: CGFloat) -> NSLayoutConstraint{
        
        NSLayoutConstraint.deactivate([self])
        
        let newLayoutConstraint = NSLayoutConstraint.init(item: self.firstItem, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: value, constant: self.constant)
        
        newLayoutConstraint.priority = self.priority
        newLayoutConstraint.shouldBeArchived = self.shouldBeArchived
        newLayoutConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newLayoutConstraint])
        
        return newLayoutConstraint
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var graph1Height: NSLayoutConstraint!
    @IBOutlet weak var graph2Height: NSLayoutConstraint!
    @IBOutlet weak var graph3Height: NSLayoutConstraint!
    @IBOutlet weak var graph4Height: NSLayoutConstraint!
    @IBOutlet weak var graph5Height: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    @IBAction func style1(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5) {
            self.graph1Height =  self.graph1Height.changeMultiplier(value: 0.7)
            self.graph2Height =  self.graph2Height.changeMultiplier(value: 0.6)
            self.graph3Height =  self.graph3Height.changeMultiplier(value: 0.5)
            self.graph4Height =  self.graph4Height.changeMultiplier(value: 0.9)
            self.graph5Height =  self.graph5Height.changeMultiplier(value: 0.8)
            
            
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func style2(_ sender: Any) {
        graph1Height =  graph1Height.changeMultiplier(value: 0.9)
        graph2Height =  graph2Height.changeMultiplier(value: 0.8)
        graph3Height =  graph3Height.changeMultiplier(value: 0.7)
        graph4Height =  graph4Height.changeMultiplier(value: 0.6)
        graph5Height =  graph5Height.changeMultiplier(value: 0.5)
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }


}

