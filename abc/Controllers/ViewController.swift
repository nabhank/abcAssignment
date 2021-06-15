//
//  ViewController.swift
//  abc
//
//  Created by MacBook Pro on 15/06/21.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UISearchBarDelegate {
    
    @IBOutlet weak var productTable: UITableView!
    @IBOutlet weak var categoryCollection: UICollectionView!
    @IBOutlet weak var productTableHeightContant: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var searchBar: UISearchBar!
    
   // var searchbar = UISearchBar()
    
    var categories:[Category] = []
    var products_array:[Product] = []
    var products_arrayFromResult:[Product] = []
    var currentVisibleCellIndex:IndexPath = [0,0] // for dectection the collection scroll

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadCategories()

        // Do any additional setup after loading the view.
    }
    
    
    func loadCategories(){
        let ai = self.startAnActivityIndicator()
        API.sharedInstance().getCategories { (result, error) in
            DispatchQueue.main.async {
                ai.stopAnimating()
            }
            self.categories = result ?? []
            print(self.categories)
            DispatchQueue.main.async {
                if self.categories.count > 0{
                    self.loadProducts(categoryId: self.categories[0].categoryId)
                }
                
                self.categoryCollection.reloadData()
            }
            
        }
    }
    
    func loadProducts(categoryId:String){
        let ai = self.startAnActivityIndicator()
        API.sharedInstance().getProducts(categoryId: categoryId) { (result, error) in
            DispatchQueue.main.async {
                ai.stopAnimating()
            
                
                self.products_arrayFromResult = result ?? []
                self.products_array = self.products_arrayFromResult
                print(self.products_array)
            
                self.productTable.reloadData()
            }
        }
           
            
            
        
    }
    
    //MARK: - Search bar delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            print("searchText \(searchText)")
        if searchText != ""{
            print(self.products_arrayFromResult)
            self.products_array = self.products_arrayFromResult.filter {
                $0.title.contains(searchText)
            }
        }
        else{
            self.products_array = self.products_arrayFromResult
        }
        
        self.productTable.reloadData()
    }
    
    
    
    //MARK:- collection
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:Category_CC! = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? Category_CC
        cell.setCell(category: self.categories[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width), height: (collectionView.frame.height))
    }
    

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == self.categoryCollection {
            self.loadProducts(categoryId: self.categories[indexPath.row].categoryId)
           // self.pageView.currentPage = indexPath.item
        }
    }
    
    //MARK: - table delegate and datasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        DispatchQueue.main.async {
            self.productTableHeightContant.constant = self.view.layer.frame.size.height
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:product_TC! = tableView.dequeueReusableCell(withIdentifier: "cell") as? product_TC
        cell.setCell(product:self.products_array[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//     if(section == 0){
//       // tableView.tableHeaderView = searchbar
//            let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 100))
//        view.addSubview(searchbar)
//            searchbar.sizeToFit()
//        return view
//        }
//        return nil
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 100
//    }

    
}

