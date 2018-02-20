//
//  PaymentTableViewCell.swift
//  AdPay
//
//  Created by Korman Chen on 2/19/18.
//  Copyright © 2018 Korman Chen. All rights reserved.
//

import UIKit

class PaymentTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
