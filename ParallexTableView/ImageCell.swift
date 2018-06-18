//
//  ImageCell.swift
//  ParallexTableView
//
//  Created by infiny webcom pvt ltd on 18/06/18.
//  Copyright © 2018 infiny webcom pvt ltd. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet var parallexLabel: UILabel!
    @IBOutlet var parallexImage: UIImageView!
    @IBOutlet var imageHeight: NSLayoutConstraint!
    @IBOutlet var imageTop: NSLayoutConstraint!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        parallexImage.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    func configureCell(title:String, image:UIImage) {
        self.parallexImage.image = image
        self.parallexLabel.text = title
    }

}
