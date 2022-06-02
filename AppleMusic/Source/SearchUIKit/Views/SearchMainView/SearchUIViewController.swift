//
//  SearchUIViewController.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 01.06.2022.
//

import UIKit

class SearchUIViewController: UIViewController {

    // MARK: - Properties
    
//    private lazy var searchController: UISearchController = {
//        var search = UISearchController(searchResultsController: nil)
//        search.obscuresBackgroundDuringPresentation = false
//        search.searchBar.placeholder = Strings.searchBarPlaceholder
//
//        return search
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        setupNavigation()
//        setupSeach()

        self.view.backgroundColor = .systemTeal
        // Do any additional setup after loading the view.
    }

}

//// MARK: - Navigation
//
//extension SearchUIViewController {
//    private func setupNavigation() {
//        navigationItem.title = Strings.navigationTitle
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//    }
//}
//
//// MARK: - Search
//
//extension SearchUIViewController {
//    private func setupSeach() {
//        navigationItem.searchController = searchController
//    }
//}

// MARK: - Constants

extension SearchUIViewController {
    enum Strings {
        static let searchBarPlaceholder = "Ваша медиатека"
        static let navigationTitle = "Поиск"
    }
}
