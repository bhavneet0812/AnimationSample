//
//  GalleryVC.swift
//  AnimationSample
//
//  Created by Appinventiv on 14/02/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit
import UIKit.UIGestureRecognizerSubclass

class GalleryVC: UIViewController {
    
    
// MARK: JSONData
    
    var JSONdata : [[String:Any]] = [
        ["label":"img1", "image": #imageLiteral(resourceName: "Image1")],
        ["label":"img2", "image": #imageLiteral(resourceName: "Image2")],
        ["label":"img3", "image": #imageLiteral(resourceName: "Image3")],
        ["label":"img4", "image": #imageLiteral(resourceName: "Image4")],
        ["label":"img5", "image": #imageLiteral(resourceName: "Image5")],
        ["label":"img6", "image": #imageLiteral(resourceName: "Image6")],
        ["label":"img7", "image": #imageLiteral(resourceName: "Image7")],
        ["label":"img8", "image": #imageLiteral(resourceName: "Image8")],
        ["label":"img9", "image": #imageLiteral(resourceName: "Image9")],
        ["label":"img10", "image": #imageLiteral(resourceName: "Image10")],
        ["label":"img11", "image": #imageLiteral(resourceName: "Image11")],
        ["label":"img12", "image": #imageLiteral(resourceName: "Image12")],
        ["label":"img13", "image": #imageLiteral(resourceName: "Image13")],
        ["label":"img14", "image": #imageLiteral(resourceName: "Image14")],
        ["label":"img15", "image": #imageLiteral(resourceName: "Image15")],
        ["label":"img16", "image": #imageLiteral(resourceName: "Image16")],
        ["label":"img17", "image": #imageLiteral(resourceName: "Image17")],
        ["label":"img18", "image": #imageLiteral(resourceName: "Image18")],
        ["label":"img19", "image": #imageLiteral(resourceName: "Image19")],
        ["label":"img20", "image": #imageLiteral(resourceName: "Image20")],
        
        ]
    
    
// MARK: IBOUTLETS
    
    //Image Collection View
    
    @IBOutlet weak var imgCollectionView: UICollectionView!
    
    @IBOutlet weak var listViewBtnOutlet: UIButton!
    
    @IBOutlet weak var gridViewBtnOutlet: UIButton!
    
    @IBOutlet weak var deleteBtnOutlet: UIButton!
    
    let gridLayout = GridFlowLayout()
    let listLayout = ListFlowLayout()

    
    // UPDATED DATA
    
    var updatedData : [IndexPath] = []

    
    
// MARK: GALLERYVC LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgCollectionView.delegate = self
        imgCollectionView.dataSource = self
        
        self.automaticallyAdjustsScrollViewInsets = true
        self.imgCollectionView.collectionViewLayout = listLayout
        
        deleteBtnOutlet.isHidden = true
        
        //Initializing NIB for Grid
        let gridCell = UINib.init(nibName: "GridCell", bundle: nil)
        imgCollectionView.register(gridCell, forCellWithReuseIdentifier: xib.GridCell.rawValue)
        
        
        //Initializing NIB for List
        let listCell = UINib.init(nibName: "ListCell", bundle: nil)
        imgCollectionView.register(listCell, forCellWithReuseIdentifier: xib.ListCell.rawValue)
        
        let longTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(didTap))
        imgCollectionView.addGestureRecognizer(longTapGesture)
        imgCollectionView.allowsSelection = false
        listViewBtnOutlet.isSelected = true
        listViewBtnOutlet.isEnabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK: IBACTIONS
    
    @IBAction func deleteBtn(_ sender: UIButton) {
        
   
        imgCollectionView.allowsSelection = false
        updatedData = updatedData.sorted().reversed()
        
        for index in updatedData {
            JSONdata.remove(at: index.row)
            imgCollectionView.deleteItems(at: [index])
        }
       updatedData.removeAll()
        deleteBtnOutlet.isHidden = true
        
    }
    
    @IBAction func listViewBtn(_ sender: UIButton) {
        
        viewCase = ViewCases.List
        imgCollectionView.reloadData()
        listViewBtnOutlet.isSelected = true

        
        
        UIView.animate(withDuration: 0.5, animations: {() -> Void in
            
            self.imgCollectionView.collectionViewLayout.invalidateLayout()
            self.imgCollectionView.setCollectionViewLayout(self.listLayout, animated: true)
            self.listViewBtnOutlet.isEnabled = false
            
        }, completion: {(true) in
            
            self.gridViewBtnOutlet.isSelected = false
            self.gridViewBtnOutlet.isEnabled = true
            
        })
        
    }
    @IBAction func gridViewBtn(_ sender: UIButton) {
        
        viewCase = ViewCases.Grid
        imgCollectionView.reloadData()
        gridViewBtnOutlet.isSelected = true
        
        UIView.animate(withDuration: 0.5, animations: {() -> Void in
            
            self.imgCollectionView.collectionViewLayout.invalidateLayout()
            self.imgCollectionView.setCollectionViewLayout(self.gridLayout, animated: true)
            self.gridViewBtnOutlet.isEnabled = false
            
        }, completion: {(true) in
            
            
            self.listViewBtnOutlet.isSelected = false
            self.listViewBtnOutlet.isEnabled = true
            
            
        })

    }
    
    func didTap(gestureRecogniser : UILongPressGestureRecognizer) -> Void {
     
        gestureRecogniser.allowableMovement = CGFloat(JSONdata.count)
        imgCollectionView.allowsMultipleSelection = true
        deleteBtnOutlet.isHidden = false
        deleteBtnOutlet.isEnabled = true
        
        if gestureRecogniser.state == .ended{
          return
        }
           print(#function)
        
        let point = gestureRecogniser.location(in: self.imgCollectionView)
        let indexpath = self.imgCollectionView.indexPathForItem(at: point)
        
        imgCollectionView.selectItem(at: indexpath, animated: true, scrollPosition: .centeredVertically)
        
        collectionView(imgCollectionView, didSelectItemAt: indexpath!)
        
        
    }
    
}

// MARK: IMPLEMENTING DELEGATES AND DATASOURCES

extension GalleryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return JSONdata.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        switch viewCase {
        
        case ViewCases.List :
            
            let listCell = imgCollectionView.dequeueReusableCell(withReuseIdentifier: xib.ListCell.rawValue, for: indexPath) as! ListCell
            listCell.setImages(img: JSONdata[indexPath.row]["image"] as! UIImage)
            print("LIST")
            listCell.layer.borderWidth = 0
            return listCell
        
        case ViewCases.Grid :
            
            let gridCell = imgCollectionView.dequeueReusableCell(withReuseIdentifier: xib.GridCell.rawValue, for: indexPath) as! GridCell
            gridCell.setImages(img: JSONdata[indexPath.row]["image"] as! UIImage)
            print("GRID")
            gridCell.layer.borderWidth = 0
            return gridCell
        
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath ) {
        
        let cell = imgCollectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 5
        updatedData.append(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        
        let cell = imgCollectionView.cellForItem(at: indexPath)
        updatedData.remove(at: updatedData.index(of : indexPath)!)
        cell?.layer.borderWidth = 0
        
        if updatedData.isEmpty{
            deleteBtnOutlet.isHidden = true
            deleteBtnOutlet.isEnabled = false
            
            imgCollectionView.allowsSelection = false
            
        }
        
    }
}



















