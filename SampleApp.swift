//
//  SampleApp.swift
//  ProgressHUD
//
//  Created by Shogo Takeuchi on 2021/10/18.
//

import SwiftUI

@main
struct SampleApp: App {

    @State var hudVisible = true
    @State var hudConfig = ProgressConfig(type: .loading)

    var body: some Scene {
        WindowGroup {
            ProgressView(isVisible: $hudVisible, config: hudConfig)
        }
    }
}
