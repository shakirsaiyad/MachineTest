//
//  ImageViewController.swift
//  ShakeerMachineTest
//
//  Created by Praveen Tamboli on 16/12/22.
//

import UIKit
import SDWebImage

class ImageViewController: UIViewController {
    
    //MARK: - outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - variables
    var arrImages = [CoverPic]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    


}

//MARK: - Collection View Data Source
extension ImageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if arrImages.count == 0 {
            self.collectionView.setEmptyMessage("No images found!")
        }
        else {
            self.collectionView.restore()
        }
        
        return arrImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        
        let imgUrl = URL(string: arrImages[indexPath.row].url )
        cell.img.sd_setImage(with: imgUrl, placeholderImage: UIImage(named: ""))
        cell.lblCaption.text = arrImages[indexPath.row].fileName
        
        return cell
    }
    
}

//MARK: - action collection view delegate flow layout
extension ImageViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
        }
    
}

extension UICollectionView {
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel
        
    }
    
    func restore() {
        self.backgroundView = nil
       
    }
}

