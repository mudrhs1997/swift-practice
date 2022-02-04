//
//  ViewController.swift
//  PenGestureApp
//
//  Created by 정명곤 on 2021/12/24.
//

import UIKit

enum DragType {
    case x
    case y
    case none
}

class ViewController: UIViewController {
    
    var dragType = DragType.none
    let myView = DraggableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        myView.center = self.view.center
//        myView.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
//        myView.dragType = .x
//        myView.backgroundColor = .red
//
//        self.view.addSubview(myView)
    }

    @IBAction func selectPanType(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            dragType = .x
        case 1:
            dragType = .y
        case 2:
            dragType = .none
        default:
            break
        }
        
        myView.dragType = self.dragType
    }
    

}

