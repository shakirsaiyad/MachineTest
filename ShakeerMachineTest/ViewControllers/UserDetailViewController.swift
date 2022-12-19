//
//  UserDetailViewController.swift
//  ShakeerMachineTest
//
//  Created by Praveen Tamboli on 18/12/22.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var imgUserProfile: UIImageView!
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var lblUserPoint: UILabel!
    @IBOutlet weak var lblFriendCount: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblAboutDetail: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblFavouriteTag: UILabel!
    @IBOutlet weak var lblFavCounsin: UILabel!
    @IBOutlet weak var lblFavDestination: UILabel!
    @IBOutlet weak var lblAdditionalDetail: UILabel!
    @IBOutlet weak var lblUserReported: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserLocation: UILabel!
    
    //MARK: - variables
    var dict:NoteList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
}

//MARK: - setData
extension UserDetailViewController{
    
    func setData(){
        if let userDict = dict{
            self.title = userDict.userDetails.name
            lblUserName.text = userDict.userDetails.name
            lblUserLocation.text = userDict.userDetails.location
            let coverUrl = URL(string: userDict.coverPic.url)
            imgCover.sd_setImage(with: coverUrl, placeholderImage: UIImage(named: "placeholder"))
            let profileUrl = URL(string: userDict.userDetails.upload?.url ?? "")
            imgCover.sd_setImage(with: profileUrl, placeholderImage: UIImage(named: "placeholder"))
            let arrFavTag = userDict.userDetails.userFavTags.map { $0.name}
            lblFavouriteTag.text = arrFavTag.joined(separator: ",")
           lblFavCounsin.text = userDict.userDetails.favCuisines
            lblLocation.text = userDict.userDetails.location
            let arrDestination = userDict.userDetails.userFavDreamDestinations.map { $0.locations}
            lblFavouriteTag.text = arrDestination.joined(separator: ",")
            lblAdditionalDetail.text = userDict.userDetails.additionalDetails?.rawValue
            lblGender.text = userDict.userDetails.gender?.rawValue
            lblUserPoint.text = "\(userDict.userDetails.userPoint)"
            lblFriendCount.text = "\(userDict.userDetails.totalFriends)"
            lblAboutDetail.text = "\(userDict.userDetails.aboutUs ?? "")"
            lblUserReported.text = userDict.reported == true ? "Yes" : "No"
        }
    }
}
