//
//  UtilityManager.swift
//  TestProject
//
//  Created by Developer on 11/10/2023.
//

import UIKit
import NVActivityIndicatorView

class AllLoaders {
    static let shared = AllLoaders()
    private var activityRestorationIdentifier: String {
        return "NVActivityIndicatorViewContainer"
    }
    
    public func showLoaderWithMessage(message: String) {
        startActivityAnimating(size: CGSize(width: 56, height: 56), message: message, type: NVActivityIndicatorType.ballScale, color: .darkGray, padding: 2, isFromOnView: false)
    }
    
    public func showCustomLoader() {
        startActivityAnimating(size: CGSize(width: 56, height: 56), message: nil, type: NVActivityIndicatorType.ballScale, color: .darkGray, padding: 2, isFromOnView: false)
    }
    
    public func showCustomLoaderMsg(message: String) {
        startActivityAnimating(size: CGSize(width: 56, height: 56), message: message, type: .ballRotateChase, color: UIColor.white.withAlphaComponent(0.60), padding: 2, isFromOnView: false)
    }
    
    public func hideCustomLoader() {
        stopActivityAnimating(isFromOnView: false)
    }
    
    public func showLoaderOnView() {
        startActivityAnimating(size: CGSize(width: 56, height: 56), message: nil, type: NVActivityIndicatorType.ballScale, color: UIColor.black, padding: 2, isFromOnView: true)
    }
    
    public func hideLoaderOnView() {
        stopActivityAnimating(isFromOnView: true)
    }
    
    private func startActivityAnimating(size: CGSize? = nil, message: String? = nil, type: NVActivityIndicatorType? = nil, color: UIColor? = nil, padding: CGFloat? = nil, isFromOnView: Bool) {
        let activityContainer: UIView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        activityContainer.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        activityContainer.restorationIdentifier = activityRestorationIdentifier
        
        activityContainer.isUserInteractionEnabled = false
        let actualSize = size ?? CGSize(width: 56, height: 56)
        
        let activityIndicatorView = NVActivityIndicatorView(
            frame: CGRect(x: 0, y: 0, width: actualSize.width, height: actualSize.height),
            type: type!,
            color: color!,
            padding: padding!
        )
        
        activityIndicatorView.center = activityContainer.center
        activityIndicatorView.startAnimating()
        activityContainer.addSubview(activityIndicatorView)
        
        if let message = message, !message.isEmpty {
            let width = activityContainer.frame.size.width / 2
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 30))
            label.center = CGPoint(
                x: activityIndicatorView.center.x, y:
                    activityIndicatorView.center.y + actualSize.height
            )
            label.textAlignment = .center
            label.text = message
            label.textColor = activityIndicatorView.color
            activityContainer.addSubview(label)
        }
        
        UIApplication.shared.keyWindow?.isUserInteractionEnabled = false
        if isFromOnView {
            UIApplication.shared.keyWindow?.rootViewController?.view.addSubview(activityContainer)
        } else {
            UIApplication.shared.keyWindow?.addSubview(activityContainer)
        }
    }
    
    private func stopActivityAnimating(isFromOnView: Bool) {
        DispatchQueue.main.async {
            UIApplication.shared.keyWindow?.isUserInteractionEnabled = true
            if isFromOnView {
                for item in (UIApplication.shared.keyWindow?.rootViewController?.view.subviews)!
                where item.restorationIdentifier == self.activityRestorationIdentifier {
                    item.removeFromSuperview()
                }
            } else {
                for item in (UIApplication.shared.keyWindow?.subviews)!
                where item.restorationIdentifier == self.activityRestorationIdentifier {
                    item.removeFromSuperview()
                }
            }
        }
    }
}
