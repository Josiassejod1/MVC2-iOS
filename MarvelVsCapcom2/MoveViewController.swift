//
//  MoveViewController.swift
//  MarvelVsCapcom2
//
//  Created by Dalvin Sejour on 1/15/19.
//  Copyright © 2019 Dalvin Sejour. All rights reserved.
//

import UIKit

private let reuseIdentifier = "customcell"

class MoveViewController: UICollectionViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet var mainTable: UITableView!
    var moves: [Moves] = []
    var baseurl: String =  "https://secure-hamlet-19722.herokuapp.com/"
    
    override func viewWillAppear(_ animated: Bool) {
        mainTable.reloadData()
        if moves.count == 0 {
            moves.append(Moves(character_name: "Akuma", move_name: "Gohadoken", image: "\(baseurl)//images/Move_Images/Akuma/Gohadoken.PNG"))
            }
        
       super.viewWillAppear(animated)
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let moveCell =  tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! CustomTableViewCell
        let idx =  indexPath.section
       
       moveCell.moveName.text? = moves[idx].move_name
        displayMoveImage(idx, moveCell: moveCell)
        return moveCell
    }
    
    func displayMoveImage(_ row: Int, moveCell: CustomTableViewCell) {
        let url: String = (URL(string:"\(baseurl)/moves[row].image")?.absoluteString)!
        
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {
            (data, response, error) -> Void in
            if error != nil {
                print(error!)
                return
            }
            
            //handles the threading in the application and allows us to initialize a new image using the
            //data above
            DispatchQueue.main.async(execute: {
                let image = UIImage(data: data!)
                moveCell.moveImage?.image = image
            })
        }).resume()
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 150 ;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return moves.count
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
