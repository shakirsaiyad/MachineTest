//
//  NotesDetailVC.swift
//  ShakeerMachineTest
//
//  Created by Praveen Tamboli on 16/12/22.
//

import UIKit
import FloatRatingView

class NotesDetailVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var imgCoverPage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnFav: UIButton!
    @IBOutlet weak var vwBackGround: UIView!
    @IBOutlet var floatRatingView: FloatRatingView!
    @IBOutlet var txtDescription: UILabel!
    @IBOutlet weak var txtTagsDesc: UILabel!
    @IBOutlet var btnLocation: UIButton!
    @IBOutlet var lblLocation: UILabel!
    
    //MARK: - Variables
    var dict:NoteList?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
        imgCoverPage.layer.cornerRadius = 5
        floatRatingView.delegate = self
        floatRatingView.contentMode = UIView.ContentMode.scaleAspectFit
        floatRatingView.type = .halfRatings
        floatRatingView.isUserInteractionEnabled = false 
    }
    
    //MARK: - set Data
    func setData(){
        if let details = dict{
            lblName.text = details.headLine
            txtDescription.text = details.welcomeDescription
            floatRatingView.rating = Double(details.userRating)
            btnLike.setTitle(" \(details.noteLike.count )", for: .normal)
            btnComment.setTitle(" \(details.commentsCount )", for: .normal)
            btnShare.isHidden = details.shareable == true ? false : true
            let img = details.favoriteStatus == true ? UIImage(named: "favactive") : UIImage(named: "favdeactive")
            let imgUrl = URL(string: details.coverPic.url)
            imgCoverPage.sd_setImage(with: imgUrl, placeholderImage: UIImage(named: ""))
            lblLocation.text = " \(details.address)"
            self.title = details.headLine
            let arrName = details.tags.map { $0.name}
            txtTagsDesc.text = arrName.joined(separator: ",")
            btnFav.setImage(img, for: .normal)

        }
    }
    
    //MARK: - Action uploads
    @IBAction func actionUploads(_ sender: Any) {
        self.performSegue(withIdentifier: "SegueImageShow", sender: self.dict?.uploads)
    }
    
    //MARK: - Action location
    @IBAction func actionLocation(_ sender: Any) {
        // Open and show coordinate
        let latitude = String(dict?.latitude ?? 0.0 )
        let longitude = String(dict?.longitude ?? 0.0 )
        let url = "http://maps.apple.com/maps?saddr=\(latitude),\(longitude)"
        UIApplication.shared.openURL(URL(string:url)!)
        dict?.uploads
    }
}

extension NotesDetailVC: FloatRatingViewDelegate {

    // MARK: FloatRatingViewDelegate
    func floatRatingView(_ ratingView: FloatRatingView, isUpdating rating: Double) {
        
    }
    
    func floatRatingView(_ ratingView: FloatRatingView, didUpdate rating: Double) {
    
    }
    
}

//MARK: - extension prepare segues
extension ImageViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "SegueImageShow" {
                if let viewController = segue.destination as? ImageViewController {
                    if let temparr = sender as? [CoverPic] {
                        viewController.arrImages = temparr
                    }
                }
            }
        }
}
