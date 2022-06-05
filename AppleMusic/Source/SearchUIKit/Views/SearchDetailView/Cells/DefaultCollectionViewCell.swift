//
//  DefaultCollectionViewCell.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 03.06.2022.
//

import UIKit
import SnapKit

class DefaultCollectionViewCell: UICollectionViewCell {
    static let identifier = "DefaultCollectionViewCell"

    private lazy var parentStackView = createStackView(axis: .vertical, distribution: .equalSpacing, alignment: .fill)
    
    private lazy var titleLabel = createTextLabel(fontSize: Metric.titleLabelFontSize, color: .black)
    private lazy var authorLabel = createTextLabel(fontSize: Metric.authorLabelFontSize, color: .systemGray)
    
    lazy var albumImage: UIImageView = {
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
        addSubview(parentStackView)

        parentStackView.addArrangedSubview(albumImage)
        parentStackView.addArrangedSubview(titleLabel)
        parentStackView.addArrangedSubview(authorLabel)
    }

    private func setupLayout() {
        parentStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        albumImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(albumImage.snp.width)
        }
    }
    
    // MARK: - Private Functions
    
    private func createStackView(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, alignment: UIStackView.Alignment) -> UIStackView {
        let stackView = UIStackView()

        stackView.axis = axis
        stackView.distribution = distribution
        stackView.alignment = alignment
        //stackView.spacing = 1
        
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }
    
    private func createTextLabel(fontSize: CGFloat, color: UIColor) -> UILabel {
        let label = UILabel()
        label.textColor = color
        label.font = .systemFont(ofSize: fontSize, weight: .regular)

        return label
    }

    // MARK: - Configuration

    public func configureCell(with album: Album) {
        albumImage.image = UIImage(named: album.smallImageName)
        titleLabel.text = album.title
        
        if let author = album.author {
            authorLabel.text = author
        }
    }
}

// MARK: - Constants

extension DefaultCollectionViewCell {
    enum Metric {
        static let titleLabelFontSize: CGFloat = 16
        static let authorLabelFontSize: CGFloat = 15

        static let imageCornerRadius: CGFloat = 5
    }
}
