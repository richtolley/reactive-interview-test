//
//  FormViewController.swift
//  ReactiveTest
//
//  Created by Richard Tolley on 27/09/2019.
//  Copyright © 2019 Richard Tolley. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class FormViewController: UIViewController {
  private let titleLabel = UILabel()
  private let nameField = UITextField()
  private let passwordField = UITextField()
  private let optionSegment = UISegmentedControl(items: ["First", "Second"])
  private let toggleSwitch = UISwitch()
  private let toggleSwitchLabel = UILabel()
  private let submitButton = UIButton()


  init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  //var name: Observable<String>? { return nameField.rx }
  //var password: Observable<String> { return passwordField.rx }

  var viewModel: FormViewModel?



  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }

  func bindViewModel(viewModel: FormViewModel) {

    
  }
}

extension FormViewController: Subviewable {
  func setupViews() {
    view.backgroundColor = .white
    titleLabel.text = "Form Test"
    titleLabel.textAlignment = .center
    nameField.placeholder = "Name"
    passwordField.placeholder = "Password"
    toggleSwitchLabel.text = "Toggle"
    submitButton.setTitle("Submit", for: .normal)
    submitButton.backgroundColor = .systemBlue
  }

  func setupHierarchy() {
    view.addSubview(titleLabel)
    view.addSubview(nameField)
    view.addSubview(passwordField)
    view.addSubview(optionSegment)
    view.addSubview(toggleSwitch)
    view.addSubview(toggleSwitchLabel)
    view.addSubview(submitButton)
  }

  func setupConstraints() {
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50)
    ])

    nameField.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      nameField.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20),
      nameField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
      nameField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50)
    ])

    passwordField.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      passwordField.topAnchor.constraint(equalTo: self.nameField.bottomAnchor, constant: 30),
      passwordField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
      passwordField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50)
    ])

    optionSegment.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      optionSegment.topAnchor.constraint(equalTo: self.passwordField.bottomAnchor, constant: 30),
      optionSegment.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
      optionSegment.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50)
    ])

    toggleSwitch.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      toggleSwitch.topAnchor.constraint(equalTo: self.optionSegment.bottomAnchor, constant: 30),
      toggleSwitch.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50)
    ])

    toggleSwitchLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      toggleSwitchLabel.centerYAnchor.constraint(equalTo: self.toggleSwitch.centerYAnchor, constant: 0),
      toggleSwitchLabel.trailingAnchor.constraint(equalTo: self.toggleSwitch.leadingAnchor, constant: -50)
    ])

    submitButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      submitButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 70),
      submitButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -70),
      submitButton.topAnchor.constraint(equalTo: self.toggleSwitch.bottomAnchor, constant: 20)
    ])

  }


}

