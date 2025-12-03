//
//  MyUIKitViewControllerRepresentable.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-11-26.
//

import Foundation


import SwiftUI
import UIKit

struct MyUIKitViewControllerRepresentable: UIViewControllerRepresentable {
    //We are representing UIKit View inside SwiftUI through this wrapper
    func makeUIViewController(context: Context) -> MyUIKitViewController {
        MyUIKitViewController()
    }
    
    func updateUIViewController(_ uiViewController: MyUIKitViewController, context: Context) {
        
    }
}
