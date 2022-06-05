//
//  SearchMainViewController.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 04.06.2022.
//

import UIKit
import SnapKit

class SearchMainViewController: UIViewController {

    // MARK: - Properties
    
    var sections: [SearchCategory] = []
    
    // MARK: - Views
    
    lazy var collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
    
    // MARK: - Lificycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()

        registerCells()
        setupCollectionView()
    }
    
    // MARK: - Settings

    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = .systemBackground
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func registerCells() {
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.register(SearchMainSectionHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: SearchMainSectionHeader.identifier)
    }
}

extension SearchMainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categoryName = sections[indexPath.item].title
        collectionView.deselectItem(at: indexPath, animated: true)
        navigationController?.pushViewController(HostingSearchDetail(title: categoryName), animated: true)

    }
}

extension SearchMainViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        
        let item = sections[indexPath.item]
        cell.configureCell(with: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                               withReuseIdentifier: SearchMainSectionHeader.identifier,
                                                               for: indexPath)
    }
}
