//
//  SearchDetailUIViewControllerConstants+Ext.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 02.06.2022.
//

import UIKit

// MARK: - Constants

extension SearchDetailViewController {
    enum Metrics {
        // For group width accounting
        static let estimatedItemWidth: CGFloat = 230
        static let distanceBetweenItems: CGFloat = 0.03
        static let heightWidthMultiplier: CGFloat = 1.28
        
        // For full width group width accounting
        static let featuredEstimatedItemWidth: CGFloat = 400
        static let featuredDistanceBetweenItems: CGFloat = 0.06
        static let featuredHeightWidthMultiplier: CGFloat = 0.85
        
        // Items in column quantity
        static let itemsInColumn: CGFloat = 1
        static let doubledItemsInColumn: CGFloat = 2
        
        // Section item dimensions
        static let itemWidth: CGFloat = 1.0
        static let itemHeight: CGFloat = 1.0
        static let doubledItemHeight: CGFloat = 0.5
        static let fixedItemHeight: CGFloat = 56
        
        static let itemTopPadding: CGFloat = 0
        static let itemLeadingPadding: CGFloat = 5
        static let itemBottomPadding: CGFloat = 20
        static let horizontalItemBottomPadding: CGFloat = 0
        static let itemTrailingPadding: CGFloat = 5

        // Section paddings
        static let sectionTopPadding: CGFloat = 0
        static let sectionLeadingPadding: CGFloat = 10
        static let sectionBottomPadding: CGFloat = 5
        static let lastSectionBottomPadding: CGFloat = 100
        static let sectionTrailingPadding: CGFloat = 14
        
        // Section header paddings
        static let headerVerticalPadding: CGFloat = 0
        static let headerHorizontalPadding: CGFloat = 6
    }
}
