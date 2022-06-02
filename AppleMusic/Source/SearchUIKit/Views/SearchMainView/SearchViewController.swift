//
//  SearchViewController.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 01.06.2022.
//

import SwiftUI
import UIKit

struct SearchViewController: UIViewControllerRepresentable {
    
    // MARK: - Conformance to UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> UIViewController {
        return SearchUIViewController()
    }
    
    func updateUIViewController(_ searchViewController: UIViewController, context: Context) {
        // TODO
    }
}
