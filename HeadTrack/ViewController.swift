//
//  ViewController.swift
//  HeadTrack
//
//  Created by Abhimanyu on 9/13/20.
//  Copyright © 2020 Abhimanyu. All rights reserved.
//

import UIKit
import Socket
import os.log
class ViewController: UIViewController {
    let addr = "192.168.1.75"
    let port: Int32 = 5060
    var fullAddr: Socket.Address?
    var socket: Socket?
    
    @IBAction func connectToHost(_ sender: Any) {

         fullAddr = Socket.createAddress(for: addr, on: port)
        os_log("Created Socket at %@!", type: .info, addr)
        do {
            socket =  try Socket.create(family: .inet, type: .datagram, proto: .udp)
        } catch {
            os_log("Error sending message", type: .error)
        }
    
    }
    @IBAction func sendUDP(_ sender: Any) {
        do {
            try socket?.write(from: "Hello!", to: fullAddr!)
            try socket?.write(from: "Different Packet!", to: fullAddr!)
            os_log("Sent message with size", type: .info)
        } catch {
            os_log("Error sendng packets", type: .error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

