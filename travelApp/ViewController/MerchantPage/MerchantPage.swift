//
//  MerchantPage.swift
//  travelApp
//
//  Created by PUTRI RAHMADEWI on 07/02/23.
//

import UIKit

class MerchantPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  @IBOutlet weak var tableView: UITableView!
  var merchant = [List]()
  
  //MARK: Table View
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return merchant.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "MerchantsTableViewCell", for: indexPath) as! MerchantsTableViewCell
    let show = merchant[indexPath.row]
    cell.lblDisplayValue?.text = show.displayValue
    cell.lblName.text = show.name
    cell.lblWebsiteProfile.text = show.websiteProfile
    let urlString = (show.images?.feature?.imageUrl)!
    let url = URL(string: urlString)!
    cell.imgData.downloaded(from: url)
    return cell
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(activityIndicator)
    
    //Activity Indicator
    activityIndicator.hidesWhenStopped = true
    activityIndicator.startAnimating()
    
    //Title Navigation Bar
    let backButton = UILabel()
    backButton.text = "Merchants Page"
    self.navigationItem.titleView = backButton
    
    self.tableView.register(UINib(nibName: MerchantsTableViewCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: "MerchantsTableViewCell")
    tableView.delegate = self
    tableView.dataSource = self
    
    codablegetservice()
  }
  
  func codablegetservice(){
    let urlString = "https://private-anon-f2977df9d6-gpimobiletakehometest.apiary-mock.com/merchants?page=1"
    let url = URL(string: urlString)!
    let session = URLSession.shared
    let dataTask = session.dataTask(with: url) { [self] data, response, error in
      if let error = error {
        print(error)
        return
      }
      guard let data = data else {
        print("data is nil")
        return
      }
      let decoder = JSONDecoder()
      do {
        let radio = try decoder.decode(MerchantModel.self, from: data)
        DispatchQueue.main.async {
          self.merchant = radio.data.list
          self.tableView.reloadData()
          self.activityIndicator.stopAnimating()
        }
      } catch {
        print("Error Parsing JSON: \(error)")
      }
    }
    dataTask.resume()
  }
  
}
