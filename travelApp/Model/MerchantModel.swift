//
//  MerchantMode.swift
//  travelApp
//
//  Created by PUTRI RAHMADEWI on 08/02/23.
//

import Foundation

struct MerchantModel: Decodable{
  var data: DataMerchant
  
  enum CodingKeys: String, CodingKey {
    case data = "data"
  }
}

struct DataMerchant: Decodable{
  var list: [List]
  
  enum CodingKeys: String, CodingKey {
    case list
  }
}

struct List: Decodable{
  var id: String
  var rsn: String
  var name: String
  var displayValue: String
  var url: String
  var websiteProfile: String
  var partnerCategory: Category?
  var images: Image?
  
  enum CodingKeys: String, CodingKey {
    case id = "ID"
    case rsn = "RSN"
    case name = "Name"
    case displayValue = "DisplayValue"
    case url = "URL"
    case websiteProfile = "WebsiteProfile"
    case partnerCategory = "PartnerCategory"
    case images = "Images"
  }
}

struct Category: Decodable{
  var rsn: Int?
  var displayValue: String
  var partnerCategoryID: String
  
  enum CodingKeys: String, CodingKey {
    case rsn = "RSN"
    case displayValue = "DisplayValue"
    case partnerCategoryID = "PartnerCategoryID"
  }
}

struct Image: Decodable{
  var feature: Feature?
  
  enum CodingKeys: String, CodingKey {
    case feature = "Feature"
  }
}

struct Feature: Decodable{
  var imageUrl: String
  var thumbnailUrl: Int?
  
  enum CodingKeys: String, CodingKey {
    case imageUrl = "ImageURL"
    case thumbnailUrl = "ThumbnailURL"
  }
}
