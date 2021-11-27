//
//  ProgressWindowController.swift
//  ProgressHUD
//
//  Created by Shogo Takeuchi on 2021/11/05.
//

import SwiftUI
import UIKit
import ProgressHUD

class ProgressWindowController: UIHostingController<ProgressWindowView> {

    init(config: ProgressConfig) {
        super.init(rootView: ProgressWindowView(config: config))
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
    }
}
