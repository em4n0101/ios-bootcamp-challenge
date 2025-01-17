//
//  CardView.swift
//  iOS Bootcamp Challenge
//
//  Created by Marlon David Ruiz Arroyave on 28/09/21.
//

import UIKit

class CardView: UIView {

    private let margin: CGFloat = 30
    var card: Card?

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 27)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy private var itemsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        stackView.spacing = margin/2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    required init(card: Card) {
        self.card = card
        super.init(frame: .zero)
        setup()
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        setupUI()
    }

    private func setup() {
        guard let card = card else { return }

        card.items.forEach { _ in }

        titleLabel.text = card.title
        backgroundColor = .white
        layer.cornerRadius = 20
    }

    private func setupUI() {
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: margin * 2).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: margin).isActive = true
        titleLabel.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.70).isActive = true
        
        addSubview(itemsStackView)
        itemsStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: margin).isActive = true
        itemsStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant:  margin).isActive = true
        itemsStackView.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 1.0).isActive = true
        
        // Display pokemon info (eg. types, abilities)
        card?.items.forEach { item in
            let itemTitleLabel = UILabel()
            itemTitleLabel.textAlignment = .left
            itemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            itemTitleLabel.text = item.title
            itemTitleLabel.font = UIFont.boldSystemFont(ofSize: 17)
            itemsStackView.addArrangedSubview(itemTitleLabel)

            let itemDescriptionLabel = UILabel()
            itemDescriptionLabel.textAlignment = .left
            itemDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            itemDescriptionLabel.text = item.description.capitalized
            itemDescriptionLabel.textColor = .darkGray
            itemDescriptionLabel.font = UIFont.systemFont(ofSize: 17)
            itemsStackView.addArrangedSubview(itemDescriptionLabel)

        }
     }

}
