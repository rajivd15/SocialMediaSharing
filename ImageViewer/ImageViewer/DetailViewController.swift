//
//  DetailViewController.swift
//  ImageViewer
//
//  Created by Rajiv Deshmukh on 7/13/17.
//  Copyright © 2017 Rajiv Deshmukh. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {
    
    var selectedPicture: String?
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedPicture
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        if let imageToLoad = selectedPicture {
            imageView.image  = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    func shareTapped() {
        //MARK - SHARE it within other apps and devices
//        let vc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
//        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
//        present(vc, animated: true)

        //MARK - Sharing with Social Media
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
            //Facebook policy denies adding prefill text, so below wont show up.
            //vc.setInitialText("Look at this Great Picture!")
            vc.add(imageView.image!)
            //vc.add(URL(string: "http://www.photolib.noaa.gov/nssl"))
            self.present(vc, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
