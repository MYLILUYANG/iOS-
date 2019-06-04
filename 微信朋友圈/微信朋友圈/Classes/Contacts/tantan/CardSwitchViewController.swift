//
//  CardSwitchViewController.swift
//  微信朋友圈
//
//  Created by liluyang on 2019/5/30.
//  Copyright © 2019年 liluyang. All rights reserved.
//

import UIKit

class CardSwitchViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {

    
    var dataArray:Array<Any> = Array();
    var orignalAngel:CGPoint = CGPoint.zero;
    var angleT:CGFloat = 0.0;
    var MycollectionView = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: K_ScreenW, height: K_ScreenH), collectionViewLayout: tantanCollectionViewLayout());
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MycollectionView.delegate = self;
        MycollectionView.dataSource = self;
        MycollectionView.backgroundColor = K_RandColor();
        MycollectionView.register(TanTanViewCell.self, forCellWithReuseIdentifier: "cellId")
        view.addSubview(MycollectionView);
        
        for _ in 0...10 {
            let model = TantanModel.init();
            model.picUrl = "http://up.enterdesk.com/edpic_source/8b/4b/94/8b4b949b5033dd8c9ec26ba57e22b552.jpg";
            self.dataArray.append(model);
        }
        
        MycollectionView.reloadData();
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! TanTanViewCell;
        cell.tanModel = self.dataArray[indexPath.item] as! TantanModel;
        let tap = UIPanGestureRecognizer.init(target: self, action: #selector(self.tapAction(tap:)))
        cell.addGestureRecognizer(tap);
        orignalAngel = cell.center;
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.clickDetail(tap:))))
        return cell;
    }
    
    func clickDetail(tap:UITapGestureRecognizer) -> Void {
        let controller = CardDetailController();
        self.navigationController?.pushViewController(controller, animated: true);
    }
    
    func tapAction(tap:UIPanGestureRecognizer) -> Void{
        let cell = tap.view;
        let indexpath:IndexPath = MycollectionView.indexPath(for: cell as! UICollectionViewCell)! as IndexPath;
        if tap.state ==  UIGestureRecognizer.State.changed{
            
            let pointPan = tap.translation(in: MycollectionView );
            cell!.center = CGPoint(x: cell!.center.x + pointPan.x, y: cell!.center.y + pointPan.y);
            angleT = (cell!.center.x - cell!.frame.size.width * 0.5) / cell!.frame.size.width * 0.5;
            cell?.transform = CGAffineTransform(rotationAngle: angleT);
            tap.setTranslation(CGPoint.zero, in: cell);
        }else if tap.state == UIGestureRecognizer.State.ended {
            if abs(angleT * 180) >= 30{
                dataArray.remove(at: indexpath.item);
                MycollectionView.deleteItems(at: [indexpath]);
            }else{
                UIView.animate(withDuration: 0.5) {
                    cell?.center = self.orignalAngel;
                    cell?.transform = CGAffineTransform(rotationAngle: 0);
                }
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count;
    }
}




