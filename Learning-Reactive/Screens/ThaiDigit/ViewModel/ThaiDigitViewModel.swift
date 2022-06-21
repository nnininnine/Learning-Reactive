//
//  ThaiDigitViewModel.swift
//  Learning-Reactive
//
//  Created by Nuttapon Buaban on 21/6/2565 BE.
//

import Foundation
import RxSwift

class ThaiDigitViewModel {
    // MARK: Property

    var digitObservable: Observable<String>?
    let disposeBag: DisposeBag = .init()

    // MARK: Methods

    func convertDigitToThai(_ text: String) -> String {
        var result: String = text
        for (index, thaiDigit) in ThaiDigit.allCases.enumerated() {
            result = result.replacingOccurrences(of: index.description, with: thaiDigit.rawValue)
        }
        return result
    }
}
