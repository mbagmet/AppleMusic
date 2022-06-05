//
//  HotTracksCollectionViewCell.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 03.06.2022.
//

import UIKit
import SnapKit

class HotTracksCollectionViewCell: UICollectionViewListCell {
    static let identifier = "HotTracksCollectionViewCell"

    private lazy var parentStackView = createStackView(axis: .vertical, distribution: .equalSpacing, alignment: .fill)
    private lazy var lineSeparator = makeLineSeparator()
    private lazy var secondStackView = createStackView(axis: .horizontal, distribution: .equalSpacing, alignment: .center)
    private lazy var thirdStackView = createStackView(axis: .vertical, distribution: .equalSpacing, alignment: .leading)
    
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
    
    private lazy var showMenuButton: UIButton = {
        let button = UIButton(type: .system)
        button.showsMenuAsPrimaryAction = true
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        
        return button
    }()
    
    private lazy var menu: UIMenu = {
        let showAlbum = UIAction(title: Strings.showAlbumTitle, image: UIImage(systemName: "music.note.house")) { _ in }
        let shareSong = UIAction(title: Strings.shareSongTitle, image: UIImage(systemName: "square.and.arrow.up")) { _ in }
        
        let menu = UIMenu(children: [showAlbum, shareSong])
        return menu
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupHierarchy()
        setupLayout()
        setupMenu()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Settings

    private func setupHierarchy() {
        addSubview(albumImage)
        addSubview(parentStackView)

        parentStackView.addArrangedSubview(lineSeparator)
        parentStackView.addArrangedSubview(secondStackView)
        
        secondStackView.addArrangedSubview(thirdStackView)
        secondStackView.addArrangedSubview(showMenuButton)
        
        thirdStackView.addArrangedSubview(titleLabel)
        thirdStackView.addArrangedSubview(authorLabel)
    }

    private func setupLayout() {
        
        makeLineSeparatorConstraints(line: lineSeparator)
        
        albumImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview().offset(-5)
            make.height.equalTo(albumImage.snp.width)
        }
        
        parentStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(albumImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            
        }
        
        secondStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(1)
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }
        
        secondStackView.spacing = Metric.secondStackViewSpacing
    }

    private func setupMenu() {
        showMenuButton.menu = menu
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
        albumImage.image = UIImage(named: album.smallImageName)
        titleLabel.text = album.title
        
        if let author = album.author {
            authorLabel.text = author
        }
    }
}

// MARK: - Constants

extension HotTracksCollectionViewCell {
    enum Metric {
        static let titleLabelFontSize: CGFloat = 18
        static let authorLabelFontSize: CGFloat = 12

        static let imageCornerRadius: CGFloat = 3
        
        static let secondStackViewSpacing: CGFloat = 10
    }
    
    enum Strings {
        static let showAlbumTitle = "Показать альбом"
        static let shareSongTitle = "Поделиться песней..."
    }
}
