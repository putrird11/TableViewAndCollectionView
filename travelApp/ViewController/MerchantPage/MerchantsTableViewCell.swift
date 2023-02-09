//
//  MerchantsTableViewCell.swift
//  travelApp
//
//  Created by PUTRI RAHMADEWI on 08/02/23.
//

import UIKit

class MerchantsTableViewCell: UITableViewCell {
  
  @IBOutlet weak var lblName: UILabel!
  @IBOutlet weak var lblWebsiteProfile: UILabel!
  @IBOutlet weak var lblDisplayValue: UILabel!
  @IBOutlet weak var imgData: UIImageView!
  static let identifier = "MerchantsTableViewCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}
