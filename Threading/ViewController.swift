//
//  ViewController.swift
//  Threading
//
//  Created by Prashant G on 9/19/18.
//  Copyright © 2018 MyOrg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Create your own Queue to avoid using Main Queue
        let queue = DispatchQueue(label: "work-queue")
        queue.async {
            // do my work here...
        }
        
        // Create your own QoS Queue to avoid using Main Queue
        let qosQueue = DispatchQueue(label: "qos-work-queue", qos: .background)
        qosQueue.async {
            // Task which you want to perform in background comes here...
        }
        
        // Current thread you are on
        print("You are on thread - \(Thread.current)")
        
        // Check if you are on the Main thread or not
        if Thread.current.isMainThread {
            print("on Main thread")
        }
        else{
            print("not on Main thread")
        }
        
        // *** Update UI always on the Main thread ***
        DispatchQueue.main.async {
            // Eg - self.imageContainer.image = imageFromData
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

