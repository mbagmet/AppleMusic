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
    
    @Binding var isSearching: Bool
    @Binding var searchQuery: String
    @ViewBuilder var content: () -> Content
    
    @State var scopeBarItems = ["Apple Music", "Ваша медиатека"]
    @State var placeholder = "Apple Music"
    
    func makeCoordinator() -> SearchBar.Coordinator {
        Coordinator(isSearching: $isSearching,
                    searchQuery: $searchQuery,
                    scopeBarItems: $scopeBarItems,
                    placeholder: $placeholder)
    }
    
    // MARK: - Conformance to UIViewControllerRepresentable
    func makeUIViewController(context: UIViewControllerRepresentableContext<SearchBar>) -> UIViewControllerType {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = context.coordinator
        
        searchController.searchBar.placeholder = placeholder
        searchController.searchBar.scopeButtonTitles = scopeBarItems
        
        searchController.searchBar.delegate = context.coordinator
        
        return SearchBarUIViewController(searchController: searchController, withContent: content())
    }
    
    func updateUIViewController(_ uiViewController: SearchBarUIViewController<Content>, context: UIViewControllerRepresentableContext<SearchBar>) {
        // MARK: Search controller
        uiViewController.searchController.searchBar.placeholder = placeholder
        
        // MARK: Content Controller
        let contentViewController = uiViewController.contentViewController
        
        contentViewController.view.removeFromSuperview()
        contentViewController.rootView = content()
        uiViewController.view.addSubview(contentViewController.view)
        contentViewController.view.frame = uiViewController.view.bounds
    }
    
    // MARK: - Coordinator -
    class Coordinator: NSObject, UISearchResultsUpdating, UISearchBarDelegate {
        @Binding var isSearching: Bool
        @Binding var searchQuery: String
        
        @Binding var scopeBarItems: [String]
        @Binding var placeholder: String
        
        init(isSearching: Binding<Bool>,
             searchQuery: Binding<String>,
             scopeBarItems: Binding<[String]>,
             placeholder: Binding<String>) {
            
            _isSearching = isSearching
            _searchQuery = searchQuery
            _scopeBarItems = scopeBarItems
            _placeholder = placeholder
        }
        
        // MARK: - Search Results Update
        func updateSearchResults(for searchController: UISearchController) {
            if self.searchQuery != searchController.searchBar.text {
                self.searchQuery = searchController.searchBar.text ?? ""
            }
            
            if searchController.isActive {
                isSearching = true
            } else {
                isSearching = false
            }
        }
        
        // MARK: - Search Bar Delegate
        func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
            placeholder = scopeBarItems[selectedScope]
        }
    }
}
