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

TekAuth is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Tekit/TekAuth', :git => 'https://github.com/linhvt-teko/Tekit.git'
```

## How to use

### 1. Init TekAuth 

Init TekAuth in `didFinishLaunchingWithOptions` func of `AppDelegate.swift`. 
Now we're providing 4 LoginMethod:

- GoogleLoginMethod
    params: `clientId` : GoogleClientId

- FacebookLoginMethod
    params: `appId` : FacebookAppId

- AppleLoginMethod
    params: `bundleId` : BundleId of app

- PasswordlessLoginMethod
    params: `passwordlessServiceUrl`: URL of PasswordlessService to requestOTP bla bla bla

Users must register login methods with `AuthRegistrationCenter` before using them.

```swift
// code away!

let googleLM = GoogleLoginMethod(clientId"xxx")
let facebookLM = FacebookLoginMethod(appId"xxx")
let appleLM = AppleLoginMethod(bundleId"xxx")
let phoneLM = PasswordlessLoginMeth(passwordlessServiceUrl: URL(string: "xxx")!)
AuthRegistrationCenter.shared.register(loginMethods: googleLM, facebookLM, appleLM, phoneLM,
                                    oAuthURL: URL(strin"xxx")!,
                                    config: OAuthCon(clientId: "xxxscopes: "xxx"),
                                    for: application,
                                    didFinishLaunchingWithOptions: launchOptions)

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
