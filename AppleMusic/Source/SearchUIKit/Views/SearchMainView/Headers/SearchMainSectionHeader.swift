//
//  SearchMainSectionHeader.swift
//  AppleMusic
//
//  Created by Михаил Багмет on 04.06.2022.
//

import UIKit

class SearchMainSectionHeader: UICollectionReusableView {
    static let identifier = "SearchMainSectionHeader"
    
    // MARK: - Views
    
    private lazy var lineSeparator = makeLineSeparator()
    
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
        title.text = Strings.sectionTitleText

        return title
    }()
    
    // MARK: - Settings

    private func setupHierarchy() {
        addSubview(lineSeparator)
        addSubview(parentStackView)
        parentStackView.addArrangedSubview(sectionTitle)
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
}

extension SearchMainSectionHeader {
    enum Metric {
        static let sectionTitleSize: CGFloat = 22
        
        static let prentStackViewTopPadding: CGFloat = 10
        static let prentStackViewBottobPadding: CGFloat = -10
    }

    enum Strings {
        static let sectionTitleText: String = "Поиск по категориям"
    }
}
