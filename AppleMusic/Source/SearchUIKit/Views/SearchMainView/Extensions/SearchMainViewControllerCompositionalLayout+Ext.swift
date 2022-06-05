//
//  SearchMainViewControllerCompositionalLayout+Ext.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 04.06.2022.
//

import UIKit

// MARK: - Compositional Layout

extension SearchMainViewController {
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in

            return self.createSection()
        }
        
        return layout
    }
    
    func createSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metrics.itemWidth),
                                              heightDimension: .fractionalHeight(Metrics.itemHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets.init(top: Metrics.itemTopPadding,
                                                          leading: Metrics.itemLeadingPadding,
                                                          bottom: Metrics.itemBottomPadding,
                                                          trailing: Metrics.itemTrailingPadding)

        let groupHeight: CGFloat = Metrics.itemWidth / Metrics.heightWidthMultiplier
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(Metrics.groupWidth),
                                               heightDimension: .fractionalHeight(groupHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        section.contentInsets = NSDirectionalEdgeInsets.init(top: Metrics.sectionTopPadding,
                                                             leading: Metrics.sectionLeadingPadding,
                                                             bottom: Metrics.sectionBottomPadding,
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
