//
//  AddUserViewController.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 21/9/22.
//

import UIKit
import Foundation


class AddUserViewController: BaseViewController {
    
    
    // MARK: - Properties
    var presenter: AddUserPresenter?
    
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var SubDateLabel:UILabel!
    
    @IBOutlet weak var nameText:UITextField!
    @IBOutlet weak var dateText:UITextField!
    
    @IBOutlet weak var sendButton:UIButton!
    @IBOutlet weak var cancelButton:UIButton!
    
    private var sendDate:Date!
    var delegate:AddUserPopUpDelegate!
    
    
    //MARK: - View Life Cycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
        setupInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presenter?.viewDidAppear()
    }
    
    
    // MARK: IBActions
    @IBAction func sendButtonAction(_ sender: Any) {
        
        if nameText.text == "" {
            return
        }
        
        if nameText.text == nil{
            return
        }
        
        if dateText.text == "" {
           return
        }
        
        if dateText.text == nil {
           return
        }
        
        if sendDate == nil {
           return
        }
        self.startLoading()
        self.presenter?.onsendButtonAction(name: (nameText.text ?? "") , bDate: sendDate)
    }
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        self.presenter?.onBackAction()
    }
    
    @objc
    func cancelAction() {
        self.dateText.resignFirstResponder()
    }
    
    @objc
    func doneAction() {
        if let datePickerView = self.dateText.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM yyyy"
            let dateString = dateFormatter.string(from: datePickerView.date)
            self.dateText.text = dateString
            
            self.sendDate = datePickerView.date
            print(datePickerView.date)
            print(dateString)
            
            self.dateText.resignFirstResponder()
        }
    }
    
    
}
// MARK: - AddUserViewController
extension AddUserViewController: AddUserView {
    
    func showAddUser() {
        self.stopLoading()
        self.delegate.addUserCloseViewController()
        self.presenter?.onBackAction()
    }
    
    
    func showAlertError(title: String, message: String) {
        self.stopLoading()
        self.ShowAlert(title: title, message: message)
    }
    
}
// MARK: - Private methods
private extension AddUserViewController {
    
    // MARK: - Setup
    func setupInit() {
        
        self.titleLabel.text = "Add_Title".sLocalized
        self.nameLabel.text = "Add_Title_Box".sLocalized
        self.SubDateLabel.text = "Add_Subtitle_Box".sLocalized
        
        self.nameText.placeholder = "Add_Title".sLocalized
        self.dateText.placeholder = "Add_Title".sLocalized
        
        self.sendButton.setTitle("Add_Send_Button".sLocalized, for: .normal)
        self.cancelButton.setTitle("Add_Cancel_Button".sLocalized, for: .normal)
        
        self.dateText.datePicker(target: self,
                                 doneAction: #selector(doneAction),
                                 cancelAction: #selector(cancelAction),
                                 datePickerMode: .date)
    }
    
    
    func configView() {
        
    }
    
}

extension UITextField {
    func datePicker<T>(target: T,
                       doneAction: Selector,
                       cancelAction: Selector,
                       datePickerMode: UIDatePicker.Mode = .date) {
        let screenWidth = UIScreen.main.bounds.width
        
        func buttonItem(withSystemItemStyle style: UIBarButtonItem.SystemItem) -> UIBarButtonItem {
            let buttonTarget = style == .flexibleSpace ? nil : target
            let action: Selector? = {
                switch style {
                case .cancel:
                    return cancelAction
                case .done:
                    return doneAction
                default:
                    return nil
                }
            }()
            
            let barButtonItem = UIBarButtonItem(barButtonSystemItem: style,
                                                target: buttonTarget,
                                                action: action)
            
            return barButtonItem
        }
        
        let datePicker = UIDatePicker(frame: CGRect(x: 0,
                                                    y: 0,
                                                    width: screenWidth,
                                                    height: 216))
        datePicker.datePickerMode = datePickerMode
        self.inputView = datePicker
        
        let toolBar = UIToolbar(frame: CGRect(x: 0,
                                              y: 0,
                                              width: screenWidth,
                                              height: 44))
        toolBar.setItems([buttonItem(withSystemItemStyle: .cancel),
                          buttonItem(withSystemItemStyle: .flexibleSpace),
                          buttonItem(withSystemItemStyle: .done)],
                         animated: true)
        self.inputAccessoryView = toolBar
    }
}
