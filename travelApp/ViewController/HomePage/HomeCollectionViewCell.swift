//
//  HomeCollectionViewCell.swift
//  travelApp
//
//  Created by PUTRI RAHMADEWI on 08/02/23.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "HomeCollectionViewCell"
  @IBOutlet weak var lblPromo: UILabel!
  @IBOutlet weak var imgPromo: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
}
