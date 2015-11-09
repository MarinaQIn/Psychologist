//
//  ViewController.swift
//  Psychologist
//
//  Created by marina on 15/10/24.
//  Copyright © 2015年 marina. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {
    
    
    @IBAction func Nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: self)
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationCon = segue.destinationViewController as? UINavigationController {
            if let destination = destinationCon.visibleViewController {
                if let hvc = destination as? HappinessViewController {
                    if let identifier = segue.identifier {
                        switch identifier {
                            case "sad": hvc.hapiness = 0
                            case "happy": hvc.hapiness = 100
                            case "nothing": hvc.hapiness = 25
                            default: hvc.hapiness = 50
                        }
                    }
                }
            }

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear(animated=\(animated))")
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear(animated=\(animated))")
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisAppear(animated=\(animated))")
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear(animated=\(animated))")
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews")
    }
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        print("viewWillTransitionToSize")
        coordinator.animateAlongsideTransition({(context:UIViewControllerTransitionCoordinatorContext!) -> Void in print("animatingAlongSideTransition")}, completion: {context -> Void in print("DoneAnimatingAlongSideTransition")})
    }
}

