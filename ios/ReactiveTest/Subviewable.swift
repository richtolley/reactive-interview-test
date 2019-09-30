//
//  Subviewable.swift
//  ReactiveTest
//
//  Created by Richard Tolley on 29/09/2019.
//  Copyright © 2019 Richard Tolley. All rights reserved.
//

import Foundation

protocol Subviewable {
  func setupViews()
  func setupHierarchy()
  func setupConstraints()
}

extension Subviewable {
  func setup() {
    setupViews()
    setupHierarchy()
    setupConstraints()
  }
}

