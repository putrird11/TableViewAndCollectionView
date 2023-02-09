//
//  VoucherModel.swift
//  travelApp
//
//  Created by PUTRI RAHMADEWI on 08/02/23.
//

import Foundation

struct VoucherModel: Decodable{
  var data: DataVoucher
  
  enum CodingKeys: String, CodingKey {
    case data = "data"
  }
}

struct DataVoucher: Decodable{
  var list: [ListVoucher]
  
  enum CodingKeys: String, CodingKey {
    case list
  }
}

struct ListVoucher: Decodable{
  var rsn: String
  var displayValue: String
  var status: String
  var validFrom: String
  var validUntil: String
  var voucherCode: String
  var voucherValue: Int
  var authenticationRequired: Bool
  var voucherURL: Int?
  var urlOnly: Bool
  var isPendingTransfer: Bool
  var referralCode: Int?
  var referralExpiry: Int?
  var scanToUse: Bool
  var partner: Partner
  var images: Images
  
  enum CodingKeys: String, CodingKey {
    case rsn = "RSN"
    case displayValue = "DisplayValue"
    case status = "Status"
    case validFrom = "ValidFrom"
    case validUntil = "ValidUntil"
    case voucherCode = "VoucherCode"
    case voucherValue = "VoucherValue"
    case authenticationRequired = "AuthenticationRequired"
    case voucherURL = "VoucherURL"
    case urlOnly = "URLOnly"
    case isPendingTransfer = "IsPendingTransfer"
    case referralCode = "ReferralCode"
    case referralExpiry = "ReferralExpiry"
    case scanToUse = "ScanToUse"
    case partner = "Partner"
    case images = "Images"
  }
}

struct Partner: Decodable{
  var id: String
  var rsn: String
  var displayValue: String
  
  enum CodingKeys: String, CodingKey {
    case id = "ID"
    case rsn = "RSN"
    case displayValue = "DisplayValue"
  }
}

struct Images: Decodable{
  var feature: Features
  
  enum CodingKeys: String, CodingKey {
    case feature = "Feature"
  }
}

struct Features: Decodable{
  var imageUrl: String
  
  enum CodingKeys: String, CodingKey {
    case imageUrl = "ImageURL"
  }
}
