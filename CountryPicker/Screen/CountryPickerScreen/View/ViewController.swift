//
//  ViewController.swift
//  CountryPicker
//
//  Created by FELIPE AUGUSTO SILVA on 23/05/22.
//

import UIKit



class ViewController: UIViewController {

    //MARK: - Variables
    let imageView: UIImageView = {
        let imageName = "bees"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var picker = Picker(list: ["Brazil", "France", "Spain", "Italy", "Portugal", "Germany", "France", "Spain", "Italy", "Portugal", "Germany"])
    let button = Button(size: .medium, title: "Select", style: .primary)

    let viewModel = CountryPickerViewModel()
    var countrySelected: String = ""

    //MARK: - Initializer

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        imageSetup()
        pickerSetup()
        selectButton()
    }


    //MARK: -  Layout Setup
    func imageSetup() {
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(lessThanOrEqualTo: view.topAnchor, constant: 140),
            imageView.widthAnchor.constraint(equalToConstant: 160),
            imageView.heightAnchor.constraint(equalToConstant: 140),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    func pickerSetup() {
        view.addSubview(picker)

        NSLayoutConstraint.activate([
            picker.topAnchor.constraint(equalTo: imageView.bottomAnchor ,constant: 30),
            picker.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            picker.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            picker.heightAnchor.constraint(equalToConstant: 180)
        ])
    }

    func selectButton() {
        view.addSubview(button)
        button.addTarget(self, action: #selector(handleButtonSelected), for: .touchUpInside)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: picker.bottomAnchor, constant: 55),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}

// MARK: - Extension

extension ViewController: PickerDelegate {

    func didSelectCountry(country: String) {
        print("test")
        countrySelected = country

    }

    @objc func handleButtonSelected() {
        print(countrySelected)
        viewModel.handleCountrySelect(country: countrySelected)
    }
}
