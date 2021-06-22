/*:
 ---
 # Swift For Everyone
 ### LEVEL 1 - Dive into Swift!
 ---
 ![level1_intro.png](level1_intro.png)
 
 ## 📜 Snippet
 - **Rect Function**: ```rect(<x>, <y>, <width>, <height>, <color>)```
 
 ---
 ### [Next Level](@next)
*/
import PlaygroundSupport

// Present the view controller in the Live View window
let level1 = MainView()
let desc = """
level1> ./desc

Swift is a programming language makes it easy to write software

mission: change placeholder and run! (do not add more line)
Notice: <color> can be filled with RED, GREEN, BLUE. Also, other placeholders should be filled with Integer.
"""
level1.set(code: "rect(<x>, <y>, <width>, <height>, <color>)", desc: desc, rnd: 1)
PlaygroundPage.current.liveView = level1
