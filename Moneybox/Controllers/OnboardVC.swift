//
//  OnboardVC.swift
//  Моя копилка сбережений
//
//  Created by Nick Sagan on 13.03.2022.
//

import UIKit

class OnboardVC: UIViewController {
    
    let onboardTitleArray: [String] = ["Задайте цель", "Делитесь с близкими", "Пройдите тест"]
    let onboardSubTitleArray: [String] = ["И следите за процессом накопления", "Пусть они знают, на что вы копите", "И узнайте, умеете ли вы копить? "]

    var swiftyOnboard: SwiftyOnboard!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        swiftyOnboard = SwiftyOnboard(frame: view.frame)
        
        if traitCollection.userInterfaceStyle == .dark {
            swiftyOnboard.style = .light
            swiftyOnboard.backgroundColor = .black
        } else {
            swiftyOnboard.style = .dark
            swiftyOnboard.backgroundColor = .white
        }
        
        view.addSubview(swiftyOnboard)
        swiftyOnboard.dataSource = self
        swiftyOnboard.delegate = self
    }

    @objc func handleSkip() {
        let nc = UINavigationController(rootViewController: MainVC())
        nc.navigationBar.backgroundColor = UIColor.white.withAlphaComponent(0)
        nc.navigationBar.tintColor = .white
        let vc = MainVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleContinue(sender: UIButton) {
        let index = sender.tag
        if index == 2 {
            goToQuiz()
        } else {
            swiftyOnboard?.goToPage(index: index + 1, animated: true)
        }
    }
    
    func goToQuiz() {
        let nc = UINavigationController(rootViewController: MainVC())
        nc.navigationBar.backgroundColor = UIColor.white.withAlphaComponent(0)
        nc.navigationBar.tintColor = .white
        let vc = QuizVC()
        navigationController?.pushViewController(vc, animated: true)

    }
}

//MARK: - SwiftyOnboard protocols
extension OnboardVC: SwiftyOnboardDataSource, SwiftyOnboardDelegate {
    
    // Setup onboarding pages
    
    func swiftyOnboardNumberOfPages(_ swiftyOnboard: SwiftyOnboard) -> Int {
        onboardTitleArray.count
    }

    func swiftyOnboardPageForIndex(_ swiftyOnboard: SwiftyOnboard, index: Int) -> SwiftyOnboardPage? {
        let page = SwiftyOnboardPage()
        page.title.text = onboardTitleArray[index]
        page.title.font = UIFont(name: "SFProDisplay-Bold", size: 34)

        page.subTitle.text = onboardSubTitleArray[index]
        page.subTitle.font = UIFont(name: "SFProDisplay-Light", size: 22)
        
        if traitCollection.userInterfaceStyle == .dark {
            swiftyOnboard.style = .light
            swiftyOnboard.backgroundColor = .black
        } else {
            swiftyOnboard.style = .dark
            swiftyOnboard.backgroundColor = .white
        }

        page.imageView.image = UIImage(named: "\(index).png")
        
        return page
    }
    
    // Setup onboarding overlay
    
    func swiftyOnboardViewForOverlay(_ swiftyOnboard: SwiftyOnboard) -> SwiftyOnboardOverlay? {
        let overlay = SwiftyOnboardOverlay()
        
        //Setup targets for the buttons on the overlay view:
        overlay.skipButton.addTarget(self, action: #selector(handleSkip), for: .touchUpInside)
        overlay.continueButton.addTarget(self, action: #selector(handleContinue), for: .touchUpInside)
        overlay.skipButton.accessibilityIdentifier = "skip"
        
        return overlay
    }
   
    func swiftyOnboardOverlayForPosition(_ swiftyOnboard: SwiftyOnboard, overlay: SwiftyOnboardOverlay, for position: Double) {
        let currentPage = round(position)
        overlay.pageControl.currentPage = Int(currentPage)
        overlay.continueButton.tag = Int(position)
        
        if currentPage == 0.0 || currentPage == 1.0 {
            overlay.continueButton.setTitle("Дальше", for: .normal)
            overlay.skipButton.setTitle("Пропустить", for: .normal)
            overlay.skipButton.isHidden = false
        } else {
            overlay.continueButton.setTitle("Пройти тест!", for: .normal)
        }
    }
}
