//
//  SearchViewController.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 01.06.2022.
//

import SwiftUI
import UIKit

struct SearchViewController: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = SearchUIViewController
    
    // MARK: - Conformance to UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> SearchUIViewController {
        return SearchUIViewController()
    }
    
    func updateUIViewController(_ searchViewController: SearchUIViewController, context: Context) {
        // TODO
    }
}
