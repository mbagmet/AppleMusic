//
//  SearchDetailSectionHeader.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 03.06.2022.
//

import UIKit
import SnapKit

class SearchDetailSectionHeader: UICollectionReusableView {
    
    static let identifier = "SearchDetailSectionHeader"
    
    // MARK: - Views
    
    private lazy var parentStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing

        return stackView
    }()
    
    lazy var sectionTitle: UILabel = {
        let title = UILabel()
        title.textColor = .label
        title.font = .systemFont(ofSize: Metric.sectionTitleSize, weight: .bold)

        return title
    }()
    
    private lazy var toAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Strings.buttonText, for: .normal)
        button.setTitleColor(.tintColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: Metric.buttonTextSize, weight: .regular)

        return button
    }()
    
    private lazy var lineSeparator = makeLineSeparator()
    
    // MARK: - Settings

    private func setupHierarchy() {
        addSubview(lineSeparator)
        addSubview(parentStackView)
        parentStackView.addArrangedSubview(sectionTitle)
        parentStackView.addArrangedSubview(toAllButton)
    }

    private func setupLayout() {
        parentStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Metric.prentStackViewTopPadding)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(Metric.prentStackViewBottobPadding)
        }
        
        makeLineSeparatorConstraints(line: lineSeparator)
    }
    
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
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

    public func configureHeader(with section: AlbumSection) {
        sectionTitle.text = section.title
    }
}

extension SearchDetailSectionHeader {
    enum Metric {
        static let sectionTitleSize: CGFloat = 22
        static let buttonTextSize: CGFloat = 16
        
        static let prentStackViewTopPadding: CGFloat = 10
        static let prentStackViewBottobPadding: CGFloat = -10
    }

    enum Strings {
        static let buttonText: String = "См. все"
    }
}
