//
//  ViewController.swift
//  Randog
//
//  Created by June2020 on 4/27/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let randomImageEndpoint = DogAPI.Endpoint.randomImageFromAllDogsCollection.url
        let task = URLSession.shared.dataTask(with: randomImageEndpoint) { (data, response, error) in
            guard let data = data else {
                return
            }
            
            let decoder = JSONDecoder()
            let imageData = try! decoder.decode(DogImage.self, from: data)
            print(imageData)
            let message = imageData.message
            guard let imageUrl = URL(string: message) else {
                print("Cannot create URL")
                return
            }
            let task = URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
                guard let data = data else {
                    print("no data or other error")
                    return
                }
                let downloadedImage = UIImage(data: data)
                DispatchQueue.main.async {
                    self.imageView.image = downloadedImage
                }
            }
            task.resume()
        }
        task.resume()
    }


}

