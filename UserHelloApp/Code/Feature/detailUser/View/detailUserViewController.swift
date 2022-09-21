//
//  detailUserViewController.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 21/9/22.
//

import UIKit


class detailUserViewController: BaseViewController {
        
    // MARK: - Properties
    var presenter: detailUserPresenter?
    
    @IBOutlet weak var boxView:UIView!
    
    @IBOutlet weak var titleLabel:UILabel!
    
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var nameTextLabel:UILabel!
    @IBOutlet weak var subTitleLabel:UILabel!
    @IBOutlet weak var birthdateLabel:UILabel!
    @IBOutlet weak var dayBirthdateLabel:UILabel!
    @IBOutlet weak var MonthBirthdateLabel:UILabel!
    
    private var detailUser:User!
    
    
    
    
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

    @objc func backButtonPressed(sender: Any) {
     
    }
    
    @objc func AddButtonPressed(sender: Any) {
    }
    
}
// MARK: - BillViewController
extension detailUserViewController: detailUserView {
   
    func showDetailUser(user: User) {
        self.stopLoading()
        detailUser = user
        self.configView()
    }
    
    
    func showAlertError(title: String, message: String) {
        
    }
    
}
// MARK: - Private methods
private extension detailUserViewController {
    
    // MARK: - Setup
    func setupInit() {
        self.startLoading()
        self.boxView.backgroundColor = getRandomColor()
        self.titleLabel.text = "Detail_Title".sLocalized
        self.nameLabel.text = "List_User".sLocalized
        self.subTitleLabel.text = "List_Birthday".sLocalized
    }
    
    
    func configView() {
        self.birthdateLabel.text =  detailUser.formatBirtdate()
        nameTextLabel.text = detailUser.name ?? "List_Name_Default".sLocalized
        dayBirthdateLabel.text = detailUser.getDayBirtdate()
        MonthBirthdateLabel.text = detailUser.getMonthBirtdate().uppercased()
    }
    
    
    func getRandomColor() -> UIColor{
        
        let randomRed:CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let randomGreen:CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let randomBlue:CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
}
