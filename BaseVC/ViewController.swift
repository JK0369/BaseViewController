//
//  ViewController.swift
//  BaseVC
//
//  Created by 김종권 on 2020/12/19.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: BaseViewController {

    @IBOutlet weak var btnLoading: UIButton!
    @IBOutlet weak var btnDialog: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        networkListener = .on
    }

    private func setupInputBinding() {
        btnLoading.rx.tap.asDriver(onErrorRecover: {_ in .never()})
            .drive(rx.showLoading)
            .disposed(by: bag)

        btnDialog.rx.tap.asDriver(onErrorRecover: { _ in .never()})
            .map { "server error in viewWillAppear" }
            .drive(rx.showServerErrorDialog)
            .disposed(by: bag)
    }

    @IBAction func showToast(_ sender: Any) {
        showToastView(message: "jake블로그(토스트 메세지)")
    }

    @IBAction func showLoading(_ sender: Any) {
        showLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.hideLoading()
        }
    }

    @IBAction func openSetting(_ sender: Any) {
        showAlertAndSetting(alertTitle: "alert타이틀", actionTitle: "action타이틀(설정으로 이동)")
    }

}

