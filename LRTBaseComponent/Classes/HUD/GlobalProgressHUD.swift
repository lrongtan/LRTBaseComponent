//
//  GlobalProgressHUD.swift
//  newenergy-ios
//
//  Created by cgf on 2020/1/14.
//  Copyright © 2020 cgf. All rights reserved.
//

import Foundation
import MBProgressHUD
import UIKit

public class GlobalProgressHUD {
    
    public static let HUDduration: Double = 2
    
    public static let shareInstance = GlobalProgressHUD()
    
    private var progressHUD: MBProgressHUD?
    
    private func getProgressHUD() -> MBProgressHUD? {
        if let window = UIApplication.shared.keyWindow {
            UIActivityIndicatorView.appearance(whenContainedInInstancesOf: [MBProgressHUD.self]).color = .white
            progressHUD = MBProgressHUD.forView(window)
            if !(progressHUD != nil) {
                progressHUD = MBProgressHUD.showAdded(to: window, animated: true)
                progressHUD?.margin = 25
                progressHUD?.bezelView.style = .solidColor
                progressHUD?.bezelView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.6)
                progressHUD?.label.textColor = .white
                progressHUD?.animationType = .fade
                progressHUD?.detailsLabel.textColor = .white
                progressHUD?.isUserInteractionEnabled = false
                progressHUD?.detailsLabel.font = progressHUD?.label.font
            }
            return progressHUD!
        }
        return nil
    }
    
    public func showHUDAtWindow(title: String) {
        self.getProgressHUD()?.label.text = NSLocalizedString(title, comment: "")
    }
    
    public func showHUDAtWindow(title: String, detail: String) {
        self.getProgressHUD()?.label.text = NSLocalizedString(title, comment: "")
        self.getProgressHUD()?.detailsLabel.text = NSLocalizedString(detail, comment: "")
    }
    
    public func hideHUDAtWindow() {
        self.getProgressHUD()?.hide(animated: true)
    }
    
    public func hudStyle1() {
        getProgressHUD()?.label.textColor = .white
        getProgressHUD()?.detailsLabel.textColor = .white
        getProgressHUD()?.contentColor = .white
        getProgressHUD()?.backgroundColor = .clear
        getProgressHUD()?.tintColor = .white
        getProgressHUD()?.margin = 20
        getProgressHUD()?.bezelView.style = .solidColor
        getProgressHUD()?.bezelView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.6)
//        getProgressHUD()?.backgroundView.color = UIColor.init(white: 0.8, alpha: 0.6)
    }
    
    public static func showHUDIndicator(title: String, detail: String="", isUserInteractionEnabled: Bool = true){
        let hud = shareInstance.getProgressHUD()
        shareInstance.hudStyle1()
        hud?.mode = .indeterminate
        hud?.label.text = NSLocalizedString(title, comment: "")
        hud?.detailsLabel.text = NSLocalizedString(detail, comment: "")
        hud?.isUserInteractionEnabled = isUserInteractionEnabled
        hud?.show(animated: true)
    }
    
    public static func showHUDText(title: String, detail: String="", duration: TimeInterval = HUDduration){
        let hud = shareInstance.getProgressHUD()
        shareInstance.hudStyle1()
        hud?.mode = .text
        if title != "" && detail == "" {
            hud?.label.text = ""
            hud?.detailsLabel.text = NSLocalizedString(title, comment: "")
        }else{
            hud?.label.text = NSLocalizedString(title, comment: "")
            hud?.detailsLabel.text = NSLocalizedString(detail, comment: "")
        }
        hud?.detailsLabel.font = hud?.label.font
        hud?.isUserInteractionEnabled = false
        hud?.show(animated: true)
        hud?.hide(animated: true, afterDelay: duration)
    }
    
    public static func showHUDSuccess(title: String, detail: String="", duration: TimeInterval = HUDduration){
        let hud = shareInstance.getProgressHUD()
        shareInstance.hudStyle1()
        hud?.mode = .customView
        let successImageView = UIImageView.init(image: UIImage.init(named: "Add-Success"))
        hud?.customView = successImageView
        hud?.label.text = NSLocalizedString(title, comment: "")
        hud?.detailsLabel.text = NSLocalizedString(detail, comment: "")
        hud?.isUserInteractionEnabled = false
        hud?.show(animated: true)
        hud?.hide(animated: true, afterDelay: duration)
    }
    
    public static func showHUDFail(title: String, detail: String="", duration: TimeInterval = HUDduration){
        let hud = shareInstance.getProgressHUD()
        shareInstance.hudStyle1()
        hud?.mode = .customView
        let failImageView = UIImageView.init(image: UIImage.init(named: "Add-fail"))
        hud?.customView = failImageView
        hud?.label.text = NSLocalizedString(title, comment: "")
        hud?.detailsLabel.text = NSLocalizedString(detail, comment: "")
        hud?.isUserInteractionEnabled = false
        hud?.show(animated: true)
        hud?.hide(animated: true, afterDelay: duration)
    }
    
    public static func showHUDProgress(progress: Float, title: String, detail: String="", duration: TimeInterval = HUDduration){
        let hud = shareInstance.getProgressHUD()
        shareInstance.hudStyle1()
        hud?.mode = .annularDeterminate
        hud?.progress = progress
        hud?.label.text = NSLocalizedString(title, comment: "")
        hud?.detailsLabel.text = NSLocalizedString(detail, comment: "")
        hud?.isUserInteractionEnabled = false
        hud?.show(animated: true)
//        hud?.hide(animated: true, afterDelay: duration)
    }
    
    /// hud 自定义view
    public static func showCustomView(view: UIView, isUserInteractionEnabled: Bool = true) {
        let hud = shareInstance.getProgressHUD()
        hud?.mode = .customView
        hud?.customView = view
        hud?.margin = 0
        hud?.backgroundColor = .black.withAlphaComponent(0.5)
        hud?.isUserInteractionEnabled = isUserInteractionEnabled
        hud?.bezelView.backgroundColor = .clear
        hud?.show(animated: true)
    }
        
    public static func hidden(animated: Bool = true){
        let hud = shareInstance.getProgressHUD()
        
        hud?.hide(animated: animated)
    }
    
    public static func hidden(duration: TimeInterval = HUDduration, animated: Bool = true){
        let hud = shareInstance.getProgressHUD()
        hud?.hide(animated: animated, afterDelay: duration)
    }
}
