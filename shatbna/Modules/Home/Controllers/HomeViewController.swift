//
//  HomeViewController.swift
//  shatbna
//
//  Created by ahmed elshobary on 28/12/2022.
//

import UIKit
import ImageSlideshow
import CountdownLabel
class HomeViewController: UIViewController {

    //MARK: - Variables
    
    var currentPage = 0
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var indicatorsCollectionView: UICollectionView!
    @IBOutlet weak var slideshow: ImageSlideshow!
    @IBOutlet weak var addPorjectButtonOutlet: UIButton!
    @IBOutlet weak var firstCatogeryView: UIView!
    @IBOutlet weak var secondCatogeryView: UIView!
    
    @IBOutlet weak var secondSlideShow: ImageSlideshow!
    @IBOutlet weak var secondIndicatorsCollectionView: UICollectionView!
    
    @IBOutlet weak var buyNowButtonOutlet: UIButton!
    @IBOutlet weak var shareButtonOutlet: UIButton!
    
    @IBOutlet weak var countDownLabel: CountdownLabel!
    @IBOutlet weak var thirdIndicatorsCollectionView: UICollectionView!
    
    //MARK: - Actions
    
    
    @IBAction func navigateToDetails(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "CatogriesViewController") as? CatogriesViewController{
        navigateTo(vc: vc)
        }
    }
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    private func setupViews(){
        addPorjectButtonOutlet.layer.cornerRadius = 10
        addPorjectButtonOutlet.layer.borderWidth = 2
        addPorjectButtonOutlet.layer.borderColor = YellowColor.cgColor
        addPorjectButtonOutlet.clipsToBounds = true
        firstCatogeryView.layer.cornerRadius = 8
        firstCatogeryView.layer.borderWidth = 0.2
        firstCatogeryView.layer.borderColor = UIColor.darkGray.cgColor
        firstCatogeryView.clipsToBounds = true
        
        secondCatogeryView.layer.cornerRadius = 8
        secondCatogeryView.layer.borderWidth = 0.2
        secondCatogeryView.layer.borderColor = UIColor.darkGray.cgColor
        secondCatogeryView.clipsToBounds = true
        
        buyNowButtonOutlet.layer.cornerRadius = 10
        buyNowButtonOutlet.clipsToBounds = true
        
        shareButtonOutlet.layer.cornerRadius = 10
        shareButtonOutlet.clipsToBounds = true
        shareButtonOutlet.layer.borderColor = YellowColor.cgColor
        shareButtonOutlet.layer.borderWidth = 1
        setupAds()
        setupCountDown()
    }
    
    private func setupAds(){
        let pageIndicator = UIPageControl()
        pageIndicator.currentPageIndicatorTintColor = UIColor.clear
        pageIndicator.pageIndicatorTintColor = UIColor.clear
        slideshow.pageIndicator = pageIndicator
        secondSlideShow.pageIndicator = pageIndicator
        
        slideshow.delegate = self
        secondSlideShow.delegate = self
        slideshow.setImageInputs([
            ImageSource(image: UIImage(named: "image1") ?? UIImage()),
            ImageSource(image: UIImage(named: "image2") ?? UIImage())
        ])
        secondSlideShow.setImageInputs([
            ImageSource(image: UIImage(named: "image3") ?? UIImage()),
            ImageSource(image: UIImage(named: "image3") ?? UIImage())
        ])
        slideshow.slideshowInterval = 3
        secondSlideShow.slideshowInterval = 3
        
    }
    
    private func setupCountDown(){
        countDownLabel.addTime(time: 1000)
        countDownLabel.timeFormat = "HH:mm:ss"
        countDownLabel.start()
    }
    
    func navigateTo(vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        currentPage = page
        indicatorsCollectionView.reloadData()
        secondIndicatorsCollectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellVC = collectionView.dequeueReusableCell(withReuseIdentifier: "IndicatorsCustomCellID", for: indexPath) as! IndicatorsCustomCell
        if indexPath.item == currentPage {
            cellVC.backgroundColor = YellowColor
        } else {
            cellVC.backgroundColor = UIColor.black
        }
        return cellVC
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == thirdIndicatorsCollectionView {
            return 3
        }
        return (collectionView == indicatorsCollectionView) ? slideshow.pageIndicator?.numberOfPages ?? 0 : secondSlideShow.pageIndicator?.numberOfPages ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 20, height: 4)
    }
}
