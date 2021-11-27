# ProgressHUD

<img src="/documents/images/loading.png" width="160px"><img src="/documents/images/success.png" width="160px"><img src="/documents/images/warning.png" width="160px"><img src="/documents/images/error.png" width="160px">

## Requirements

* iOS 13.0+

## Installation

ProgressHUD can only be used with the Swift Package Manager.

In Xcode, use the menu File > Swift Packages > Add Package Dependency  
and enter the package URL https://github.com/ShogoTakeuchi/progress-hud.git.

## Usage

1. you can just simple use like this:

```swift
@State var hudVisible = true
@State var hudConfig = ProgressConfig(type: .loading)

var body: some View {
  VStack(alignment: .leading) {
    // more code
  }
  .overlay(ProgressHUD(isVisible: $viewModel.hudVisible, config: viewModel.hudConfig))
}
```

2. if you want display fullscreen:

```swift
var body: some View {
  Button(action: {
    let config = ProgressConfig(type: .loading, shouldAutoHide: true)
    ProgressWindow.shared.show(config: config)
  }){
    Text("Show HUD").font(.largeTitle)
  }
}
```

see `ProgressConfig` class for more information

## License

MIT License.  
© 2021, Shogo Takeuchi.
