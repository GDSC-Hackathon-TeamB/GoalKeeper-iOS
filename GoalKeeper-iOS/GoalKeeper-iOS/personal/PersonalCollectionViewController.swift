//
//  PersonalCollectionViewController.swift
//  GoalKeeper-iOS
//
//  Created by 이지훈 on 1/13/24.
//

import UIKit
import BSImagePicker
import Photos



class PersonalCollectionViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource  {

    
    @IBOutlet weak var authLabel: UILabel!
    
    
    @IBOutlet weak var registerPhoto: UICollectionView!
    
    var images:[UIImage] = []
    var selectedIndexPaths: [IndexPath] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionViews()

        
        // UITapGestureRecognizer 추가
               let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        authLabel?.isUserInteractionEnabled = true
        authLabel?.addGestureRecognizer(tapGesture3)
           

    }
    
    //MARK: - 사진 선택
    private func setupCollectionViews() {
        registerPhoto?.dataSource = self
        registerPhoto?.delegate = self
        registerPhoto?.register(PhotoCVC.self, forCellWithReuseIdentifier: PhotoCVC.identifier)
    }
    
    //이미지 갯수 제한
    private func getSelectedImagesFromAssets(assets: [PHAsset]) {
        let imageManager = PHImageManager.default()
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        
        for asset in assets {
            if self.images.count >= 3 {
                break // 이미 10개의 이미지가 있으므로 더 이상 이미지를 추가하지 않습니다.
            }
            
            imageManager.requestImage(for: asset, targetSize: CGSize(width: 500, height: 500), contentMode: .aspectFit, options: requestOptions) { (image, info) in
                if let img = image {
                    self.images.append(img)
                }
            }
        }
        registerPhoto.reloadData()
    }

    
    
    @objc func imageTapped(_ sender: UIButton) {
        let imagePicker = ImagePickerController()
        
        let remainingSelections = 3 - self.images.count // 이미 선택한 이미지의 개수를 고려하여 남은 선택 가능한 이미지의 개수를 계산
        imagePicker.settings.selection.max = remainingSelections // 남은 선택 가능한 이미지의 개수로 최대 선택 개수를 설정
        
        imagePicker.settings.fetch.assets.supportedMediaTypes = [.image]
        
        self.presentImagePicker(imagePicker, select: { (asset) in
            // 사용자가 이미지를 선택할 때마다 호출됩니다.
        }, deselect: { (asset) in
            // 사용자가 이미지 선택을 취소할 때마다 호출됩니다.
        }, cancel: { (assets) in
            // 취소 버튼을 누를 때 호출됩니다.
        }, finish: { (assets) in
            // 사용자가 완료 버튼을 눌렀을 때 호출됩니다.
            self.getSelectedImagesFromAssets(assets: assets)
        }, completion: nil)
    }
    
    
    
    // UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCVC.identifier, for: indexPath) as? PhotoCVC else { return UICollectionViewCell() }
        cell.addBtn.addTarget(self, action: #selector(imageTapped), for: .touchUpInside)
        collectionView.allowsMultipleSelection = true
        
        cell.configure(images: images)
        cell.countLabel.text = "\(images.count)/3"
        cell.didTapCloseButton = { [weak self] index in
            guard let self = self else { return }
            self.images.remove(at: index)
            cell.configure(images:self.images)
            cell.countLabel.text = "\(self.images.count)/3"
            
        }
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 가로길이는 컬렉션뷰의 가로길이를 기준으로 한다.
        let width = collectionView.bounds.width
        // 세로길이는 18을 빼고 남은 컬렉션뷰의 세로길이를 기준으로 한다.
        let height = collectionView.bounds.height - 18
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndexPaths.append(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let index = selectedIndexPaths.firstIndex(of: indexPath) {
            selectedIndexPaths.remove(at: index)
        }
    }
    
    
    @objc func handleTap() {
           // RewardPopUp 인스턴스화 및 설정
           let rewardPopUpVC = RewardPopUp()
           rewardPopUpVC.modalPresentationStyle = .overFullScreen // 풀스크린이 아닌 모달 스타일
           rewardPopUpVC.modalTransitionStyle = .crossDissolve // 부드러운 전환 효과

           // 모달로 표시
           present(rewardPopUpVC, animated: true, completion: nil)
       }
    
    
    
}
