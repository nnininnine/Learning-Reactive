//
//  LoginValidateViewController.swift
//  Learning-Reactive
//
//  Created by Nuttapon Buaban on 21/6/2565 BE.
//

import Foundation
import RxSwift
import UIKit

class LoginValidateViewController: UIViewController {
    // MARK: Outlets

    @IBOutlet private var usernameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginButton: UIButton!

    // MARK: Property

    let viewModel: LoginValidateViewModel = .init()

    // MARK: Init

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    func setup() {
        let tapGestureBackground = UITapGestureRecognizer(target: self, action: #selector(unfocusKeyboard(_:)))
        view.addGestureRecognizer(tapGestureBackground)

        viewModel.usrObservable = usernameTextField.rx
            .text
            .orEmpty
            .map { $0.count >= 8 }
            .asObservable()

        viewModel.pwdObservable = passwordTextField.rx
            .text
            .orEmpty
            .map { $0.count >= 8 }
            .asObservable()

        viewModel.loginButtonObservable = Observable.combineLatest(viewModel.usrObservable!, viewModel.pwdObservable!).map { usr, pwd in
            usr && pwd
        }.asObservable()

        viewModel.loginButtonObservable?.bind(to: loginButton.rx.isEnabled).disposed(by: viewModel.disposeBag)

        loginButton.rx.tap
            .bind {
                self.viewModel.displayAlert(source: self, title: "Login success", message: "Welcome, \(self.usernameTextField.text ?? "") <3")
            }.disposed(by: viewModel.disposeBag)
    }

    @objc func unfocusKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
