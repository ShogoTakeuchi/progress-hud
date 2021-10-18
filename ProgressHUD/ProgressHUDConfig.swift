//
//  ProgressHUDConfig.swift
//  ProgressHUD
//
//  Created by Shogo Takeuchi on 2021/10/18.
//

import SwiftUI

struct ProgressHUDConfig: Hashable {
    let type: ProgressHUDType
    let title: String?
    let caption: String?
    let minSize: CGSize
    let cornerRadius: CGFloat
    let backgroundColor: Color
    let titleForegroundColor: Color
    let captionForegroundColor: Color
    let shadowColor: Color
    let shadowRadius: CGFloat
    let borderColor: Color
    let borderWidth: CGFloat
    let lineWidth: CGFloat
    let imageViewSize: CGSize
    let imageViewForegroundColor: Color
    let successImage: String
    let warningImage: String
    let errorImage: String
    let shouldAutoHide: Bool
    let allowsTapToHide: Bool
    let autoHideInterval: TimeInterval
    let hapticsEnabled: Bool

    public init(
        type: ProgressHUDType = .loading,
        title: String? = nil,
        caption: String? = nil,
        minSize: CGSize = CGSize(width: 100.0, height: 100.0),
        cornerRadius: CGFloat = 12.0,
        backgroundColor: Color = .clear,
        titleForegroundColor: Color = .primary,
        captionForegroundColor: Color = .secondary,
        shadowColor: Color = .clear,
        shadowRadius: CGFloat = 0.0,
        borderColor: Color = .clear,
        borderWidth: CGFloat = 0.0,
        lineWidth: CGFloat = 10.0,
        imageViewSize: CGSize = CGSize(width: 100, height: 100),
        imageViewForegroundColor: Color = .primary,
        successImage: String = "checkmark.circle",
        warningImage: String = "exclamationmark.circle",
        errorImage: String = "xmark.circle",
        shouldAutoHide: Bool = false,
        allowsTapToHide: Bool = false,
        autoHideInterval: TimeInterval = 10.0,
        hapticsEnabled: Bool = true
    ) {
        self.type = type
        self.title = title
        self.caption = caption
        self.minSize = minSize
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.titleForegroundColor = titleForegroundColor
        self.captionForegroundColor = captionForegroundColor
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.lineWidth = lineWidth
        self.imageViewSize = imageViewSize
        self.imageViewForegroundColor = imageViewForegroundColor
        self.successImage = successImage
        self.warningImage = warningImage
        self.errorImage = errorImage
        self.shouldAutoHide = shouldAutoHide
        self.allowsTapToHide = allowsTapToHide
        self.autoHideInterval = autoHideInterval
        self.hapticsEnabled = hapticsEnabled
    }
}
