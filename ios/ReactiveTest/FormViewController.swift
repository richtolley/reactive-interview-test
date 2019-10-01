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
  private let nameErrorLabel = UILabel()
  private let passwordField = UITextField()
  private let passwordErrorLabel = UILabel()
  private let toggleSwitch = UISwitch()
  private let toggleSwitchLabel = UILabel()
  private let submitButton = UIButton()
  private let viewModel: FormViewModel

  init(viewModel: FormViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
}

extension FormViewController: Subviewable {
  func setupViews() {
    view.backgroundColor = .white
    titleLabel.text = "Reactive Test"
    titleLabel.textAlignment = .center

    nameField.placeholder = "Name"
    nameErrorLabel.textColor = .red

    nameErrorLabel.font = UIFont.systemFont(ofSize: 12)
    nameErrorLabel.text = "Describe wrongness here"

    passwordField.placeholder = "Password"
    passwordErrorLabel.textColor = .red
    passwordErrorLabel.text = "Describe wrongness here"
    passwordErrorLabel.font = UIFont.systemFont(ofSize: 12)

    toggleSwitchLabel.text = "Subscribe to the newsletter?"
    toggleSwitch.isOn = true

    submitButton.setTitle("Submit", for: .normal)
    submitButton.backgroundColor = .systemBlue
  }

  func setupHierarchy() {
    view.addSubview(titleLabel)
    view.addSubview(nameField)
    view.addSubview(nameErrorLabel)
    view.addSubview(passwordField)
    view.addSubview(passwordErrorLabel)
    view.addSubview(toggleSwitch)
    view.addSubview(toggleSwitchLabel)
    view.addSubview(submitButton)
  }

  func setupConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50)
    ])


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

    nameErrorLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      nameErrorLabel.topAnchor.constraint(equalTo: self.nameField.bottomAnchor, constant: 20),
      nameErrorLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
      nameErrorLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50)
    ])

    passwordField.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      passwordField.topAnchor.constraint(equalTo: self.nameErrorLabel.bottomAnchor, constant: 30),
      passwordField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
      passwordField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50)
    ])

    passwordErrorLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      passwordErrorLabel.topAnchor.constraint(equalTo: self.passwordField.bottomAnchor, constant: 30),
      passwordErrorLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
      passwordErrorLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50)
    ])

    toggleSwitch.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      toggleSwitch.topAnchor.constraint(equalTo: self.passwordErrorLabel.bottomAnchor, constant: 30),
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

