//
//  ViewController.swift
//  LottieTest
//
//  Created by 이승현 on 7/19/24.
//
import UIKit
import Lottie
import SnapKit

class ViewController: UIViewController {
    
    let testView = TestView()
    
    override func loadView() {
        self.view = testView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        testView.countDownButton.addTarget(self, action: #selector(startAnimation), for: .touchUpInside)
    }
    
    @objc func startAnimation() {
        testView.showAnimation()
    }
}


