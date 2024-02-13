//
//  Constants.swift
//  GithubFollowers
//
//  Created by Neddy Ksenia Gonzalez Siles on 31/1/24.
//

import UIKit

enum SFSymbols {
    static let location = UIImage(systemName:"mappin.and.ellipse")
    static let repos = UIImage(systemName:"folder")
    static let gists = UIImage(systemName:"text.alignleft")
    static let followers = UIImage(systemName:"heart")
    static let following = UIImage(systemName:"person.2")
}

enum Images {
    static let ghLogo = UIImage(named: "gh-logo")
    static let avatarPlaceholder = UIImage(named: "avatar-placeholder")
    static let emptyStateLogo = UIImage(named: "empty-state-logo")
}

enum ScreenSize {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let maxLength = max(ScreenSize.width, ScreenSize.height)
    static let minLength = min(ScreenSize.width, ScreenSize.height)
}

enum DeviceTypes {
    static let idiom = UIDevice.current.userInterfaceIdiom
    static let nativeScale = UIScreen().nativeScale
    static let scale = UIScreen().scale
    
    static let isiPhoneSE = idiom == .phone && ScreenSize.maxLength == 568.0
    static let isiPhone8Standard = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale == scale
    //    if it's in zoomed mode, it'll turn the screen size into isiPhoneSE
    static let isiPhone8Zoomed = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale > scale
    static let isiPhone8PlusStandard = idiom == .phone && ScreenSize.maxLength == 736.0
    //    if it's in zoomed mode, it'll turn the screen size into iPhone8Standard
    static let isiPhone8PlusZoomed = idiom == .phone && ScreenSize.maxLength == 736.0 && nativeScale < scale
    static let isiPhoneX = idiom == .phone && ScreenSize.maxLength == 812.0
    static let isiPhoneXsMaxAndXr = idiom == .phone && ScreenSize.maxLength == 896.0
    static let isiPad = idiom == .pad && ScreenSize.maxLength >= 1024.0
    
    //    This has a differemt aspect ratio than from the rest of older phones (7,8)
    static func isiPhoneXAspectRatio() -> Bool {
        return isiPhoneX || isiPhoneXsMaxAndXr
    }
}
