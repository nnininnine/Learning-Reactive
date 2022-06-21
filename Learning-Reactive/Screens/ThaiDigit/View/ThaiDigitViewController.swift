//
//  ThaiDigitViewController.swift
//  Learning-Reactive
//
//  Created by Nuttapon Buaban on 20/6/2565 BE.
//

import Foundation
import UIKit

class ThaiDigitViewController: UIViewController {
    // MARK: Outlets

    @IBOutlet private var thaiDigitTextView: UITextView!
    @IBOutlet private var digitTextView: UITextView!

    // MARK: Property

    lazy var viewModel: ThaiDigitViewModel? = .init()

    // MARK: Init

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setup()
    }

    override func viewWillDisappear(_ animated: Bool) {
        viewModel = nil
    }

    func setupUI() {
        // setup textView border
        thaiDigitTextView.text = ""
        thaiDigitTextView.layer.borderWidth = 1
        thaiDigitTextView.layer.borderColor = .init(gray: 0, alpha: 1)

        digitTextView.text = ""
        digitTextView.layer.borderWidth = 1
        digitTextView.layer.borderColor = .init(gray: 0, alpha: 1)
    }

    func setup() {
        let tapGestureBackground = UITapGestureRecognizer(target: self, action: #selector(unfocusKeyboard(_:)))
        view.addGestureRecognizer(tapGestureBackground)

        // binding
        viewModel?.digitObservable = digitTextView.rx.text
            .orEmpty
            .map { self.viewModel!.convertDigitToThai($0) }
            .asObservable()

        viewModel?.digitObservable?.bind(to: thaiDigitTextView.rx.text).disposed(by: viewModel!.disposeBag)
    }

    @objc func unfocusKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
