//
//  ViewController.swift
//  CoreDataFrameworkSwift
//
//  Created by MACOS on 6/20/17.
//  Copyright © 2017 MACOS. All rights reserved.
//

import UIKit
import  CoreData

class ViewController: UIViewController {

    @IBOutlet weak var txtid: UITextField!
    
    @IBOutlet weak var txtname: UITextField!
    
    @IBOutlet weak var txtadd: UITextField!
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btninsert(_ sender: Any) {
        
        let newcontact = NSEntityDescription.insertNewObject(forEntityName: "Emp", into: context) as NSManagedObject
        
        newcontact.setValue(txtid.text, forKey: "emp_id");
        newcontact.setValue(txtname.text, forKey: "emp_name");
        newcontact.setValue(txtadd.text, forKey: "emp_add");
        
        do
        {
            try   context.save()
        }
        catch
        {
            print(context)
        }
    }
    
    @IBAction func btnselect(_ sender: Any) {
        
        let entitydis = NSEntityDescription.entity(forEntityName: "Emp", in: context);
        
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Emp")
        request.entity = entitydis;
        
        let pred = NSPredicate(format: "(emp_id= %@)", txtid.text!);
        
        //  var err = NSError();
        
        request.predicate = pred;
        
        do{
            
            
            
            let results = try context.fetch(request);
            
            print(results);
            
            if results.count>0
            {
                
                let match =  results[0] as! NSManagedObject;
                
                print(match.value(forKey: "emp_name")!);
                print(match.value(forKey: "emp_id")!);
                print(match.value(forKey: "emp_add")!);
                
                txtid.text = match.value(forKey: "emp_id") as?String
                
                txtname.text = match.value(forKey: "emp_name") as? String
                txtadd.text  = match.value(forKey: "emp_add") as? String
                
                
            }
            else
            {
                print("not fount")
            }
            
            
            
            // let  groceries = results as![NSManagedObject]
            
            // print(groceries);
            
            
            
            /// tableView.reloadData()
        }catch{
            fatalError("Error is retriving Gorcery items")
        }
    }
    
    @IBAction func btnupdate(_ sender: Any) {
        
        let entitydis = NSEntityDescription.entity(forEntityName: "Emp", in: context);
        
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Emp")
        request.entity = entitydis;
        
        let pred = NSPredicate(format: "(emp_id= %@)", txtid.text!);
        
        //  var err = NSError();
        
        request.predicate = pred;
        
        do{
            
            
            
            let results = try context.fetch(request);
            
            print(results);
            
            if results.count>0
            {
                
                let match =  results[0] as! NSManagedObject;
                match.setValue(txtid.text, forKey: "emp_id");
                match.setValue(txtname.text, forKey: "emp_name")
                match.setValue(txtadd.text, forKey: "emp_add");
                
                try context.save()
            }
            else
            {
                print("not fount")
            }
            
            
            
            // let  groceries = results as![NSManagedObject]
            
            // print(groceries);
            
            
            
            /// tableView.reloadData()
        }catch{
            fatalError("Error is retriving Gorcery items")
        }
    }

    @IBAction func btndelete(_ sender: Any) {
        
        let entitydis = NSEntityDescription.entity(forEntityName: "Emp", in: context);
        
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Emp")
        request.entity = entitydis;
        
        let pred = NSPredicate(format: "(emp_id= %@)", txtid.text!);
        
        //  var err = NSError();
        
        request.predicate = pred;
        
        do{
            
            
            
            let results = try context.fetch(request);
            
            print(results);
            
            if results.count>0
            {
                
                let match =  results[0] as! NSManagedObject;
                
                
                
                context.delete(match);
                
                try context.save()
                
                
                
                
            }
            else
            {
                print("not fount")
            }
            
            
            
            // let  groceries = results as![NSManagedObject]
            
            // print(groceries);
            
            
            
            /// tableView.reloadData()
        }catch{
            fatalError("Error is retriving Gorcery items")
        }
    }
}

