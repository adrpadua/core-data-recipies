//
//  ViewController.swift
//  core-data-recipies
//
//  Created by Adrian Padua on 5/16/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var recipes = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("RecipeCell") as? RecipeCell {
            
            // grab recipe at current index
            let recipe = recipes[indexPath.row]
            cell.configureCell(recipe)
            
            return cell
            
        } else {
            return RecipeCell()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // updates every time this view shows up
        fetchAndSetResults()
        
        // refresh the tableView in accordance to the recipes array
        tableView.reloadData()
    }
    
    
    // loads up results and sets them to the recipes array
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        
        // this is like the scratchpad of the app. Writes it down here before saving
        let context = app.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Recipe")
        
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.recipes = results as! [Recipe]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    
}

