//
//  ViewController.swift
//  CardDeck
//
//  Created by alvin joseph valdez on 16/03/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import Koloda
import SnapKit

class ViewController: UIViewController {
    
    public let kolodaView: KolodaView = {
        let view: KolodaView = KolodaView()
        return view
    }()
    
    public let overlayView: OverlayView = {
        let view: OverlayView = OverlayView()
        return view
    }()
    
    public let cardView1: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    
    public let cardView2: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    public let cardView3: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.yellow
        return view
    }()
    
    private lazy var myView: [UIView] = [self.cardView1, self.cardView2, self.cardView3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.view.subview(forAutoLayout: self.kolodaView)
        
        self.kolodaView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(100.0)
            make.leading.equalToSuperview().offset(10.0)
            make.trailing.equalToSuperview().inset(10.0)
            make.bottom.equalToSuperview().inset(200.0
            )
        }
        
        self.kolodaView.dataSource = self
        self.kolodaView.delegate = self
    }

    
}

extension ViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.reloadData()
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        print("Selected card")
    }
}

extension ViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return myView.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return self.myView[index]
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return self.overlayView
    }
}
