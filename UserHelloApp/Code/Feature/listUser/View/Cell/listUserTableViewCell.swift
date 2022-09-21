//
//  listUserTableViewCell.swift
//  UserHelloApp
//
//  Created by Jaime Tejeiro on 20/9/22.
//

import UIKit

class listUserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var boxView:UIView!
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var subTitleLabel:UILabel!
    @IBOutlet weak var birthdateLabel:UILabel!
    @IBOutlet weak var dayBirthdateLabel:UILabel!
    @IBOutlet weak var MonthBirthdateLabel:UILabel!
    
    public static func nib() -> UINib {
        return UINib(nibName: listUserTableViewCell.name(), bundle: nil)
    }
    
    public static func name() -> String {
      return String(describing: listUserTableViewCell.self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        boxView.backgroundColor  = getRandomColor()
        boxView.layer.cornerRadius = boxView.frame.size.width/2
        boxView.clipsToBounds = true
        boxView.layer.borderColor = UIColor.white.cgColor
        boxView.layer.borderWidth = 5.0
        titleLabel.text = "List_User".sLocalized
        subTitleLabel.text = "List_Birthday".sLocalized
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(user:User){
        self.birthdateLabel.text =  user.formatBirtdate()
        
        var userName = user.name ?? "List_Name_Default".sLocalized
        if userName == "" {
            userName = "List_Name_Default".sLocalized
        }
        
        nameLabel.text = userName
        dayBirthdateLabel.text = user.getDayBirtdate()
        MonthBirthdateLabel.text = user.getMonthBirtdate().uppercased()
    }
    
    private func getRandomColor() -> UIColor{

        let randomRed:CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let randomGreen:CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let randomBlue:CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)

        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)

    }
}
