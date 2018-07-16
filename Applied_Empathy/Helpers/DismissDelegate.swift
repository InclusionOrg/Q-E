//
//  DismissDelegate.swift
//  Applied_Empathy
//
//  Created by Simone Grant on 7/2/18.
//  Copyright © 2018 Simone Grant. All rights reserved.
//

import UIKit

protocol DismissalDelegate: class {
    func finishedShowing(viewController: UIViewController);
}

protocol Dismissable: class {
    weak var dismissalDelegate : DismissalDelegate? { get set }
}

extension DismissalDelegate where Self: UIViewController {
    func finishedShowing(viewController: UIViewController) {
        if viewController.isBeingPresented && viewController.presentingViewController == self {
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        self.navigationController?.popViewController(animated: true)
    }
}
