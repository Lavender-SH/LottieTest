//  TestView.swift
//  LottieTest
//
//  Created by 이승현 on 7/19/24.
//
import UIKit
import SnapKit
import Lottie

class TestView: BaseView {
    
    lazy var animationView: LottieAnimationView = {
        let view = LottieAnimationView(name: "12345")
        view.loopMode = .playOnce
        view.contentMode = .scaleAspectFit
        view.isHidden = true
        return view
    }()
    
    lazy var countDownButton: UIButton = {
        let button = UIButton()
        button.setTitle("시작", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 150 // 버튼 크기의 절반으로 설정
        button.clipsToBounds = true //트루
        return button
    }()
    
    override func configureView() {
        addSubview(animationView)
        addSubview(countDownButton)
    }
    
    override func setConstraints() {
        animationView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(300) // 버튼 크기와 동일하게 설정
        }
        
        countDownButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(300)
        }
    }
    
    func showAnimation() {
        countDownButton.isHidden = true
        animationView.isHidden = false
        animationView.play { [weak self] (finished) in
            if finished {
                self?.countDownButton.isHidden = false
                self?.animationView.isHidden = true
            }
        }
    }
}

