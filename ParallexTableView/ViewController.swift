//
//  ViewController.swift
//  ParallexTableView
//
//  Created by infiny webcom pvt ltd on 18/06/18.
//  Copyright © 2018 infiny webcom pvt ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var parallexTable: UITableView!
    var imageArr:[UIImage] = [
        UIImage(named:"1")!,
        UIImage(named:"2")!,
        UIImage(named:"3")!,
        UIImage(named:"4")!,
        UIImage(named:"5")!,
        UIImage(named:"6")!,
        UIImage(named:"7")!
    ]
    
    var parallexOffsetSpped : CGFloat = 50
    var cellHeight : CGFloat = 300
    
    lazy var parallexImageHeight:CGFloat = {
        let maxOffset = (sqrt(pow(cellHeight, 2) + 4 + parallexOffsetSpped + self.parallexTable.frame.height) - cellHeight)/2
        return maxOffset + self.cellHeight
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parallexTable.delegate = self
        parallexTable.dataSource = self
    }

    func parallexOffset(newOffsetY:CGFloat , cell:ImageCell) -> CGFloat {
        
        return (newOffsetY - cell.frame.origin.y)/parallexImageHeight * parallexOffsetSpped
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageCell
        cell.configureCell(title: "title \(indexPath.row + 1)", image: imageArr[indexPath.row])
        cell.imageHeight.constant = parallexImageHeight
        cell.imageTop.constant = parallexOffset(newOffsetY: tableView.contentOffset.y, cell: cell)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offsetY = parallexTable.contentOffset.y
        for cell in parallexTable.visibleCells as! [ImageCell]{
            cell.imageTop.constant = parallexOffset(newOffsetY: parallexTable.contentOffset.y, cell: cell)
        }
    }
}
