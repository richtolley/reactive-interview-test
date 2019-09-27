//
//  FormViewController.swift
//  ReactiveTest
//
//  Created by Richard Tolley on 27/09/2019.
//  Copyright © 2019 Richard Tolley. All rights reserved.
//

import UIKit
import ReactiveKit

class FormViewController: UIViewController {
  @IBOutlet weak var nameField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
  @IBOutlet weak var optionSegment: UISegmentedControl!
  @IBOutlet weak var toggleSwitch: UISwitch!
  @IBOutlet weak var submitButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

