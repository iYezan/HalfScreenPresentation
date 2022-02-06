//
//  ViewController.swift
//  HalfScreenPresentation
//
//  Created by iYezan on 03/02/2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        // 2 Add action
        registerButton.addTarget(self, action: #selector(presentModalController), for: .touchUpInside)
    }
    // 1 Defined UI views
    lazy var titleLabel: UILabel = {
        let label   = UILabel()
        label.text  = "Lorem Ipsum"
        label.font  = .boldSystemFont(ofSize: 32)
        return label
    }()
    
    lazy var textView: UITextView = {
        let  textView   = UITextView(frame: .zero)
        textView.font   = UIFont.systemFont(ofSize: 16)
        textView.isEditable = false
        textView.text   = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sem fringilla ut morbi tincidunt augue interdum. Ut morbi tincidunt augue interdum velit euismod in pellentesque massa. Pulvinar etiam non quam lacus suspendisse faucibus interdum posuere. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci a. Eget nullam non nisi est sit amet. Odio pellentesque diam volutpat commodo. Id eu nisl nunc mi ipsum faucibus vitae."
        return textView
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor      = view.tintColor
        button.layer.cornerRadius   = 8
        button.clipsToBounds        = true
        return button
    }()
    
    lazy var containerStackView: UIStackView = {
        let spacer = UIView()
        let stackView   = UIStackView(arrangedSubviews: [titleLabel, textView, spacer, registerButton])
        stackView.axis  = .vertical
        stackView.spacing   = 16.8
        return stackView
    }()
    
    func setupView() {
        view.backgroundColor = .systemBackground
    }
    // 3 Add subviews and set constraints
    func setupConstraints() {
        view.addSubview(containerStackView)
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea    = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            // 5 Set containerStackView edges to superview with 24 spacing
            containerStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 24),
            containerStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -24),
            containerStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 24),
            containerStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -24),
            // 6 Set button height
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    // 7 To be updated
    @objc func presentModalController() {
    }
}

