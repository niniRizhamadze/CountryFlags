
import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet var labelView: UILabel!
    @IBOutlet var customImageView: UIImageView!
    
}

class ViewController: UITableViewController {
    let images = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Countries"
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "country", for: indexPath) as! CustomTableViewCell
        
        cell.labelView.text = images[indexPath.row]
        cell.customImageView.image = UIImage(named: images[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = storyboard?.instantiateViewController(identifier: "flag") as? DetailViewController
        
        detailViewController?.imageToLoad = images[indexPath.row]
        navigationController?.pushViewController(detailViewController!, animated: true)
    }

}

