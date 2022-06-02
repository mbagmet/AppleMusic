//
//  SearchBar.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 02.06.2022.
//

import SwiftUI
import UIKit

struct SearchBar<Content: View>: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = SearchBarUIViewController<Content>
    
    @Binding var searchQuery: String
    @ViewBuilder var content: () -> Content
    
    func makeCoordinator() -> SearchBar.Coordinator {
        Coordinator(searchQuery: $searchQuery)
    }
    
    // MARK: - Conformance to UIViewControllerRepresentable
    func makeUIViewController(context: UIViewControllerRepresentableContext<SearchBar>) -> UIViewControllerType {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = context.coordinator
        searchController.searchBar.placeholder = "Альбомы"
        
        return SearchBarUIViewController(searchController: searchController, withContent: content())
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<SearchBar>) {
        let contentViewController = uiViewController.contentViewController
        
        contentViewController.view.removeFromSuperview()
        contentViewController.rootView = content()
        uiViewController.view.addSubview(contentViewController.view)
        contentViewController.view.frame = uiViewController.view.bounds
 
    }
    
    // MARK: - Coordinator -
    class Coordinator: NSObject, UISearchResultsUpdating, UISearchBarDelegate {
        @Binding var searchQuery: String
        
        init(searchQuery: Binding<String>) {
            _searchQuery = searchQuery
        }
        
        func updateSearchResults(for searchController: UISearchController) {
            if self.searchQuery != searchController.searchBar.text {
                self.searchQuery = searchController.searchBar.text ?? ""
            }
        }
    }
}
