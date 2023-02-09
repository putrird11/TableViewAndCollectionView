//
//  VoucherTableViewCell.swift
//  travelApp
//
//  Created by PUTRI RAHMADEWI on 08/02/23.
//

import UIKit

class VoucherTableViewCell: UITableViewCell {
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var imgVoucher: UIImageView!
  @IBOutlet weak var lblVoucher: UILabel!
  @IBOutlet weak var lblDate: UILabel!
  static let identifier = "VoucherTableViewCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}
