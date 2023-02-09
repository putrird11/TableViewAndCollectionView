//
//  Model.swift
//  travelApp
//
//  Created by PUTRI RAHMADEWI on 07/02/23.
//

import Foundation

struct HomeModel: Decodable{
  var data: Dataa
  
  enum CodingKeys: String, CodingKey {
    case data
  }
}

struct Dataa: Decodable{
  var layout: Layout
  
  enum CodingKeys: String, CodingKey {
    case layout
  }
}

struct Layout: Decodable{
  var menu: [Menu]
  var promo: Promo
  
  enum CodingKeys: String, CodingKey {
    case menu, promo
  }
  
}

struct Promo: Decodable{
  var title: String
  var data: [DataPromo]
  
  enum CodingKeys: String, CodingKey {
    case title, data
  }
}

struct Menu: Decodable{
  var logoUrl: String
  var label:  String
  var id: String
  var deeplink: String
  var enable: Bool
  var visible: Bool
  
  enum CodingKeys: String, CodingKey {
    case logoUrl, label, id, deeplink, enable, visible
  }
}

struct DataPromo: Decodable{
  var id: Int
  var imageUrl: String
  var order: Int
  var url: String
  
  enum CodingKeys: String, CodingKey {
    case id, imageUrl, order, url
  }
}



