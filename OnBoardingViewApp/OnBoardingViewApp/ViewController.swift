//
//  ViewController.swift
//  OnBoardingViewApp
//
//  Created by 정명곤 on 2021/12/27.
//

import UIKit

class ViewController: UIViewController {
    
    var didShowOnboardingView = false   // OnboardingView 초기값 설정 -> 앱 최초 실행시만 나타나도록 하기 위해

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if didShowOnboardingView == false {
            didShowOnboardingView = true
            let pageVC = OnBoardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
            
            pageVC.modalPresentationStyle = .fullScreen
            
            self.present(pageVC, animated: true, completion: nil)
        }
        
        
    }


}

