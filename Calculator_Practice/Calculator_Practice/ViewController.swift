//
//  ViewController.swift
//  Calculator_Practice
//
//  Created by 정명곤 on 2022/03/04.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayLabel.layer.cornerRadius = 50
        displayLabel.layer.masksToBounds = true //  cornerRadius를 주고 남은 부분 삭제
        
//        displayLabel.clipsToBounds = true   //  cornerRadius를 주고 남은 부분 삭제 ( masksToBounds 와 비슷 )
        
        
        
    }
    
    // viewDidApper은 계층적을 완성되고 나서의 뷰를 그리기 때문에 stackView같은 하위뷰들을 그릴 때에는 viewDidAppear에서 그린다.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        // 완벽한 원을 그리기 위해서는 해당 뷰가 정사각형이라는 조건이 필요하다. 하지만 오토레이아웃을 적용하면 디바이스마다 뷰의 크기가 달라질 수 있기 때문에, 그것도 고려해서 constraints(Aspect Ratio)를 줘야함.
        button1.layer.cornerRadius = button1.bounds.width / 2
        button2.layer.cornerRadius = button1.bounds.width / 2
        button3.layer.cornerRadius = button1.bounds.width / 2
        button4.layer.cornerRadius = button1.bounds.width / 2
        button5.layer.cornerRadius = button1.bounds.width / 2
        button6.layer.cornerRadius = button1.bounds.width / 2
        button7.layer.cornerRadius = button1.bounds.width / 2
        button8.layer.cornerRadius = button1.bounds.width / 2
        button9.layer.cornerRadius = button1.bounds.width / 2
        button10.layer.cornerRadius = button1.bounds.height / 2
        button11.layer.cornerRadius = button1.bounds.width / 2
        
    }
    
    
    @IBAction func buttonAction(_ sender: Any) {
        displayLabel.text = "press 1"
        print("pressed button")
        
    }
    

}

