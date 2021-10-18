//
//  ProgressHUD.swift
//  ProgressHUD
//
//  Created by Shogo Takeuchi on 2021/10/18.
//

import SwiftUI
import SwiftUIVisualEffects

struct ProgressHUD: View {

    @Binding var isVisible: Bool
    var config: ProgressHUDConfig

    var body: some View {
        let hideTimer = Timer.publish(
            every: config.autoHideInterval,
            on: .main,
            in: .common
        ).autoconnect()
        GeometryReader { geometry in
            ZStack {
                if isVisible {
                    config.backgroundColor.edgesIgnoringSafeArea(.all)
                    ZStack {
                        Color.white.blurEffect().blurEffectStyle(.systemChromeMaterial)
                        VStack(spacing: 16) {
                            if config.type == .loading {
                                IndefiniteAnimatedView(
                                    animatedViewSize: config.imageViewSize,
                                    animatedViewForegroundColor: config.imageViewForegroundColor,
                                    lineWidth: config.lineWidth
                                )
                            } else {
                                ImageView(
                                    type: config.type,
                                    imageViewSize: config.imageViewSize,
                                    imageViewForegroundColor: config.imageViewForegroundColor,
                                    successImage: config.successImage,
                                    warningImage: config.warningImage,
                                    errorImage: config.errorImage
                                )
                            }
                            if config.title != nil || config.caption != nil {
                                LabelView(title: config.title, caption: config.caption)
                            }
                        }.padding()
                    }
                    .cornerRadius(config.cornerRadius)
                    .overlay(
                        RoundedRectangle(cornerRadius: config.cornerRadius)
                            .stroke(config.borderColor, lineWidth: config.borderWidth)
                    )
                    .aspectRatio(1, contentMode: .fit)
                    .padding(geometry.size.width / 3)
                    .shadow(color: config.shadowColor, radius: config.shadowRadius)
                }
            }
            .animation(.spring())
            .onTapGesture {
                if config.allowsTapToHide {
                    withAnimation {
                        isVisible = false
                    }
                }
            }
            .onReceive(hideTimer) { _ in
                if config.shouldAutoHide {
                    withAnimation {
                        isVisible = false
                    }
                }
                hideTimer.upstream.connect().cancel()
            }
            .onAppear {
                if config.hapticsEnabled {
                    generateHapticNotification(for: config.type)
                }
            }
        }
    }
    
    func generateHapticNotification(for type: ProgressHUDType) {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        switch type {
        case .success:
            generator.notificationOccurred(.success)
        case .warning:
            generator.notificationOccurred(.warning)
        case .error:
            generator.notificationOccurred(.error)
        default:
            return
        }
    }
}

private struct IndefiniteAnimatedView: View {
    let animatedViewSize: CGSize
    let animatedViewForegroundColor: Color
    let lineWidth: CGFloat
    
    @State private var isAnimating = false
    
    private var foreverAnimation: Animation {
        Animation.linear(duration: 2.0).repeatForever(autoreverses: false)
    }
    
    var body: some View {
        let gradient = Gradient(colors: [animatedViewForegroundColor, .clear])
        let radGradient = AngularGradient(gradient: gradient, center: .center, angle: .degrees(-5))
        Circle()
            .trim(from: 0.0, to: 0.97)
            .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
            .fill(radGradient)
            .frame(width: animatedViewSize.width-lineWidth/2, height: animatedViewSize.height-lineWidth/2)
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0.0))
            .animation(isAnimating ? foreverAnimation : .default)
            .padding(lineWidth/2)
            .onAppear {
                isAnimating = true
            }
            .onDisappear {
                isAnimating = false
            }
    }
}

private struct ImageView: View {
    let type: ProgressHUDType
    let imageViewSize: CGSize
    let imageViewForegroundColor: Color
    let successImage: String
    let warningImage: String
    let errorImage: String
    
    var body: some View {
        imageForHUDType?
            .resizable()
            .frame(width: imageViewSize.width, height: imageViewSize.height)
            .foregroundColor(imageViewForegroundColor.opacity(0.8))
    }
    
    var imageForHUDType: Image? {
        switch type {
        case .success:
            return Image(systemName: successImage)
        case .warning:
            return Image(systemName: warningImage)
        case .error:
            return Image(systemName: errorImage)
        default:
            return nil
        }
    }
}

private struct LabelView: View {
    let title: String?
    let caption: String?
    
    var body: some View {
        VStack(spacing: 4) {
            if let title = title {
                Text(title)
                    .font(.system(size: 21.0, weight: .semibold))
                    .lineLimit(1)
                    .foregroundColor(.primary)
            }
            if let caption = caption {
                Text(caption)
                    .lineLimit(2)
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
        }
        .multilineTextAlignment(.center)
        .vibrancyEffect()
        .vibrancyEffectStyle(.fill)
    }
}
