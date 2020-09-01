# Tekit

[![CI Status](https://img.shields.io/travis/linhvt-teko/Tekit.svg?style=flat)](https://travis-ci.org/linhvt-teko/Tekit)
[![Version](https://img.shields.io/cocoapods/v/Tekit.svg?style=flat)](https://cocoapods.org/pods/Tekit)
[![License](https://img.shields.io/cocoapods/l/Tekit.svg?style=flat)](https://cocoapods.org/pods/Tekit)
[![Platform](https://img.shields.io/cocoapods/p/Tekit.svg?style=flat)](https://cocoapods.org/pods/Tekit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Target iOS 10.0 or higher

## Installation

Janus is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Janus', '~> 0.1.0'
```

## How to use

### 1. Init Janus 

Init Janus in `didFinishLaunchingWithOptions` func of `AppDelegate.swift`. 

Users must initialize Janus with `JanusConfig` before using them.

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    let config = JanusConfig(oauthUrl: "https://oauth.stage.tekoapis.net",
                             identityUrl: "https://identity.stage.tekoapis.net",
                             clientId: "b631a62cea4e48a180f6a866c9aa7796",
                             scope: "openid profile om ps catalog ppm us sellers page_builder",
                             googleAppId: "563692749265-7d1vdgcj20ltdb61torp9n76mmsi2907.apps.googleusercontent.com",
                             googleAppSecret: nil,
                             facebookAppId: "125959422141515",
                             appleBundleId: "xxxx")
    
    Janus.shared.initialize(config: config)
    Janus.shared.application(for: application, didFinishLaunchingWithOptions: launchOptions)
    
    self.window = UIWindow(frame: UIScreen.main.bounds)
    let vc = TestViewController(nibName: "TestViewController", bundle: nil)
    self.window?.rootViewController = vc
    self.window?.makeKeyAndVisible()
    
    return true
}

func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    return Janus.shared.application(app, open: url, options: options)
}

```


### 2. Using in project

    Login by using `AuthLoginManager` singleton

#### 2.1. GoogleLogin

```swift

do {
    try AuthLoginManager.shared.login(GoogleLogin(presentViewController: self, delegate: self))
} catch {
    print(error.localizedDescription)
}


```

#### 2.2. FacebookLogin

```swift

do {
    try AuthLoginManager.shared.login(FacebookLogin(presentViewController: self, delegate: self))
} catch {
    print(error.localizedDescription)
}

```

#### 2.3. AppleLogin

```swift

do {
    if #available(iOS 13.0, *) {
        try AuthLoginManager.shared.login(AppleLogin(presentViewController: self, delegate: self))
    } else {
        // Fallback on earlier versions
    }
} catch {
    print(error.localizedDescription)
}


```


#### 2.4. PasswordlessLogin

First, we need to requestOTP by using PhoneAuthProvider

```swift

PhoneAuthProvider.shared.requestOTP(phone: "0917941816") { (isSuccess) in
    print(isSuccess)
}


```

Then we create PasswordlessLogin by passing OTP to PhoneAuthProvider

```swift

if let pin = pinTextField.text, let login = PhoneAuthProvider.shared.createPasswordlessLogin(pin: pin, delegate: self) {
    do {
        try AuthLoginManager.shared.login(login)
    } catch {
        print(error.localizedDescription)
    }
}


```

#### 2.5. UserPasswordLogin

```swift
        
let loginCmd = UserPasswordLogin(user: "xxx", password: "xxx", delegate: self)
do {
    try AuthLoginManager.shared.login(loginCmd)
} catch {
    print(error.localizedDescription)
}

```

### 3. Getting result

By passing delegate `AuthLoginDelegate`, we can caught result returned from SDK

```swift

extension TestViewController: AuthLoginDelegate {

    func loginSuccess(accessToken: String, refreshToken: String) {
        print("accessToken: \(accessToken)")
        print("refreshToken: \(refreshToken)")
    }
    
    func loginFail(message: String?) {
        print(message ?? "common error")
    }
    
}


```

### 4. Accessing to `AuthManager`

Info of Auth-session has been storage in `AuthManager`.

Credential: `AuthManager.shared.credential`
isAuthorized: `AuthManager.shared.isLoggedIn`

If we need preparing for new session, we must use func `AuthManager.shared.prepareNewSession(completion: ((Bool) -> Void)?)`

Using func `AuthManager.shared.refreshSession(completion: OAuthLoginHandler?)` when we need to refresh token 


## Author

linhvt-teko, linh.vt@teko.vn

## License

Tekit is available under the MIT license. See the LICENSE file for more info.
