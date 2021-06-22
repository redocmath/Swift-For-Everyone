/*:
 ---
 # Swift For Everyone
 ### LEVEL 2 - Because Coding Shouldn't End In One Line!
 ---
 ![level2_intro.png](level2_intro.png)
 
 ## 📜 Snippet
 - **Rect Function**: ```rect(<x>, <y>, <width>, <height>, <color>)```
 
 ---
 ### [Next Level](@next)
*/
import PlaygroundSupport

let level2 = MainView()
let desc2 = """
level2> ./desc
Coding should not end at one-line code.
Let's add more 'rect function'!

mission: add more rect function and run! (least 2 lines)
"""
level2.set(code: "rect(<x>, <y>, <width>, <height>, <color>)", desc: desc2, rnd: 2)
PlaygroundPage.current.liveView = level2
