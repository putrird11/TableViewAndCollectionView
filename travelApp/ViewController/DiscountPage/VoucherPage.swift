//
//  VoucherPage.swift
//  travelApp
//
//  Created by PUTRI RAHMADEWI on 07/02/23.
//

import UIKit

class VoucherPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  @IBOutlet weak var tableView: UITableView!
  var voucher = [ListVoucher]()
  
  //MARK: Table View
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return voucher.count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 210
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
  {
    let verticalPadding: CGFloat = 10
    
    let maskLayer = CALayer()
    maskLayer.cornerRadius = 12
    maskLayer.backgroundColor = UIColor.black.cgColor
    maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
    cell.layer.mask = maskLayer
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "VoucherTableViewCell", for: indexPath) as! VoucherTableViewCell
    let show = voucher[indexPath.row]
    cell.lblVoucher.text = "Rp. " + "\(show.voucherValue)"
    cell.lblTitle.text = show.displayValue
    
    let urlString = (show.images.feature.imageUrl)
    let url = URL(string: urlString)!
    cell.imgVoucher.downloaded(from: url)
    
    cell.lblDate.text = show.validUntil
    return cell
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //Activity Indicator
    activityIndicator.hidesWhenStopped = true
    activityIndicator.startAnimating()
    
    //Title Navigation Bar
    let backButton = UILabel()
    backButton.text = "Voucher Page"
    self.navigationItem.titleView = backButton
    
    self.tableView.register(UINib(nibName: VoucherTableViewCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: "VoucherTableViewCell")
    tableView.delegate = self
    tableView.dataSource = self
    
    getservice()
  }
  
  func getservice(){
    let urlString = "https://private-anon-f2977df9d6-gpimobiletakehometest.apiary-mock.com/vouchers"
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
        let radio = try decoder.decode(VoucherModel.self, from: data)
        DispatchQueue.main.async {
          self.voucher = radio.data.list
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
