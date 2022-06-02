//
//  SearchBarUIViewController.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 02.06.2022.
//

import UIKit
import SwiftUI

class SearchBarUIViewController<Content: View>: UIViewController {
    let searchController: UISearchController
    let contentViewController: UIHostingController<Content>
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupView()
//        setupSearch()
    }
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        
        guard let parent = parent,
              parent.navigationItem.searchController == nil
        else { return }
        
        parent.navigationItem.searchController = searchController
    }
    
    // MARK: - Settings
    
    func setupHierarchy() {
        view.addSubview(contentViewController.view)
    }
    
    func setupView() {
        contentViewController.view.frame = view.bounds
    }
    
    func setupSearch() {
        searchController.searchBar.placeholder = "Альбомы"
    }
    
    // MARK: - Initializers
    
    init(searchController: UISearchController, withContent content: Content) {
        self.contentViewController = UIHostingController(rootView: content)
        self.searchController = searchController
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
