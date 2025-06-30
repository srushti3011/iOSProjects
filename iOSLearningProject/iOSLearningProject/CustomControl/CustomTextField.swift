//
//  CustomTextField.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 25/06/25.
//

import UIKit

class CustomTextField: UITextField {

    // MARK: - Image Properties
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }

    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }

    // MARK: - Appearance Properties
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = true
        }
    }

    @IBInspectable var customFontSize: CGFloat = 14 {
        didSet {
            updateFont()
        }
    }

    @IBInspectable var customFontName: String = "" {
        didSet {
            updateFont()
        }
    }

    @IBInspectable var placeholderColor: UIColor = .lightGray {
        didSet {
            updatePlaceholder()
        }
    }

    @IBInspectable var textColorCustom: UIColor = .black {
        didSet {
            textColor = textColorCustom
        }
    }

    // MARK: - Initializers
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib")
        updateView()
    }

    // MARK: - Update Methods
    private func updateView() {
        setupLeftView()
        setupRightView()
        updateFont()
        updatePlaceholder()
        textColor = textColorCustom
    }

    private func setupLeftView() {
        if let image = leftImage {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
            imageView.frame = CGRect(x: 5, y: 0, width: 20, height: 20)
            containerView.addSubview(imageView)
            leftView = containerView
            leftViewMode = .always
        } else {
            leftView = nil
        }
    }

    private func setupRightView() {
        if let image = rightImage {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
            imageView.frame = CGRect(x: 5, y: 0, width: 20, height: 20)
            containerView.addSubview(imageView)
            rightView = containerView
            rightViewMode = .always
        } else {
            rightView = nil
        }
    }

    private func updateFont() {
        if !customFontName.isEmpty {
            font = UIFont(name: customFontName, size: customFontSize)
        } else {
            font = UIFont.systemFont(ofSize: customFontSize)
        }
    }

    private func updatePlaceholder() {
        guard let placeholderText = placeholder else { return }
        attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [
            NSAttributedString.Key.foregroundColor: placeholderColor
        ])
    }
}
