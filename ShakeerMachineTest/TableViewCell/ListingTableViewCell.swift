//
//  ListingTableViewCell.swift
//  ShakeerMachineTest
//
//  Created by Praveen Tamboli on 16/12/22.
//

import UIKit
import FloatRatingView
import ReadMoreTextView
import SDWebImage

class ListingTableViewCell: UITableViewCell {
    //MARK: - outlets
    @IBOutlet weak var imgCoverPage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnFav: UIButton!
    @IBOutlet weak var vwBackGround: UIView!
    @IBOutlet var floatRatingView: FloatRatingView!
    @IBOutlet var txtDescription: ReadMoreTextView!
    @IBOutlet weak var btnUserDetail: UIButton!
    
    //MARK: - Dict
    var dict: NoteList?{
        didSet {
            lblName.text = dict?.headLine
            txtDescription.text = dict?.welcomeDescription
            floatRatingView.rating = Double(dict?.userRating ?? 0)
            btnLike.setTitle(" \(dict?.noteLike.count ?? 0)", for: .normal)
            btnComment.setTitle(" \(dict?.commentsCount ?? 0)", for: .normal)
            btnShare.isHidden = dict?.shareable == true ? false : true
            let img = dict?.favoriteStatus == true ? UIImage(named: "favactive") : UIImage(named: "favdeactive")
            btnFav.setImage(img, for: .normal)
            let imgUrl = URL(string: dict?.coverPic.url ?? "")
            imgCoverPage.sd_setImage(with: imgUrl, placeholderImage: UIImage(named: "placeholder"))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgCoverPage.layer.cornerRadius = 5
        // Initialization code
        // Reset float rating view's background color
        floatRatingView.backgroundColor = UIColor.clear
        txtDescription.shouldTrim = true
        txtDescription.maximumNumberOfLines = 2
        txtDescription.attributedReadMoreText = NSAttributedString(string: "... Read more")
        txtDescription.attributedReadLessText = NSAttributedString(string: "Read less")
        
        vwBackGround.layer.cornerRadius = 5

        /** Note: With the exception of contentMode, type and delegate,
         all properties can be set directly in Interface Builder **/
        floatRatingView.delegate = self
        floatRatingView.contentMode = UIView.ContentMode.scaleAspectFit
        floatRatingView.type = .halfRatings
        floatRatingView.isUserInteractionEnabled = false 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ListingTableViewCell: FloatRatingViewDelegate {

    // MARK: FloatRatingViewDelegate
    
    func floatRatingView(_ ratingView: FloatRatingView, isUpdating rating: Double) {
        
    }
    
    func floatRatingView(_ ratingView: FloatRatingView, didUpdate rating: Double) {
    
    }
    
}
