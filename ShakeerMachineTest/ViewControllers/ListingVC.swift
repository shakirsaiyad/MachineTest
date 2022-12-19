//
//  ListingVC.swift
//  ShakeerMachineTest
//
//  Created by Praveen Tamboli on 16/12/22.
//

import UIKit

class ListingVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    private var arrNotes: [NoteList]?

    override func viewDidLoad() {
        super.viewDidLoad()
        getAllNotes()
    }
    
    //MARK: - fetch data
    func getAllNotes() {
        
        RestAPIManager.sharedInstance.fetchNotes { arr in
            self.arrNotes = arr
            
            DispatchQueue.main.async {
                self.tableView.reloadData()

            }}
    }
    
    //MARK: - profile tap to see user details
    @objc func profileTap(sender: UIButton){
        let buttonTag = sender.tag
        self.performSegue(withIdentifier: "segueUserDetails", sender: buttonTag)
    }

}
// MARK: - Tablview DataSource and Delegate ------------------------------
extension ListingVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrNotes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListingTableViewCell") as! ListingTableViewCell
        cell.dict = arrNotes?[indexPath.row]
        cell.btnUserDetail.tag = indexPath.row
        cell.btnUserDetail.addTarget(self, action: #selector(profileTap(sender:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "SegueNotesDetail", sender: self.arrNotes?[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return UITableView.automaticDimension
    }
}

//MARK: - Extension prepare segues
extension ListingVC {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "SegueNotesDetail" {
                if let viewController = segue.destination as? NotesDetailVC {
                    if let tempDict = sender as? NoteList {
                        viewController.dict = tempDict
                    }
                }
            }
        else if segue.identifier == "segueUserDetails" {
            if let viewController = segue.destination as? UserDetailViewController {
                if let index = sender as? Int {
                    viewController.dict = arrNotes![index]
                }
            }
        }
    }
        
        }
