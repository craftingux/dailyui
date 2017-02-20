//
//  ViewController.swift
//  DailyUI 004
//
//  NOTE: This is an exercise in rapid prototyping.
//        Production code should look considerably different.
//        The goal is to have this built in under 45 minutes (Hard Stop)
//        Not all functions are fully baked out.
//
//  Created by Joshua Hamilton on 2/8/17.
//  Copyright © 2017 craftingux. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var labelTotal: UILabel!
  
  var total: Double = 0.0
  var modifier: String = ""
  var action: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    labelTotal.text = "\(total)"
  }
  
  @IBAction func appendValue(_ sender: UIButton) {
    modifier += sender.titleLabel?.text ?? ""
    print(modifier)
    labelTotal.text = "\(modifier)"
  }
  
  @IBAction func add(_ sender: Any) {
    if total == 0.0 {
      total = Double(modifier)!
    }
    modifier = ""
    action = "add"
  }
  
  @IBAction func subtract(_ sender: Any) {
    if total == 0.0 {
      total = Double(modifier)!
    }
    modifier = ""
    action = "subtract"
  }
  
  @IBAction func multiply(_ sender: Any) {
    if total == 0.0 {
      total = Double(modifier)!
    }
    modifier = ""
    action = "multiply"
  }
  
  @IBAction func divide(_ sender: Any) {
    if total == 0.0 {
      total = Double(modifier)!
    }
    modifier = ""
    action = "divide"
  }
  
  @IBAction func calculate(_ sender: Any) {
    print("MODIFIER: \(Double(modifier)!)")
    switch action {
    case "add":
      total = total + Double(modifier)!
    case "subtract":
      total = total - Double(modifier)!
    case "multiply":
      total = total * Double(modifier)!
      print(total)
    case "divide":
      total = total / Double(modifier)!
    default:
      total = total + 0
    }
    
    labelTotal.text = "\(total)"
  }
  
  @IBAction func calculatePercentage(_ sender: Any) {
  }
  
  @IBAction func clearTotal(_ sender: Any) {
    total = 0.0
    modifier = ""
    action = ""
    labelTotal.text = "\(total)"
  }
  
  @IBAction func toggleNegation(_ sender: Any) {
  }
}

