//
//  OnBoardingItemViewController.swift
//  OnBoardingViewApp
//
//  Created by 정명곤 on 2021/12/27.
//

import UIKit

class OnBoardingItemViewController: UIViewController {
    
    var mainText = ""
    var subText = ""
    var topImage: UIImage? = UIImage()

    @IBOutlet private weak var topImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var mainTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTitleLabel.text = mainText
        topImageView.image = topImage
        descriptionLabel.text = subText

    }

}
