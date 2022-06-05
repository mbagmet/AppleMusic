//
//  CategoryCollectionViewCell.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 04.06.2022.
//

import UIKit
import SnapKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"

    private lazy var titleLabel = createTextLabel(fontSize: Metric.titleLabelFontSize, color: .white)
    
    lazy var categoryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = Metric.imageCornerRadius
        
        return imageView
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Settings

    private func setupHierarchy() {
        self.addSubview(categoryImage)
        categoryImage.addSubview(titleLabel)
    }

    private func setupLayout() {
        categoryImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(categoryImage.snp.width).dividedBy(Metric.imageRatio)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Metric.leadingPadding)
            make.trailing.equalToSuperview().offset(Metric.trailingPadding)
            make.bottom.equalToSuperview().offset(Metric.bottomPadding)
        }
    }
    
    // MARK: - Private Functions
    
    private func createTextLabel(fontSize: CGFloat, color: UIColor) -> UILabel {
        let label = UILabel()
        label.textColor = color
        label.font = .systemFont(ofSize: fontSize, weight: .bold)
        label.numberOfLines = 0

        return label
    }

    // MARK: - Configuration

    public func configureCell(with category: SearchCategory) {
        categoryImage.image = UIImage(named: category.imageName)
        titleLabel.text = category.title
    }
}

// MARK: - Constants

extension CategoryCollectionViewCell {
    enum Metric {
        static let titleLabelFontSize: CGFloat = 14

        static let imageCornerRadius: CGFloat = 5
        static let imageRatio: CGFloat = 1.5
        
        static let bottomPadding: CGFloat = -10
        static let leadingPadding: CGFloat = 10
        static let trailingPadding: CGFloat = -10
    }
}
