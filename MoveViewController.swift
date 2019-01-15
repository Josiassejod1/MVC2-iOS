//
//  MoveViewController.swift
//  MarvelVsCapcom2
//
//  Created by Dalvin Sejour on 1/15/19.
//  Copyright © 2019 Dalvin Sejour. All rights reserved.
//

import UIKit

class MoveViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   var selectedCharacter: String = "Akuma"
    
    
    
    @IBOutlet var mainTable: UITableView!
    var moves: [Moves] = []
    var baseurl: String =  "https://secure-hamlet-19722.herokuapp.com"
    
    override func viewWillAppear(_ animated: Bool) {
        mainTable.reloadData()
        if moves.count == 0 {
            moves.append(Moves(character_name: "Akuma", move_name: "Gohadoken", image: "\(baseurl)/images/Move_Images/Akuma/Gohadoken.PNG"))
            
           
        }
        
        let url = "\(baseurl)/api/v1/characters/\(selectedCharacter)/moves"
        HTTPHandler.getJson(urlString: url, completionHandler: parseDataIntoMoves)
        
        super.viewWillAppear(animated)
        
        print(selectedCharacter)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let moveCell =  tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! CustomTableViewCell
        let idx =  indexPath.section
        
        moveCell.moveName.text? = moves[idx].move_name
        
       // displayMoveImage(idx, moveCell: moveCell)
        return moveCell
    }
    
    func displayMoveImage(_ row: Int, moveCell: CustomTableViewCell) {
        let url = (URL(string:"\(baseurl)\(moves[row].image)")?.absoluteString) ?? "https://images.immediate.co.uk/volatile/sites/3/2017/11/imagenotavailable1-39de324.png?quality=90&resize=620,413"
        print(url)
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
    
   
    
    
    
    func parseDataIntoMoves(data: Data?) -> Void {
        if let data = data {
            let object = JsonParserFlat.parse(data: data)
            if let object = object {
                self.moves = MoveDataProcessor.mapJsonToMoves(object: object)
                DispatchQueue.main.async {
                    self.mainTable.reloadData()
                }
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 90 ;//Choose your custom row height
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
