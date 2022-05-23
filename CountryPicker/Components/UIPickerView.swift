//
//  UIPickerView.swift
//  CountryPicker
//
//  Created by FELIPE AUGUSTO SILVA on 23/05/22.
//

import Foundation
import UIKit

protocol PickerDelegate: AnyObject {
    func didSelectCountry(country: String)
}

class Picker: UIPickerView {

    var list: [String] = []
    var pickerDelegate: PickerDelegate?

    //MARK: - Initializer

    init(list: [String]) {
        self.list = list
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Methods
    func setup() {
        delegate = self
        dataSource = self
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}


    //MARK: - Extension
extension Picker: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("selected country \(list[row])")
        pickerDelegate?.didSelectCountry(country: list[row])
    }

}
