//
//  MyUIKitViewController.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-11-26.
//

import Foundation

import UIKit

class MyUIKitViewController: UIViewController {
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        label.text = "Hello from Binal"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
                    label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                ])
    }
}
