//
//  SearchViewController.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 07/03/25.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableViewList: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var imgSelectedImage: UIImageView!
    
    var searchText: String = ""
    var searched: Bool = false
    var searching: Bool = false
    let items = [
        "Hospital",
        "Cinema",
        "Park",
        "Residential area",
        "Temple",
        "Hotel"
    ]
    
    var itemsFound: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableViewList.delegate = self
        tableViewList.dataSource = self
        tableViewList.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchTableViewCell")
    }
    
    @IBAction func btnAddImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
//        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("Began editing")
        itemsFound = []
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("text is changing")
        self.searchText = searchBar.text ?? ""
        itemsFound = items.filter{ $0.contains(searchText) }
        searching = true
        tableViewList.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchText = searchBar.text ?? ""
        itemsFound = items.filter{ $0.contains(searchText) }
        searchBar.resignFirstResponder()
        searched = true
        searching = true
        tableViewList.reloadData()
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searched || searching) && searchText != "" {
            return itemsFound.count
        } else {
            return items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewList.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        if (searched || searching) && searchText != "" {
            cell.configure(value: itemsFound[indexPath.row])
        } else {
            cell.configure(value: items[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension SearchViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true)
        guard let image = info[.originalImage] else {return}
        print(image)
        imgSelectedImage.image = image as? UIImage
    }
    
    
}
