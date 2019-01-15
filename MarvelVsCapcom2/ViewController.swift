//
//  ViewController.swift
//  MarvelVsCapcom2
//
//  Created by Dalvin Sejour on 1/14/19.
//  Copyright © 2019 Dalvin Sejour. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
     var characters: [Character] = []
    
    
    
        @IBOutlet  var mainTable: UITableView!
    
    
    

    
    override func viewWillAppear(_ animated: Bool) {
        

        mainTable.reloadData()
        
        if characters.count == 0 {
            characters.append(Character(name: "Akuma", head_shot: "https://vignette.wikia.nocookie.net/marvelvscapcom/images/7/77/MVC2_Gouki.jpg/revision/latest?cb=20110923045906", universe: "Capcom"))
        }
        
        let url = "https://secure-hamlet-19722.herokuapp.com/api/v1/characters"
        HTTPHandler.getJson(urlString: url, completionHandler: parseDataIntoCharacters)
        
        
        super.viewWillAppear(animated)
       
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let characterCell =  tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! CustomTableViewCell
        let idx =  indexPath.section
        characterCell.characterName.text? = characters[idx].name
        displayMovieImage(idx, characterCell: characterCell)
        return characterCell
    }
    
    func displayMovieImage(_ row: Int, characterCell: CustomTableViewCell) {
        let url: String = (URL(string: characters[row].head_shot)?.absoluteString)!
        /*Make http request, that allows us to make a call to a website to see if it is available... simple way to make a get request
         
         */
        /*
         handler to check if that went through
         */
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
                characterCell.characterImage?.image = image
            })
        }).resume()
    }
    
    var selectedCharacter: String?
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print(characters.count)
        selectedCharacter = characters[indexPath.section].name
    
        let destinationVC = MoveViewController()
        destinationVC.selectedCharacter = selectedCharacter!
        
        
        // Let's assume that the segue name is called playerSegue
        // This will perform the segue and pre-load the variable for you to use
       //self.performSegue(withIdentifier: "MoveViewSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "MoveViewSegue") {
            // initialize new view controller and cast it as your view controller
            let viewController = segue.destination as! MoveViewController
            // your new view controller should have property that will store passed value
            viewController.selectedCharacter = selectedCharacter ?? "Akuma"
        }
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
        return characters.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainTable.delegate = self
        self.mainTable.dataSource = self
    
    }
    

    
    func parseDataIntoCharacters (data: Data?) -> Void {
        if let data = data {
            let object = JsonParser.parse(data: data)
            
            if let object = object {
                self.characters = CharacterDataProcessor.mapJsonToMovies(object: object)
                DispatchQueue.main.sync {
                    self.mainTable.reloadData()
                }
            }
        }
    }


}

