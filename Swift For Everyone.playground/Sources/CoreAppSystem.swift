import UIKit

// meta-data
let pos = [
    [30, 40],  // title
    [30, 110], // code editor
    [430, 110], // sketchbook
    [260, 465], // clr
    [355, 465], // kbrd disable
    [690, 320], // run btn
    [430, 373], // terminal
    [610, 320], // done
    [215, 461], // visual toggle
]

open class MainView : UIViewController, UITextViewDelegate {
    
    let swift_code_ = UITextView()
    let sketchboard = UIImageView()
    let mission_view = UITextView()
    let tada_bg = UIView()
    var basic_code: String = ""
    var basic_desc: String = ""
    var round: Int = 0
    var nowfontsize = 15
    
    public func set(code: String, desc: String, rnd: Int) {
        basic_code = code
        basic_desc = desc
        round = rnd
    }
    
    open override func loadView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 960, height: 540))
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: pos[0][0], y: pos[0][1], width: 400, height: 40)
        label.text = "Swift For Everyone"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.bold)
        
        swift_code_.frame = CGRect(x: pos[1][0], y: pos[1][1], width: 375, height: 400)
        swift_code_.backgroundColor = .darkGray
        swift_code_.layer.masksToBounds = true
        swift_code_.layer.cornerRadius = 10
        swift_code_.inputView = UIView()
        swift_code_.inputAccessoryView = UIView()
        swift_code_.autocapitalizationType = .none
        swift_code_.autocorrectionType = .no
        swift_code_.tintColor = .white
        swift_code_.textContainerInset = UIEdgeInsets.init(top:15, left:15, bottom:15, right:15);
        
        swift_code_.delegate = self
        swift_code_.text = self.basic_code
        textViewDidChange(swift_code_)
        
        
        sketchboard.frame = CGRect(x: pos[2][0], y: pos[2][1], width: 300, height: 250)
        sketchboard.backgroundColor = .white
        sketchboard.layer.masksToBounds = true
        sketchboard.layer.cornerRadius = 10
        sketchboard.layer.borderColor = UIColor.black.cgColor
        sketchboard.layer.borderWidth = 1
        
        let code_snip_btn_clr = UIButton()
        code_snip_btn_clr.frame = CGRect(x: pos[3][0], y: pos[3][1], width: 90, height: 30)
        code_snip_btn_clr.backgroundColor = .systemGray
        code_snip_btn_clr.setTitle("init", for: .normal)
        code_snip_btn_clr.layer.masksToBounds = true
        code_snip_btn_clr.layer.cornerRadius = 5
        
        code_snip_btn_clr.addTarget(self, action: #selector(onClickClear(_:)), for: .touchUpInside)

        let kbrd_focusout = UIButton()
        kbrd_focusout.frame = CGRect(x: pos[4][0], y: pos[4][1], width: 35, height: 30)
        kbrd_focusout.backgroundColor = .systemGray2
        kbrd_focusout.setTitle("X", for: .normal)
        kbrd_focusout.layer.masksToBounds = true
        kbrd_focusout.layer.cornerRadius = 5
        
        kbrd_focusout.addTarget(self, action: #selector(disableKeyboard(_:)), for: .touchUpInside)
        
        let run_btn = UIButton()
        run_btn.frame = CGRect(x: pos[5][0], y: pos[5][1], width: 30, height: 30)
        run_btn.setImage(UIImage(systemName: "play.fill")?.withTintColor(.white), for: .normal)
        run_btn.layer.masksToBounds = true
        run_btn.layer.cornerRadius = 5
        
        run_btn.addTarget(self, action: #selector(onRun(_:)), for: .touchUpInside)

        mission_view.frame = CGRect(x: pos[6][0], y: pos[6][1], width: 300, height: 136)
        mission_view.backgroundColor = .black
        mission_view.layer.masksToBounds = true
        mission_view.layer.cornerRadius = 5
        mission_view.isEditable = false
        mission_view.text = basic_desc
        mission_view.textColor = .white
        mission_view.font = .monospacedSystemFont(ofSize: 13, weight: .semibold)
        initAct()
        
        let done = UIButton()
        done.frame = CGRect(x: pos[7][0], y: pos[7][1], width: 70, height: 30)
        done.setTitle("done", for: .normal)
        done.backgroundColor = .systemGreen
        done.layer.masksToBounds = true
        done.layer.cornerRadius = 5
        
        done.addTarget(self, action: #selector(onDone(_:)), for: .touchUpInside)
        
        tada_bg.backgroundColor = .init(white: 0, alpha: 0.5)
        tada_bg.frame = CGRect(x: 0, y: 0, width: 960, height: 540)
        tada_bg.isHidden = true

        let tada_msg = UITextView()
        tada_msg.frame = CGRect(x: 90, y: 130, width: 600, height: 300)
        tada_msg.textAlignment = .center
        tada_msg.layer.masksToBounds = true
        tada_msg.layer.cornerRadius = 5
        tada_msg.font = .systemFont(ofSize: 20, weight: .semibold)
        tada_msg.isEditable = false
        tada_msg.textContainerInset = .init(top: 50, left: 40, bottom: 40, right: 40)
        tada_msg.text = """
You finished all courses in Swift For Everyone. Congratulation to you, and respect yourself about finishing these courses. However, Swift is more funny, and flexible language than you learned here. Keep learning Swift and step to change the world!

Thank you for enjoying Swift For Everyone,
and have a Great WWDC!
"""
        tada_msg.textColor = .black
        tada_bg.addSubview(tada_msg)
        
        let Access_vision_toggle = UIButton()
        Access_vision_toggle.frame = CGRect(x: pos[8][0], y: pos[8][1], width: 40, height: 40)
        Access_vision_toggle.setImage(UIImage(named: "vision_icon"), for: .normal)
        
        Access_vision_toggle.addTarget(self, action: #selector(sizeUpFont(_:)), for: .touchUpInside)

        view.addSubview(label)
        view.addSubview(swift_code_)
        view.addSubview(sketchboard)
        view.addSubview(code_snip_btn_clr)
        view.addSubview(kbrd_focusout)
        view.addSubview(run_btn)
        view.addSubview(mission_view)
        view.addSubview(Access_vision_toggle)
        
        if round == 5 {
            view.addSubview(done)
        }
        
        view.addSubview(tada_bg)
                
        self.view = view
    }
    
    func initAct() {
        let attrsString = NSMutableAttributedString(string: mission_view.text, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.monospacedSystemFont(ofSize: 13, weight: UIFont.Weight.semibold)]);
        
        // search for word occurrence
        let range = (mission_view.text! as NSString).range(of: "mission: ")
        if (range.length > 0) {
            attrsString.addAttribute(NSAttributedString.Key.foregroundColor,value:UIColor.systemTeal, range:range)
        }
        
        // set attributed text
        mission_view.attributedText = attrsString
    }
    
    func drawRect(pos: CGRect, color: CGColor) {
        let context = UIGraphicsGetCurrentContext()!
        context.setLineWidth(2.0)
        context.setStrokeColor(color)
    
        context.addRect(pos)
        context.strokePath()
        
        sketchboard.image = UIGraphicsGetImageFromCurrentImageContext()
    }
    
    public func textViewDidChange(_ textView: UITextView) {
        let attrsString = NSMutableAttributedString(string: swift_code_.text, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.monospacedSystemFont(ofSize: CGFloat(nowfontsize), weight: UIFont.Weight.semibold)]);
        
        // search for word occurrence
        var range = (swift_code_.text! as NSString).range(of: "for")
        if (range.length > 0) {
            attrsString.addAttribute(NSAttributedString.Key.foregroundColor,value:UIColor.red, range:range)
        }
        
        range = (swift_code_.text! as NSString).range(of: "if")
        if (range.length > 0) {
            attrsString.addAttribute(NSAttributedString.Key.foregroundColor,value:UIColor.green, range:range)
        }
        
        range = (swift_code_.text! as NSString).range(of: "rect")
        if (range.length > 0) {
            attrsString.addAttribute(NSAttributedString.Key.foregroundColor,value:UIColor.systemTeal, range:range)
        }
        
        // set attributed text
        swift_code_.attributedText = attrsString
    }
    
    @objc internal func onDone(_ sender: Any) {
        mission_view.font = UIFont.boldSystemFont(ofSize: 15)
        mission_view.textColor = .green
        mission_view.text = "MISSION SUCCESS"
        
        UIView.transition(with: tada_bg, duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.tada_bg.isHidden = false
                      })
    }
    
    @objc internal func onClickClear(_ sender: Any) {
        swift_code_.text = basic_code
        textViewDidChange(swift_code_)
    }
    
    @objc internal func disableKeyboard(_ sender: Any) {
        swift_code_.endEditing(true)
    }
    
    func level1() {
        let list = swift_code_.text!.components(separatedBy: " ").joined().components(separatedBy: ["(", ",", ")"])
        if list.count != 7 {
            let alert = UIAlertController(title: "Error", message: "missing argument", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return ;
        }
        if list[0] != "rect" {
            let alert = UIAlertController(title: "Error", message: "change \(list[0]) to rect", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        if list[1] == "<x>" || Int(list[1]) == nil {
            let alert = UIAlertController(title: "Error", message: "unmatching parameter x", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        if list[2] == "<y>" || Int(list[2]) == nil {
            let alert = UIAlertController(title: "Error", message: "unmatching parameter y", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        if list[3] == "<width>" || Int(list[3]) == nil {
            let alert = UIAlertController(title: "Error", message: "unmatching parameter width", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        if list[4] == "<height>" || Int(list[4]) == nil {
            let alert = UIAlertController(title: "Error", message: "unmatching parameter height", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        if list[5] == "<color>" || (list[5] != "RED" && list[5] != "GREEN" && list[5] != "BLUE") {
            let alert = UIAlertController(title: "Error", message: "unmatching parameter color", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        }
        mission_view.font = UIFont.boldSystemFont(ofSize: 15)
        mission_view.textColor = .green
        mission_view.text = "MISSION SUCCESS"
        
        switch list[5] {
        case "RED":
            drawRect(pos: CGRect(x: Int(list[1])!, y: Int(list[2])!, width: Int(list[3])!, height: Int(list[4])!), color: UIColor.red.cgColor)
            break
        case "GREEN":
            drawRect(pos: CGRect(x: Int(list[1])!, y: Int(list[2])!, width: Int(list[3])!, height: Int(list[4])!), color: UIColor.green.cgColor)
        case "BLUE":
            drawRect(pos: CGRect(x: Int(list[1])!, y: Int(list[2])!, width: Int(list[3])!, height: Int(list[4])!), color: UIColor.blue.cgColor)
        default: break
        
        }
    }
    
    func level2() {
        let codelist = swift_code_.text!.components(separatedBy: "\n")
        for code in codelist {
            let list = code.components(separatedBy: " ").joined().components(separatedBy: ["(", ",", ")"])
            if list.count != 7 {
                let alert = UIAlertController(title: "Error", message: "missing argument", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                }
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                return ;
            }
            if list[0] != "rect" {
                let alert = UIAlertController(title: "Error", message: "change \(list[0]) to rect", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                }
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                return
            }
            if list[1] == "<x>" || Int(list[1]) == nil {
                let alert = UIAlertController(title: "Error", message: "unmatching parameter x", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                }
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                return
            }
            if list[2] == "<y>" || Int(list[2]) == nil {
                let alert = UIAlertController(title: "Error", message: "unmatching parameter y", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                }
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                return
            }
            if list[3] == "<width>" || Int(list[3]) == nil {
                let alert = UIAlertController(title: "Error", message: "unmatching parameter width", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                }
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                return
            }
            if list[4] == "<height>" || Int(list[4]) == nil {
                let alert = UIAlertController(title: "Error", message: "unmatching parameter height", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                }
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                return
            }
            if list[5] == "<color>" || (list[5] != "RED" && list[5] != "GREEN" && list[5] != "BLUE") {
                let alert = UIAlertController(title: "Error", message: "unmatching parameter color", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                }
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                return
            }
            
            if codelist.count >= 2 {
                mission_view.font = UIFont.boldSystemFont(ofSize: 15)
                mission_view.textColor = .green
                mission_view.text = "MISSION SUCCESS"
            }


            switch list[5] {
            case "RED":
                drawRect(pos: CGRect(x: Int(list[1])!, y: Int(list[2])!, width: Int(list[3])!, height: Int(list[4])!), color: UIColor.red.cgColor)
                break
            case "GREEN":
                drawRect(pos: CGRect(x: Int(list[1])!, y: Int(list[2])!, width: Int(list[3])!, height: Int(list[4])!), color: UIColor.green.cgColor)
            case "BLUE":
                drawRect(pos: CGRect(x: Int(list[1])!, y: Int(list[2])!, width: Int(list[3])!, height: Int(list[4])!), color: UIColor.blue.cgColor)
            default: break

            }
        }
    }
    
    func level3() {
        let codelist = swift_code_.text!.components(separatedBy: "\n")
        if codelist.count < 3 {
            let alert = UIAlertController(title: "Error", message: "code is too short", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return ;
        }
        if codelist.count > 3 {
            let alert = UIAlertController(title: "Suggestion", message: "with for, code can be shorter than now", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return ;
        }
        if codelist[0] != "for i in 1...10 {" {
            let alert = UIAlertController(title: "Suggestion", message: "don't touch for expression", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return ;
        }
        for i in 1...10 {
            let newcode = codelist[1].replacingOccurrences(of: "i", with: "\(i)")
            var list = newcode.components(separatedBy: " ").joined().components(separatedBy: ["(", ",", ")"])
            if list.count != 7 {
                let alert = UIAlertController(title: "Error", message: "missing argument", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                }
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                return ;
            }
            for element in 1...4 {
                let expr = NSExpression(format: list[element])
                if let result = expr.expressionValue(with: nil, context: nil) as? Double {
                    list[element] = String(result)
                } else {
                    let alert = UIAlertController(title: "Error", message: "Runtime Error: not available expression", preferredStyle: UIAlertController.Style.alert)
                    let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                    }
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)
                    return ;
                }
            }
            

            if list[0] != "rect" {
                let alert = UIAlertController(title: "Error", message: "change \(list[0]) to rect", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                }
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                return
            }
            if list[1] == "<x>" || Double(list[1]) == nil {
                let alert = UIAlertController(title: "Error", message: "unmatching parameter x", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                }
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                return
            }
            if list[2] == "<y>" || Double(list[2]) == nil {
                let alert = UIAlertController(title: "Error", message: "unmatching parameter y", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                }
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                return
            }
            if list[3] == "<width>" || Double(list[3]) == nil {
                let alert = UIAlertController(title: "Error", message: "unmatching parameter width", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                }
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                return
            }
            if list[4] == "<height>" || Double(list[4]) == nil {
                let alert = UIAlertController(title: "Error", message: "unmatching parameter height", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                }
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                return
            }
            if list[5] == "<color>" || (list[5] != "RED" && list[5] != "GREEN" && list[5] != "BLUE") {
                let alert = UIAlertController(title: "Error", message: "unmatching parameter color", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                }
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                return
            }
            
            if codelist.count >= 2 {
                mission_view.font = UIFont.boldSystemFont(ofSize: 15)
                mission_view.textColor = .green
                mission_view.text = "MISSION SUCCESS"
            }


            switch list[5] {
            case "RED":
                drawRect(pos: CGRect(x: Double(list[1])!, y: Double(list[2])!, width: Double(list[3])!, height: Double(list[4])!), color: UIColor.red.cgColor)
                break
            case "GREEN":
                drawRect(pos: CGRect(x: Double(list[1])!, y: Double(list[2])!, width: Double(list[3])!, height: Double(list[4])!), color: UIColor.green.cgColor)
            case "BLUE":
                drawRect(pos: CGRect(x: Double(list[1])!, y: Double(list[2])!, width: Double(list[3])!, height: Double(list[4])!), color: UIColor.blue.cgColor)
            default: break

            }
        }
    }
    
    func level4() {
        let codelist = swift_code_.text!.components(separatedBy: "\n")
        if codelist.count < 3 {
            let alert = UIAlertController(title: "Error", message: "code is too short", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return ;
        }
        
        if codelist[1].components(separatedBy: " ").joined() == "<code>" {
            let alert = UIAlertController(title: "Error", message: "unexpected placeholder", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return ;
        }
        let forwordlist = codelist[0].components(separatedBy: " ")
        if forwordlist.count != 5 {
            let alert = UIAlertController(title: "Error", message: "only touch placeholder", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return ;
        }
        if forwordlist[0] != "for" || forwordlist[1] != "i" || forwordlist[2] != "in" || forwordlist[4] != "{" {
            let alert = UIAlertController(title: "Error", message: "only touch placeholder", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return ;
        }
        
        let rangeword = forwordlist[3].components(separatedBy: "...")
        if rangeword.count != 2 {
            let alert = UIAlertController(title: "Error", message: "only touch placeholder", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return ;
        }
        if Int(rangeword[1]) == nil {
            let alert = UIAlertController(title: "Error", message: "range should contain only integer", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return ;
        }
        for i in 1...Int(rangeword[1])! {
            for j in 1...codelist.count-2 {
                let newcode = codelist[j].replacingOccurrences(of: "i", with: "\(i)")
                var list = newcode.components(separatedBy: " ").joined().components(separatedBy: ["(", ",", ")"])
                if list.count != 7 {
                    let alert = UIAlertController(title: "Error", message: "missing argument", preferredStyle: UIAlertController.Style.alert)
                    let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                    }
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)
                    return ;
                }
                for element in 1...4 {
                    let expr = NSExpression(format: list[element])
                    if let result = expr.expressionValue(with: nil, context: nil) as? Double {
                        list[element] = String(result)
                    } else {
                        let alert = UIAlertController(title: "Error", message: "Runtime Error: not available expression", preferredStyle: UIAlertController.Style.alert)
                        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                        }
                        alert.addAction(okAction)
                        present(alert, animated: true, completion: nil)
                        return ;
                    }
                }
                if list[0] != "rect" {
                    let alert = UIAlertController(title: "Error", message: "change \(list[0]) to rect", preferredStyle: UIAlertController.Style.alert)
                    let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                    }
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)
                    return
                }
                if list[1] == "<x>" || Double(list[1]) == nil {
                    let alert = UIAlertController(title: "Error", message: "unmatching parameter x", preferredStyle: UIAlertController.Style.alert)
                    let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                    }
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)
                    return
                }
                if list[2] == "<y>" || Double(list[2]) == nil {
                    let alert = UIAlertController(title: "Error", message: "unmatching parameter y", preferredStyle: UIAlertController.Style.alert)
                    let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                    }
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)
                    return
                }
                if list[3] == "<width>" || Double(list[3]) == nil {
                    let alert = UIAlertController(title: "Error", message: "unmatching parameter width", preferredStyle: UIAlertController.Style.alert)
                    let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                    }
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)
                    return
                }
                if list[4] == "<height>" || Double(list[4]) == nil {
                    let alert = UIAlertController(title: "Error", message: "unmatching parameter height", preferredStyle: UIAlertController.Style.alert)
                    let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                    }
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)
                    return
                }
                if list[5] == "<color>" || (list[5] != "RED" && list[5] != "GREEN" && list[5] != "BLUE") {
                    let alert = UIAlertController(title: "Error", message: "unmatching parameter color", preferredStyle: UIAlertController.Style.alert)
                    let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                    }
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)
                    return
                }
                
                if Int(rangeword[1]) == 100 {
                    mission_view.font = UIFont.boldSystemFont(ofSize: 15)
                    mission_view.textColor = .green
                    mission_view.text = "MISSION SUCCESS"
                }


                switch list[5] {
                case "RED":
                    drawRect(pos: CGRect(x: Double(list[1])!, y: Double(list[2])!, width: Double(list[3])!, height: Double(list[4])!), color: UIColor.red.cgColor)
                    break
                case "GREEN":
                    drawRect(pos: CGRect(x: Double(list[1])!, y: Double(list[2])!, width: Double(list[3])!, height: Double(list[4])!), color: UIColor.green.cgColor)
                case "BLUE":
                    drawRect(pos: CGRect(x: Double(list[1])!, y: Double(list[2])!, width: Double(list[3])!, height: Double(list[4])!), color: UIColor.blue.cgColor)
                default: break

                }
            }
        }
    }
    
    func level5() {
        let codelist = swift_code_.text!.components(separatedBy: "\n")
        if codelist.count == 0 {
            let alert = UIAlertController(title: "Error", message: "code is too short", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return ;
        }
        
        var need_run: Array<String> = []
        var isinformode = false
        var start: Int = -1
        var end: Int = -1
        
        for code in codelist {
            var tokens = code.components(separatedBy: ["(", ")", ",", " "])
            if tokens.contains("for") {
                if tokens.contains("rect") {
                    let alert = UIAlertController(title: "Error", message: "ambiguous grammar", preferredStyle: UIAlertController.Style.alert)
                    let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                    }
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)
                    return ;
                }
                if isinformode {
                    let alert = UIAlertController(
                        title: "Error",
                        message: "cannot run 2-depth for expression",
                        preferredStyle: UIAlertController.Style.alert
                    )
                    let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                    }
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)
                    return ;
                } else {
                    isinformode = true
                    if tokens.count != 5 || tokens[0] != "for" || tokens[1] != "i" || tokens[2] != "in" || tokens[4] != "{" {
                        let alert = UIAlertController(
                            title: "Error",
                            message: "wrong for expression (check grammar)",
                            preferredStyle: UIAlertController.Style.alert
                        )
                        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                        }
                        alert.addAction(okAction)
                        present(alert, animated: true, completion: nil)
                        return ;
                    }
                    let rangetoken = tokens[3].components(separatedBy: "...")
                    if rangetoken.count != 2 || Int(rangetoken[0]) == nil || Int(rangetoken[1]) == nil {
                        let alert = UIAlertController(
                            title: "Error",
                            message: "unmatching for range",
                            preferredStyle: UIAlertController.Style.alert
                        )
                        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                        }
                        alert.addAction(okAction)
                        present(alert, animated: true, completion: nil)
                        return ;
                    }
                    start = Int(rangetoken[0])!
                    end = Int(rangetoken[1])!
                }
            } else if tokens.contains("rect") {
                if isinformode {
                    need_run.append(code.trimmingCharacters(in: .whitespacesAndNewlines))
                } else {
                    tokens = code.components(separatedBy: " ").joined().components(separatedBy: [",", ")", "("])
                    if tokens.count != 7 {
                        let alert = UIAlertController(title: "Error", message: "missing argument", preferredStyle: UIAlertController.Style.alert)
                        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            
                        }
                        alert.addAction(okAction)
                        present(alert, animated: true, completion: nil)
                        return ;
                    }
                    if tokens[0] != "rect" {
                        let alert = UIAlertController(title: "Error", message: "change \(tokens[0]) to rect", preferredStyle: UIAlertController.Style.alert)
                        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            
                        }
                        alert.addAction(okAction)
                        present(alert, animated: true, completion: nil)
                        return
                    }
                    if tokens[1] == "<x>" || Int(tokens[1]) == nil {
                        let alert = UIAlertController(title: "Error", message: "unmatching parameter x", preferredStyle: UIAlertController.Style.alert)
                        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            
                        }
                        alert.addAction(okAction)
                        present(alert, animated: true, completion: nil)
                        return
                    }
                    if tokens[2] == "<y>" || Int(tokens[2]) == nil {
                        let alert = UIAlertController(title: "Error", message: "unmatching parameter y", preferredStyle: UIAlertController.Style.alert)
                        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            
                        }
                        alert.addAction(okAction)
                        present(alert, animated: true, completion: nil)
                        return
                    }
                    if tokens[3] == "<width>" || Int(tokens[3]) == nil {
                        let alert = UIAlertController(title: "Error", message: "unmatching parameter width", preferredStyle: UIAlertController.Style.alert)
                        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            
                        }
                        alert.addAction(okAction)
                        present(alert, animated: true, completion: nil)
                        return
                    }
                    if tokens[4] == "<height>" || Int(tokens[4]) == nil {
                        let alert = UIAlertController(title: "Error", message: "unmatching parameter height", preferredStyle: UIAlertController.Style.alert)
                        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            
                        }
                        alert.addAction(okAction)
                        present(alert, animated: true, completion: nil)
                        return
                    }
                    if tokens[5] == "<color>" || (tokens[5] != "RED" && tokens[5] != "GREEN" && tokens[5] != "BLUE") {
                        let alert = UIAlertController(title: "Error", message: "unmatching parameter color", preferredStyle: UIAlertController.Style.alert)
                        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            
                        }
                        alert.addAction(okAction)
                        present(alert, animated: true, completion: nil)
                        return
                    }
                    
                    switch tokens[5] {
                    case "RED":
                        drawRect(pos: CGRect(x: Int(tokens[1])!, y: Int(tokens[2])!, width: Int(tokens[3])!, height: Int(tokens[4])!), color: UIColor.red.cgColor)
                        break
                    case "GREEN":
                        drawRect(pos: CGRect(x: Int(tokens[1])!, y: Int(tokens[2])!, width: Int(tokens[3])!, height: Int(tokens[4])!), color: UIColor.green.cgColor)
                    case "BLUE":
                        drawRect(pos: CGRect(x: Int(tokens[1])!, y: Int(tokens[2])!, width: Int(tokens[3])!, height: Int(tokens[4])!), color: UIColor.blue.cgColor)
                    default: break
                    
                    }
                }
            } else if code.trimmingCharacters(in: .whitespacesAndNewlines) == "}" {
                if isinformode {
                    isinformode = false
                    for element in start...end {
                        for j in 0...need_run.count-1 {
                            let newcode = need_run[j].replacingOccurrences(of: "i", with: "\(element)")
                            var list = newcode.components(separatedBy: " ").joined().components(separatedBy: ["(", ",", ")"])
                            if list.count != 7 {
                                let alert = UIAlertController(title: "Error", message: "missing argument", preferredStyle: UIAlertController.Style.alert)
                                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                                }
                                alert.addAction(okAction)
                                present(alert, animated: true, completion: nil)
                                return ;
                            }
                            for element in 1...4 {
                                let expr = NSExpression(format: list[element])
                                if let result = expr.expressionValue(with: nil, context: nil) as? Double {
                                    list[element] = String(result)
                                } else {
                                    let alert = UIAlertController(title: "Error", message: "Runtime Error: not available expression", preferredStyle: UIAlertController.Style.alert)
                                    let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                                    }
                                    alert.addAction(okAction)
                                    present(alert, animated: true, completion: nil)
                                    return ;
                                }
                            }
                            if list[0] != "rect" {
                                let alert = UIAlertController(title: "Error", message: "change \(list[0]) to rect", preferredStyle: UIAlertController.Style.alert)
                                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                                }
                                alert.addAction(okAction)
                                present(alert, animated: true, completion: nil)
                                return
                            }
                            if list[1] == "<x>" || Double(list[1]) == nil {
                                let alert = UIAlertController(title: "Error", message: "unmatching parameter x", preferredStyle: UIAlertController.Style.alert)
                                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                                }
                                alert.addAction(okAction)
                                present(alert, animated: true, completion: nil)
                                return
                            }
                            if list[2] == "<y>" || Double(list[2]) == nil {
                                let alert = UIAlertController(title: "Error", message: "unmatching parameter y", preferredStyle: UIAlertController.Style.alert)
                                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                                }
                                alert.addAction(okAction)
                                present(alert, animated: true, completion: nil)
                                return
                            }
                            if list[3] == "<width>" || Double(list[3]) == nil {
                                let alert = UIAlertController(title: "Error", message: "unmatching parameter width", preferredStyle: UIAlertController.Style.alert)
                                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                                }
                                alert.addAction(okAction)
                                present(alert, animated: true, completion: nil)
                                return
                            }
                            if list[4] == "<height>" || Double(list[4]) == nil {
                                let alert = UIAlertController(title: "Error", message: "unmatching parameter height", preferredStyle: UIAlertController.Style.alert)
                                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                                }
                                alert.addAction(okAction)
                                present(alert, animated: true, completion: nil)
                                return
                            }
                            if list[5] == "<color>" || (list[5] != "RED" && list[5] != "GREEN" && list[5] != "BLUE") {
                                let alert = UIAlertController(title: "Error", message: "unmatching parameter color", preferredStyle: UIAlertController.Style.alert)
                                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                                }
                                alert.addAction(okAction)
                                present(alert, animated: true, completion: nil)
                                return
                            }

                            switch list[5] {
                            case "RED":
                                drawRect(pos: CGRect(x: Double(list[1])!, y: Double(list[2])!, width: Double(list[3])!, height: Double(list[4])!), color: UIColor.red.cgColor)
                                break
                            case "GREEN":
                                drawRect(pos: CGRect(x: Double(list[1])!, y: Double(list[2])!, width: Double(list[3])!, height: Double(list[4])!), color: UIColor.green.cgColor)
                            case "BLUE":
                                drawRect(pos: CGRect(x: Double(list[1])!, y: Double(list[2])!, width: Double(list[3])!, height: Double(list[4])!), color: UIColor.blue.cgColor)
                            default: break

                            }
                        }
                    }
                    need_run = []
                } else {
                    let alert = UIAlertController(title: "Error", message: "unmatching brace", preferredStyle: UIAlertController.Style.alert)
                    let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                    }
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)
                    return ;
                }
            } else if code.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                continue
            } else {
                let alert = UIAlertController(title: "Error", message: "strange grammar(neither for and rect function)", preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { (action) in

                }
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                return ;
            }
        }
        mission_view.font = UIFont.boldSystemFont(ofSize: 15)
        mission_view.textColor = .green
        mission_view.text = "MISSION SUCCESS"
    }
    
    @objc internal func onRun(_ sender: Any) {
        UIGraphicsBeginImageContext(sketchboard.frame.size)
        if round == 1 {
            level1()
        } else if round == 2 {
            level2()
        } else if round == 3 {
            level3()
        } else if round == 4 {
            level4()
        } else if round == 5 {
            level5()
        }
        UIGraphicsEndImageContext()
    }
    
    @objc internal func sizeUpFont(_ sender: Any) {
        if nowfontsize == 15 {
            nowfontsize = 25
        } else {
            nowfontsize = 15
        }
        textViewDidChange(swift_code_)
    }
}
