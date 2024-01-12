//
//  PhotoCVC.swift
//  JMT
//
//  Created by 이지훈 on 2023/06/27.
//

import UIKit
import Then
import SnapKit

class PhotoCVC: UICollectionViewCell {
    
    @IBOutlet weak var imagePhoto: UIImageView!
    
    @IBOutlet weak var imageCount: UILabel!
    
    
    static var identifier: String { return String(describing: self) }
    
    
    var didTapCloseButton: ((Int) -> Void)?

    lazy var cameraContainerView = UIView()
    lazy var countContainerView = UIView()
    
    // MARK: [ outlet ]
    lazy var scrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = true
    }
    
    lazy var imageStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 0
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
    }
        
    lazy var addBtn = UIButton().then {
        $0.clipsToBounds = true
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(named: "gray100")?.cgColor
        $0.layer.cornerRadius = 12
    }

    
    lazy var cameraLabel = UILabel().then {
        let color = UIColor(named: "gray400")?.cgColor
        let attributedString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "Camera")?.resizeImage(targetSize: CGSize(width: 20, height: 20))
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        
        $0.attributedText = attributedString
        $0.textAlignment = .center
        $0.frame = CGRect(x: 0, y: 0, width: 120, height: 120) 
    }

    
    lazy var countLabel = UILabel().then {
        $0.text = "0/10"
        $0.textColor = UIColor(named: "gray400")
        $0.textAlignment = .center
        $0.font =  UIFont(name: "Pretendard-Medium", size: 14)
    }
    
    // MARK: [ override ]
    @available(*, unavailable)
   
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layout()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cameraContainerView.addSubview(cameraLabel)
        countContainerView.addSubview(countLabel)
        
        let stackView = UIStackView(arrangedSubviews: [cameraContainerView, countContainerView])
        stackView.axis = .horizontal
        stackView.spacing = 0 // 원하는 간격을 설정합니다.
        stackView.alignment = .center
        stackView.distribution = .fill
        
        let containerView = UIView()
        containerView.layer.cornerRadius = 12
        containerView.layer.borderColor = UIColor.black.cgColor // 원하는 색상으로 설정
        containerView.clipsToBounds = true
        containerView.addSubview(stackView)
        
        contentView.addSubview(containerView)
        
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        cameraLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(CGSize(width: 75, height: 75))
        }
        
        countLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        layout()
    }

    
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    
    
    
    
    
    
    
    // MARK: [ @objc ]
    @objc
    func closeBtnTapped(_ sender: UIButton) {
        guard let containerView = sender.superview else { return }
        
        let index = imageStackView.arrangedSubviews.firstIndex(of: containerView) ?? -1
        if index >= 0 {
            // -1 to account for the addBtn in the stack view
            didTapCloseButton?(index - 1)
        }
        
        containerView.removeFromSuperview()
    }
    
    
    
    
    
    func configure(images: [UIImage]) {
        
        // 최대 10개 이미지만 허용
        let limitedImages = Array(images.prefix(10))
        
        // (1) Remove all arranged subviews from the stack view
        imageStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        // (2) Add the button as the first subview in the stack view
        if images.count < 11 {
            imageStackView.addArrangedSubview(addBtn)
        }
        // (3) Set the size of the button
        addBtn.snp.makeConstraints {
            $0.height.equalTo(self.contentView.snp.height)
            $0.width.equalTo(self.addBtn.snp.height)
        }
        
        addBtn.addSubview(self.cameraLabel)
        self.cameraLabel.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(0.6)
            $0.height.equalToSuperview().multipliedBy(0.3) // 0.5에서 0.4로 변경
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().multipliedBy(0.8) // 0.8에서 0.75로 변경
        }

        addBtn.addSubview(self.countLabel)
        self.countLabel.snp.makeConstraints {
            $0.width.equalTo(self.cameraLabel.snp.width)
            $0.height.equalTo(self.cameraLabel.snp.height).multipliedBy(0.3)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.cameraLabel.snp.bottom).offset(4) // offset을 4로 유지
            $0.leading.equalTo(self.cameraLabel.snp.leading)
            $0.trailing.equalTo(self.cameraLabel.snp.trailing)
        }


        
        // (4) Add the images to the stack view
        for image in limitedImages {
                   
                   // ContainerView
                   let containerView = UIView()
                   imageStackView.addArrangedSubview(containerView)
                   containerView.snp.makeConstraints {
                       $0.width.height.equalTo(self.addBtn)
                   }
                   
            let imageView = UIImageView(image: image)
                    imageView.contentMode = .scaleAspectFit
                    imageView.clipsToBounds = true
                    containerView.addSubview(imageView)
                    imageView.snp.makeConstraints { make in
                        make.center.equalToSuperview()
                        make.width.height.equalTo(120)
                    }
                    containerView.layoutIfNeeded() // Layout update
                    imageView.layer.cornerRadius = 12 // Apply cornerRadius after layout update
                    

            
            
            
            
            // Close Button
            let closeButton = UIButton(type: .custom)
            closeButton.setImage(UIImage(named: "noregisterXMark"), for: .normal)
            closeButton.tintColor = UIColor(named: "gray400")
            
            closeButton.sizeToFit()
            closeButton.addTarget(self, action: #selector(closeBtnTapped), for: .touchUpInside)
            
            containerView.addSubview(closeButton)
            closeButton.snp.makeConstraints {
                $0.width.equalToSuperview().multipliedBy(0.25)
                $0.height.equalTo(closeButton.snp.width)
                $0.top.trailing.equalToSuperview()
          
                
                

            }
            let stackViewWidth = CGFloat(images.count) * (120 + 10) // 120 is width of each cell, 10 is spacing between cells
              scrollView.contentSize = CGSize(width: stackViewWidth, height: 120) // height is same as height of each cell
          
            
        }
        
        
    }
    
    
    
    
    
    
    // MARK: [ Layout ]
    func layout() {
        layoutScrollView()
        layoutImageStackView()
    }
    
    
    func layoutScrollView() {
        self.contentView.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    
    func layoutImageStackView() {
        self.scrollView.addSubview(self.imageStackView)
        self.imageStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalToSuperview()
        }
    }

    
   
    
}

extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage {
        let size = self.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        let newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }

        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage ?? self
    }
}

    

