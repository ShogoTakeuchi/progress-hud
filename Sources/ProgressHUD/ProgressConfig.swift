//
//  ProgressConfig.swift
//  ProgressHUD
//
//  Created by Shogo Takeuchi on 2021/10/18.
//

import SwiftUI

struct ProgressConfig {
    let type: ProgressType
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
    let shouldAutoHide: Bool
    let allowsTapToHide: Bool
    let autoHideInterval: TimeInterval
    let hapticsEnabled: Bool
    let imageViewSize: CGSize
    let imageViewForegroundColor: Color
    let successImage: String
    let warningImage: String
    let errorImage: String

    public init(
        type: ProgressType = .loading,
        title: String? = nil,
        caption: String? = nil,
        minSize: CGSize = CGSize(width: 60, height: 60),
        cornerRadius: CGFloat = 12.0,
        backgroundColor: Color = Color.black.opacity(0.3),
        titleForegroundColor: Color = .primary,
        captionForegroundColor: Color = .secondary,
        shadowColor: Color = .clear,
        shadowRadius: CGFloat = 0.0,
        borderColor: Color = .clear,
        borderWidth: CGFloat = 0.0,
        lineWidth: CGFloat = 6.0,
        shouldAutoHide: Bool = false,
        allowsTapToHide: Bool = false,
        autoHideInterval: TimeInterval = 10.0,
        hapticsEnabled: Bool = true,
        imageViewSize: CGSize = CGSize(width: 60, height: 60),
        imageViewForegroundColor: Color = .primary,
        successImage: String = "checkmark.circle",
        warningImage: String = "exclamationmark.circle",
        errorImage: String = "xmark.circle"
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
        self.shouldAutoHide = shouldAutoHide
        self.allowsTapToHide = allowsTapToHide
        self.autoHideInterval = autoHideInterval
        self.hapticsEnabled = hapticsEnabled
        self.imageViewSize = imageViewSize
        self.imageViewForegroundColor = imageViewForegroundColor
        self.successImage = successImage
        self.warningImage = warningImage
        self.errorImage = errorImage
    }
}
