//
//  PresentAlert.swift
//  AppStoreAPI
//
//  Created by 태로고침 on 2021/03/24.
//

import UIKit

extension UIViewController {
    
    func presentAlert(title: String, message: String? = nil,
                      isCancelActionIncluded: Bool = false,
                      preferredStyle style: UIAlertController.Style = .alert,
                      handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let actionDone = UIAlertAction(title: "확인", style: .default, handler: handler)
        alert.addAction(actionDone)
        if isCancelActionIncluded {
            let actionCancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            alert.addAction(actionCancel)
        }
        self.present(alert, animated: true, completion: nil)
    }
}
