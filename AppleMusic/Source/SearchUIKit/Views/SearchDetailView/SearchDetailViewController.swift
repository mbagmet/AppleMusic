//
//  SearchDetailViewController.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 04.06.2022.
//

import UIKit

class SearchDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var sections: [AlbumSection] = []
    var dataSource: UICollectionViewDiffableDataSource<AlbumSection, Album>?
    
    // MARK: - Views
    
    lazy var collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
    
    // MARK: - Lificycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        
        setupHierarchy()

        setupCollectionView()
        registerCells()
        
        createDataSource()
        reloadData()
    }
    
    // MARK: - Settings

    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .systemBackground
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func registerCells() {
        collectionView.register(FeaturedCollectionViewCell.self, forCellWithReuseIdentifier: FeaturedCollectionViewCell.identifier)
        collectionView.register(DefaultCollectionViewCell.self, forCellWithReuseIdentifier: DefaultCollectionViewCell.identifier)
        collectionView.register(HotTracksCollectionViewCell.self, forCellWithReuseIdentifier: HotTracksCollectionViewCell.identifier)
        
        collectionView.register(SearchDetailSectionHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: SearchDetailSectionHeader.identifier)
    }
}
