//
//  SearchDetailUIViewControllerCompositionLayout+Ext.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 04.06.2022.
//

import UIKit

// MARK: - Compositional Layout

extension SearchDetailViewController {
    
    // MARK: - Create Playlists and Surrounded Audio sections Layout
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let section = self.sections[sectionIndex]
            
            switch section.type {
                
            case .featured:
                return self.createSection(isFeatured: true, itemHeight: Metrics.itemHeight, itemsInColumn: Metrics.itemsInColumn, environment: layoutEnvironment)
            case .surroundedAudio:
                return self.createSection(isFeatured: false, itemHeight: Metrics.itemHeight, itemsInColumn: Metrics.itemsInColumn, environment: layoutEnvironment)
            case .playlists:
                return self.createSection(isFeatured: false, itemHeight: Metrics.doubledItemHeight, itemsInColumn: Metrics.doubledItemsInColumn, environment: layoutEnvironment)
            case .hotTracks:
                return self.createHorizontalSection(itemsInColumn: Metrics.doubledItemsInColumn, environment: layoutEnvironment)
            case .unknown:
                fatalError("Unknown section type!")
            }
        }
        
        return layout
    }
    
    // MARK: - Create default sections
    private func createSection(isFeatured: Bool,
                       itemHeight: CGFloat,
                       itemsInColumn: CGFloat,
                       environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metrics.itemWidth),
                                              heightDimension: .fractionalHeight(itemHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets.init(top: Metrics.itemTopPadding,
                                                          leading: Metrics.itemLeadingPadding,
                                                          bottom: Metrics.itemBottomPadding,
                                                          trailing: Metrics.itemTrailingPadding)
        
        let estimatedItemWidth = isFeatured ? Metrics.featuredEstimatedItemWidth : Metrics.estimatedItemWidth
        let distanceBetweenItems = isFeatured ? Metrics.featuredDistanceBetweenItems : Metrics.distanceBetweenItems
        let heightWidthMultiplier = isFeatured ? Metrics.featuredHeightWidthMultiplier : Metrics.heightWidthMultiplier
        
        let itemsInRowCount = environment.container.effectiveContentSize.width / estimatedItemWidth
        let groupWidth: CGFloat = 1 / (itemsInRowCount.rounded()) - distanceBetweenItems
        let groupHeight: CGFloat = groupWidth * heightWidthMultiplier * itemsInColumn
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(groupWidth), heightDimension: .fractionalWidth(groupHeight))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets.init(top: Metrics.sectionTopPadding,
                                                             leading: Metrics.sectionLeadingPadding,
                                                             bottom: Metrics.sectionBottomPadding,
                                                             trailing: Metrics.sectionTrailingPadding)
        if !isFeatured {
            let header = createSectionHeader()
            section.boundarySupplementaryItems = [header]
        }
        
        return section
    }
    
    // MARK: - Create horizontal section
    private func createHorizontalSection(itemsInColumn: CGFloat,
                                 environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metrics.itemWidth),
                                              heightDimension: .absolute(Metrics.fixedItemHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets.init(top: Metrics.itemTopPadding,
                                                          leading: Metrics.itemLeadingPadding,
                                                          bottom: Metrics.horizontalItemBottomPadding,
                                                          trailing: Metrics.itemTrailingPadding)
        
        let itemsInRowCount = environment.container.effectiveContentSize.width / Metrics.featuredEstimatedItemWidth
        let groupWidth: CGFloat = 1 / (itemsInRowCount.rounded()) - Metrics.featuredDistanceBetweenItems
        let groupHeight: CGFloat = (Metrics.fixedItemHeight + Metrics.horizontalItemBottomPadding) * itemsInColumn
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(groupWidth), heightDimension: .absolute(groupHeight))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets.init(top: Metrics.sectionTopPadding,
                                                             leading: Metrics.sectionLeadingPadding,
                                                             bottom: Metrics.lastSectionBottomPadding,
                                                             trailing: Metrics.sectionTrailingPadding)
        let header = createSectionHeader()
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    // MARK: - Create Header
    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .estimated(1))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .top)
        sectionHeader.contentInsets = NSDirectionalEdgeInsets.init(top: Metrics.headerVerticalPadding,
                                                                   leading: Metrics.headerHorizontalPadding,
                                                                   bottom: Metrics.headerVerticalPadding,
                                                                   trailing: Metrics.headerHorizontalPadding)
        return sectionHeader
    }
}
