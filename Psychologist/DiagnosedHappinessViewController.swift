//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by marina on 15/10/24.
//  Copyright © 2015年 marina. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController: HappinessViewController, UIPopoverPresentationControllerDelegate {
    override var hapiness:Int{    //此处重写，没有覆盖父类里的属性，而是在父类属性里添加了新的功能
        didSet{
            diagnosedHistory += [hapiness]
        }
    }
    private let defaults = NSUserDefaults.standardUserDefaults()
    var diagnosedHistory:[Int]{
        get{
            return defaults.objectForKey(History.DefaultKey) as? [Int] ?? []
        }
        set{
            defaults.setObject(newValue, forKey: History.DefaultKey)
        }
    }
    private struct History{
        static let SegueIdentifier = "Show Diagnostic History"
        static let DefaultKey = "DiagnosedHappinessViewController.History"
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case History.SegueIdentifier:
                if let dvc = segue.destinationViewController as? TextViewController{
                    if let ppc = dvc.popoverPresentationController{
                        ppc.delegate = self
                    }
                    dvc.text = "\(diagnosedHistory)"
                }
            default: break
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}
