//
//  ProgressWindow.swift
//  ProgressHUD
//
//  Created by Shogo Takeuchi on 2021/11/05.
//

import SwiftUI

struct ProgressWindowView: View {
    @State var isVisible = true
    var config: ProgressConfig
    
    var body: some View {
        ProgressView(isVisible: $isVisible, config: config)
    }
}
