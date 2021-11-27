//
//  ProgressWindow.swift
//  ProgressHUD
//
//  Created by Shogo Takeuchi on 2021/11/12.
//

import ProgressHUD
import UIKit

final public class ProgressWindow {

    public static let shared = ProgressWindow()
    private let uiWindow: UIWindow

    private init() {
        uiWindow = UIWindow(frame: UIScreen.main.bounds)
    }

    func show(config: ProgressConfig) {
        let controller = ProgressWindowController(config: config)
        uiWindow.rootViewController = controller
        uiWindow.windowLevel = UIWindow.Level.normal + 1
        uiWindow.backgroundColor = .clear
        uiWindow.makeKeyAndVisible()

        if config.shouldAutoHide {
            Timer.scheduledTimer(
                timeInterval: config.autoHideInterval,
                target: self,
                selector: #selector(dismiss),
                userInfo: nil,
                repeats: false
            )
        }
    }

    @objc
    func dismiss() {
        uiWindow.isHidden = true
    }
}
