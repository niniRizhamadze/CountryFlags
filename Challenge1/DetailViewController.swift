import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var imageToLoad: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = imageToLoad
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTo))
        imageView.image = UIImage(named: imageToLoad)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    

    @objc func shareTo(){
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else{
            print("no image found")
            return
        }
        
        let action = UIActivityViewController(activityItems: [image, imageToLoad], applicationActivities: [])
        present(action, animated: true)
    }
}

