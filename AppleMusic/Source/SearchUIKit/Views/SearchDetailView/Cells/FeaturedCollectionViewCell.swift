//
//  FeaturedCollectionViewCell.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 03.06.2022.
//

import UIKit
import SnapKit

class FeaturedCollectionViewCell: UICollectionViewCell {
    static let identifier = "FeaturedCollectionViewCell"

    private lazy var parentStackView = createStackView(axis: .vertical, distribution: .equalSpacing, alignment: .fill)
    
    private lazy var lineSeparator = makeLineSeparator()
    
    private lazy var titleDescriptionLabel = createTextLabel(fontSize: Metric.titleDescriptionLabelFontSize, color: .systemGray)
    private lazy var titleLabel = createTextLabel(fontSize: Metric.titleLabelFontSize, color: .label)
    private lazy var authorLabel = createTextLabel(fontSize: Metric.titleLabelFontSize, color: .systemGray)
    
    lazy var albumImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = Metric.imageCornerRadius
        
        return imageView
    }()
    
    private lazy var descriptionLabel = createTextLabel(fontSize: Metric.descriptionLabelFontSize, color: .white)

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
        self.addSubview(lineSeparator)
        self.addSubview(parentStackView)

        parentStackView.addArrangedSubview(titleDescriptionLabel)
        parentStackView.addArrangedSubview(titleLabel)
        parentStackView.addArrangedSubview(authorLabel)
        
        self.addSubview(albumImage)
        albumImage.addSubview(descriptionLabel)
    }

    private func setupLayout() {
        makeLineSeparatorConstraints(line: lineSeparator)
        
        parentStackView.snp.makeConstraints { make in
            make.top.equalTo(lineSeparator.snp.bottom).offset(Metric.topPadding)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }

        albumImage.snp.makeConstraints { make in
            make.top.equalTo(parentStackView.snp.bottom).offset(Metric.topPadding)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(albumImage.snp.width).dividedBy(Metric.imageRatio)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Metric.leadingPadding)
            make.trailing.equalToSuperview().offset(Metric.trailingPadding)
            make.bottom.equalToSuperview().offset(Metric.bottomPadding)
        }
    }
    
    // MARK: - Private Functions
    
    private func createStackView(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, alignment: UIStackView.Alignment) -> UIStackView {
        let stackView = UIStackView()

        stackView.axis = axis
        stackView.distribution = distribution
        stackView.alignment = alignment

        
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }
    
    private func createTextLabel(fontSize: CGFloat, color: UIColor) -> UILabel {
        let label = UILabel()
        label.textColor = color
        label.font = .systemFont(ofSize: fontSize, weight: .regular)

        return label
    }
    
    private func makeLineSeparator() -> UIView {
        let line = UIView()
        line.layer.borderColor = UIColor.systemGray.cgColor
        line.layer.borderWidth = (1.0 / UIScreen.main.scale) / 2

        return line
    }
    
    private func makeLineSeparatorConstraints(line: UIView) {
        line.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
    }

    // MARK: - Configuration

    public func configureCell(with album: Album) {
        albumImage.image = UIImage(named: album.imageName)
        titleDescriptionLabel.text = album.titleDescription
        titleLabel.text = album.title
        descriptionLabel.text = album.description
        
        if let author = album.author {
            authorLabel.text = author
        }
    }
}

// MARK: - Constants

extension FeaturedCollectionViewCell {
    enum Metric {
        static let titleLabelFontSize: CGFloat = 20
        static let titleDescriptionLabelFontSize: CGFloat = 16
        static let descriptionLabelFontSize: CGFloat = 12

        static let imageCornerRadius: CGFloat = 5
        static let imageRatio: CGFloat = 1.8
        
        static let topPadding: CGFloat = 10
        static let bottomPadding: CGFloat = -10
        static let leadingPadding: CGFloat = 10
        static let trailingPadding: CGFloat = -10
    }
}
