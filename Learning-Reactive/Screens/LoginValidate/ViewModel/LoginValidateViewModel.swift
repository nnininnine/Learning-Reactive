//
//  LoginValidateViewModel.swift
//  Learning-Reactive
//
//  Created by Nuttapon Buaban on 21/6/2565 BE.
//

import Foundation
import RxSwift

class LoginValidateViewModel {
    // MARK: Property

    var usrObservable: Observable<Bool>?
    var pwdObservable: Observable<Bool>?
    var loginButtonObservable: Observable<Bool>?
    let disposeBag: DisposeBag = .init()

    // MARK: Methods

    func displayAlert(source: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Confirm", style: .default))
        source.present(alert, animated: true)
    }
}
