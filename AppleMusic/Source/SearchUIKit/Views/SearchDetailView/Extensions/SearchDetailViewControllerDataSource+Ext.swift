//
//  SearchDetailUIViewControllerDataSource+Ext.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 04.06.2022.
//

import UIKit

// MARK: - CollectionView DiffableDataSource

extension SearchDetailViewController {
    
    // MARK: - Diffable Data source
    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<AlbumSection, Album>(collectionView: collectionView,
                                                                             cellProvider: { (collectionView, indexPath, album) -> UICollectionViewCell? in
            switch self.sections[indexPath.section].type {
                
            case .featured:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedCollectionViewCell.identifier,
                                                              for: indexPath) as? FeaturedCollectionViewCell
                cell?.configureCell(with: album)
                return cell
                
            case .surroundedAudio, .playlists:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DefaultCollectionViewCell.identifier,
                                                              for: indexPath) as? DefaultCollectionViewCell
                cell?.configureCell(with: album)
                return cell
                
            case .hotTracks:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotTracksCollectionViewCell.identifier,
                                                              for: indexPath) as? HotTracksCollectionViewCell
                cell?.configureCell(with: album)
                return cell
                
            case .unknown:
                fatalError("Unknown section type!")
            }
        })
        
        self.getHeaderData()
    }
    
    // MARK: - Header Data source
    private func getHeaderData() {
        let headerSuplementaryRegistration = UICollectionView.SupplementaryRegistration<SearchDetailSectionHeader>(
            elementKind: UICollectionView.elementKindSectionHeader) { sectionHeaderView, elementKind, indexPath in

            guard let firstItem = self.dataSource?.itemIdentifier(for: indexPath) else { return }
            guard let section = self.dataSource?.snapshot().sectionIdentifier(containingItem: firstItem) else { return }

            guard section.title != nil else { return }
            sectionHeaderView.configureHeader(with: section)
        }

        dataSource?.supplementaryViewProvider = { collectionView, kind, indexPath in
            return  collectionView.dequeueConfiguredReusableSupplementary(using: headerSuplementaryRegistration, for: indexPath)
        }
    }
    
    // MARK: NSDiffableDataSourceSnapshot
    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<AlbumSection, Album>()
        snapshot.appendSections(sections)
        
        for section in sections {
            snapshot.appendItems(section.items, toSection: section)
        }
        
        dataSource?.apply(snapshot)
    }
}
