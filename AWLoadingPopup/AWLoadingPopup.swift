//
//  AWLoadingPopup.swift
//  AWLoadingPopup
//
//  Created by Tudor Ana on 02/02/2020.
//  Copyright © 2020 Tudor Ana. All rights reserved.
//

import UIKit

public final class AWLoadingPopup: UIView {

    @IBOutlet weak var contentView: UIView!
    
    static let shared: AWLoadingPopup = {
        return Bundle.main.loadNibNamed("AWLoadingPopup", owner: AWLoadingPopup(), options: nil)?.first as! AWLoadingPopup
    }()
    
    public static func present(on view: UIView) {
    
        AWLoadingPopup.shared.present(on: view)
    }
    
    public static func dismiss() {
        
        AWLoadingPopup.shared.dismiss()
    }
}


extension AWLoadingPopup {
    
    private func present(on view: UIView) {
        
        view.addSubview(self)
        self.alpha = 0.0
        self.frame = view.bounds
        self.layer.cornerRadius = 14.0
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        UIView.animate(withDuration: 0.4) { [weak self] in
            self?.contentView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self?.alpha = 1.0
        }
    }
    
    private func dismiss() {
        
        UIView.animate(withDuration: 0.4, animations: { [weak self] in
            self?.contentView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            self?.alpha = 0.0
        }) { [weak self] (finished) in
            if finished {
                self?.contentView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self?.removeFromSuperview()
            }
        }
    }
}
