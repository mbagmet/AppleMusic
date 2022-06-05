//
//  SearchDetail.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 02.06.2022.
//

import SwiftUI
import UIKit

struct SearchDetail: UIViewControllerRepresentable {

    typealias UIViewControllerType = SearchDetailViewController
    
    @EnvironmentObject var modelData: ModelData
    
    var sections: [AlbumSection] {
        return modelData.sections
    }
    
    // MARK: - Conformance to UIViewControllerRepresentable
    
    func makeUIViewController(context: Context) -> SearchDetailViewController {
        let collectionViewController = SearchDetailViewController()
        collectionViewController.sections = self.sections

        return collectionViewController
    }
    
    func updateUIViewController(_ uiViewController: SearchDetailViewController, context: Context) {
    }
}
