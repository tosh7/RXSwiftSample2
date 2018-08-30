//
//  ViewController.swift
//  RxSwiftSample2
//
//  Created by Satoshi Komatsu on 2018/08/29.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let dissposeBag = DisposeBag()
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var backButton: UIButton!{
        didSet{
            backButton.layer.cornerRadius = 10
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //コンソールに出力する場合は$0を使用する
//        textField.rx.text
//            .subscribe(onNext: {[weak self] value in
//                print($0!)
//        })
//        .disposed(by: dissposeBag)
        
        //subscribeで書くとこっち
//        textField.rx.text
//            .subscribe(onNext: {[weak self] value in
//                self?.label.text = value!
//            })
//            .disposed(by: dissposeBag)
        
        //bindToで書くとこっち
        textField.rx.text
            .bind(to: label.rx.text)
        .disposed(by: dissposeBag)
        
        backButton.rx.tap
            .subscribe(onNext: {
                self.dismiss(animated: true, completion: nil)
            })
    }
}

