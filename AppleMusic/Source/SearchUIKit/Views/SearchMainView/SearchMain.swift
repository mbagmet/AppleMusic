//
//  SearchMain.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 01.06.2022.
//

import SwiftUI
import UIKit

struct SearchMain: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = SearchMainViewController
    
    @EnvironmentObject var modelData: ModelData

    var sections: [SearchCategory] {
        return modelData.searchCategories
    }
    
    // MARK: - Conformance to UIViewControllerRepresentable
    
    func makeUIViewController(context: Context) -> SearchMainViewController {
        let collectionViewController = SearchMainViewController()
        collectionViewController.sections = self.sections

        return collectionViewController
    }
    
    func updateUIViewController(_ searchViewController: SearchMainViewController, context: Context) {
    }
}
