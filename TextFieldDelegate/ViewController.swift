//
//  ViewController.swift
//  TextFieldDelegate
//
//  Created by Roman Muzikantov on 16/08/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mTextField: UITextField!
    @IBOutlet weak var mTextView: UITextView!
    @IBOutlet weak var mPickerView: UIPickerView!
    @IBOutlet weak var mDatePicker: UIDatePicker!
    
    let data = ["Element1", "Element2", "Element3", "Element4", "Element5", "Element6", "Element7"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mTextField.delegate = self
        
        mTextView.isEditable = false
        mTextView.isSelectable = false
        mTextView.textAlignment = .center
        
        mPickerView.dataSource = self
        mPickerView.delegate = self
        
        mDatePicker.date = Date(timeIntervalSince1970: TimeInterval(-1661516807))
        mDatePicker.preferredDatePickerStyle = .wheels
        mDatePicker.datePickerMode = .countDownTimer
        mDatePicker.addTarget(self, action: #selector(didChangeDate(picker:)), for: .valueChanged)
    }
    
    @objc func didChangeDate(picker: UIDatePicker) {
        print(picker.date)
    }


}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Keyboard opened")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else {return false}
        
        let finalText = currentText.replacingCharacters(in: stringRange, with: string)
        
        print(finalText)
        
        return true
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(data[row])
    }
}


