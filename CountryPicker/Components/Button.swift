//
//  button.swift
//  CountryPicker
//
//  Created by FELIPE AUGUSTO SILVA on 23/05/22.
//

import Foundation
import UIKit

class Button: UIButton {

    public enum Size {
        case large
        case medium
        case small
    }

    public enum State {
        case `default`
        case loading
        case disabled
    }

    public enum Style {
        case primary
        case secondary
    }

    public var buttonState: State {
        didSet { didUpdateState() }
    }
    public private(set) var size: Size
    public private(set) var title: String
    public private(set) var style: Style

        //MARK: - Initializer
    public init(size: Size, title: String, style: Style, state: State = .default) {
        buttonState = state
        self.size = size
        self.title = title
        self.style = style
        super.init(frame: .zero)
        self.setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

        //MARK: - Methods Setup
    private func didUpdateState() {
    }

    private func setup() {
        buttonSetup()
        setupTitleFont()
        setupContentEdgeInsets()
    }

    private func buttonSetup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        setTitle(self.title, for: .normal)
        self.layer.cornerRadius = 5

        switch style {
        case .primary:
            backgroundColor = UIColor(named: "primary")
        case .secondary:
            backgroundColor = .black
            titleLabel?.tintColor = .white
        }
    }

    private func setupTitleFont() {
        switch size {
        case .small:
            titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        case .medium:
            titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        case .large:
            titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        }
    }


        //MARK: - Content Edge Insets
    private var smallContentEdgeInsets: UIEdgeInsets {
        UIEdgeInsets(top: 2, left:2, bottom: 2, right: 2)
    }

    private var largeContentEdgeInsets: UIEdgeInsets {
        UIEdgeInsets(top: 5, left:5, bottom: 5, right: 5)
    }

    private var mediumContentEdgeInsets: UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    private func setupContentEdgeInsets() {
        switch size {
        case .small:
            contentEdgeInsets =  smallContentEdgeInsets
        case .medium:
            contentEdgeInsets = mediumContentEdgeInsets
        case .large:
            contentEdgeInsets = largeContentEdgeInsets
        }
    }
}
