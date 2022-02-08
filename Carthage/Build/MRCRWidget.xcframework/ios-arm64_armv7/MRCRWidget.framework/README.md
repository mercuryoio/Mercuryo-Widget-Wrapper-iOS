# Mercuryo-Widget

Mercuryo Widget Wrapper is a lightweight library for developers of apps who embed Mercuryo Widget into their mobile UX.

Solely purpose of the library is to provide an easy way to initialize WebView passing correct parameters with all needed permissions.

https://mercuryo.io/widget/

## Requirements

- iOS 9.0+
- Xcode 11+
- Swift 5.1+

## Communication

- If you need to **find or understand an API**, check [our documentation](https://mercuryoio.github.io/Mercuryo-Widget-Wrapper-iOS/).
- If you need **more information**, check [our help page](https://help.mercuryo.io/en/articles/4519473-mercuryo-widget-faq).
- If you **found a bug**, open an issue. The more detail the better!
- If you **want to contribute**, submit a pull request.


## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate Mercuryo Widget into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'MRCRWidget'
```

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but Mercuryo Widget does support its use on supported platforms.

Once you have your Swift package set up, adding MRCRWidget as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/mercuryoio/Mercuryo-Widget-Wrapper-iOS.git", .upToNextMajor(from: "1.0.0"))
]
```

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate Mercuryo Widget into your project manually.

#### Embedded Framework

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add Mercuryo Widget as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/mercuryoio/Mercuryo-Widget-Wrapper-iOS.git
```

- Open the new `MRCRWidget` folder, and drag the `MRCRWidget.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `MRCRWidget.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see `MRCRWidget.xcodeproj` folder.

- And that's it!

  > The `MRCRWidget.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

---

## Usage

### Widget Configuration

For the first, you should create a configuration for your widget. You can choose one of the standard environment `production` or `sandbox`

```swift
import MRCRWidget

do {
    let configuration = try WidgetConfiguration(
        widgetId: "67710925-8b40-4767-846e-3b88db69f04d",
        environment: .production,
        params: nil
    )
} catch {
    assertionFailure(error.localizedDescription)
}

```

or use your own widget url

```swift
import MRCRWidget

do {
    let configuration = try WidgetConfiguration(
        widgetId: "67710925-8b40-4767-846e-3b88db69f04d",
        widgetURL: URL(string: "https://exchange.mydomain.io"),
        params: nil
    )
} catch {
    assertionFailure(error.localizedDescription)
}
```

### Presenting Widget

Next, you should create WidgetAssembly and call `build` method. It returns a ViewController that you can show as you want.

```swift
import MRCRWidget

let vc = WidgetAssembly(
    configuration: configuration,
    uiDelegate: self
)
    .build()

self.present(
    vc,
    animated: true
)
```

### Supporting Widget UI Delegate

You can also support the error handling from Mercuryo Widget. Just implement WidgetUIDelegate.

```swift
import MRCRWidget

extension ViewController: WidgetUIDelegate {

    func widgetDidReceiveError(_ error: WidgetError) {
        switch error.errorCode {
        case .photoLibraryAuthorizationFailed:
            showAlert()

        default:
            break
        }
    }
}
```

---

## License

Mercuryo Widget is released under the MIT license. [See LICENSE](https://github.com/mercuryoio/Mercuryo-Widget-Wrapper-iOS/blob/master/LICENSE.md) for details.
