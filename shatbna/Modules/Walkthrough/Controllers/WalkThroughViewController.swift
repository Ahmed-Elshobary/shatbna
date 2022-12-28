//
//  WalkThroughViewController.swift
//  shatbna
//
//  Created by ahmed elshobary on 28/12/2022.
//

import UIKit
import ImageSlideshow

class WalkThroughViewController: UIViewController {

    //MARK: - Outlet
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var slideShow: ImageSlideshow!
    
    //MARK: - Actions
    
    @IBAction func startNowAction(_ sender: Any) {
        navigateToHome()
    }
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAds()
        bottomView.backgroundColor = RedColor

    }
    
    private func setupAds(){
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = YellowColor
        pageIndicator.pageIndicatorTintColor = UIColor.lightGray
        slideShow.pageIndicator = pageIndicator
        slideShow.setImageInputs([
            ImageSource(image: UIImage(named: "firstWT") ?? UIImage()),
            ImageSource(image: UIImage(named: "secondWT") ?? UIImage()),
            ImageSource(image: UIImage(named: "thirdWT") ?? UIImage()),
            ImageSource(image: UIImage(named: "fourthWT") ?? UIImage())
        ])
        slideShow.slideshowInterval = 4
        slideShow.contentScaleMode = .scaleToFill
        slideShow.delegate = self
        
    }

    func navigateToHome(){
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GradientTabBarController") as? GradientTabBarController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension WalkThroughViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        switch page {
        case 0 :
            bottomView.backgroundColor = RedColor
        case 1 :
            bottomView.backgroundColor = orangColor
        case 2 :
            bottomView.backgroundColor = greenColor
        case 3 :
            bottomView.backgroundColor = blueColor
        default:
            break
        }
    }
}
