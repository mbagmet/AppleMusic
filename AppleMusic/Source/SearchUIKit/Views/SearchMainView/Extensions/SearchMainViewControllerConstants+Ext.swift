//
//  SearchMainViewControllerConstants+Ext.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 04.06.2022.
//

import UIKit

// MARK: - Constants

extension SearchMainViewController {
    enum Metrics {
        // For group width accounting
        static let estimatedItemWidth: CGFloat = 230
        static let heightWidthMultiplier: CGFloat = 2.3
        static let groupWidth: CGFloat = 1.0
        
        // Section item dimensions
        static let itemWidth: CGFloat = 0.5
        static let itemHeight: CGFloat = 1.0
        
        static let itemTopPadding: CGFloat = 0
        static let itemLeadingPadding: CGFloat = 5
        static let itemBottomPadding: CGFloat = 20
        static let itemTrailingPadding: CGFloat = 5

        // Section paddings
        static let sectionTopPadding: CGFloat = 0
        static let sectionLeadingPadding: CGFloat = 10
        static let sectionBottomPadding: CGFloat = 100
        static let sectionTrailingPadding: CGFloat = 14
        
        // Section header paddings
        static let headerVerticalPadding: CGFloat = 0
        static let headerHorizontalPadding: CGFloat = 6
        

        static let sectionTitleSize: CGFloat = 21
    }
}
