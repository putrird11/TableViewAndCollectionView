//
//  HomePage.swift
//  travelApp
//
//  Created by PUTRI RAHMADEWI on 07/02/23.
//

import UIKit
import SafariServices
import WebKit

class HomePage: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  //Activity Indicator
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  var promo = [DataPromo]()
  
  //Inisialisasi
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var lbl: UILabel!
  private var dataTask: URLSessionDataTask?
  private var webMerchants = ""
  
  //size cell
  var estimateWidth = 160
  var cellMarginSize = 16
  
  //MARK: Collection View
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return promo.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
    let show = promo[indexPath.row]
    cell.lblPromo.text =  "Promo " + "\(show.order)"
    
    let urlString = (show.imageUrl)
    if let url = URL(string: urlString){
      cell.imgPromo.downloaded(from: url)
    } else{
      print("succes")
    }
    return cell
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    self.setupGridView()
    DispatchQueue.main.async {
      self.collectionView.reloadData()
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = self.calculateWith()
    return CGSize(width: width, height: 120)
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
    
    //To Web View
    let show = promo[indexPath.row]
    let url = URL(string: show.url)!
    let safariVC: SFSafariViewController = SFSafariViewController(url: url)

    self.present(safariVC, animated: true, completion: nil)
  }
  
  func calculateWith() -> CGFloat{
    let estimateWidth = CGFloat(estimateWidth)
    let cellCount = floor(CGFloat(self.view.frame.size.width / estimateWidth))
    let margin = CGFloat(cellMarginSize * 2)
    let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
    return width
  }
  
  func setupGridView(){
    let flow = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
    flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    getServicePromo()
    
    //Activity Indicator
    activityIndicator.hidesWhenStopped = true
    activityIndicator.startAnimating()
    
    //Collection View
    self.collectionView.delegate = self
    self.collectionView.dataSource = self
    
    self.collectionView.register(UINib(nibName: HomeCollectionViewCell.identifier, bundle: Bundle.main), forCellWithReuseIdentifier:  "HomeCollectionViewCell")
    self.setupGridView()
    
    //Button Navugation Bar
    let merchantsButton: UIBarButtonItem = UIBarButtonItem(title: "merchants", image: UIImage(systemName: "bag"), target: self, action: #selector(toMerchantsPage))
    let voucherButton: UIBarButtonItem = UIBarButtonItem(title: "merchants", image: UIImage(systemName: "dollarsign.square"), target: self, action: #selector(toVoucherPage))
    self.navigationItem.leftBarButtonItem = merchantsButton
    self.navigationItem.rightBarButtonItem = voucherButton
  }
  
  //Action Button Navigation Bar
  @objc func toMerchantsPage() {
    let controller = MerchantPage()
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  @objc func toVoucherPage() {
    let controller = VoucherPage()
    self.navigationController?.pushViewController(controller, animated: true)
  }
  
  //Get API Service
  func getServicePromo(){
    let urlString = "https://private-anon-f2977df9d6-gpimobiletakehometest.apiary-mock.com/home"
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
        let radio = try decoder.decode(HomeModel.self, from: data)
        DispatchQueue.main.async {
          self.promo = radio.data.layout.promo.data
          self.collectionView.reloadData()
          self.activityIndicator.stopAnimating()
        }
      } catch {
        print("Error Parsing JSON: \(error)")
      }
    }
    dataTask.resume()
  }
}
