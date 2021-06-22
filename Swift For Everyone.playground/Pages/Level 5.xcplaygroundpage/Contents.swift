/*:
 ---
 # Swift For Everyone
 ### LEVEL 5 - Draw with Swift without limit
 ---
 ![level5_intro.png](level5_intro.png)
 
 ## 📜 Snippet
 - **For**: ```for i in <start>...<end> {}```
 - **Rect Function**: ```rect(<x>, <y>, <width>, <height>, <color>)```
 
 ## 🎨 Try It!
 ```
 for i in 1...1000 {
     rect(0, 0, i*3, i*3, RED)
     rect(0, 0, i*4, i*4, GREEN)
     rect(0, 0, i*5, i*5, BLUE)
 }
 ```
 ---
 Not End, It's Beginning. Enjoy WWDC and continue to change the world 😃
*/
import PlaygroundSupport

let level5 = MainView()
let desc5 = """
level5> ./desc
We're almost done! At this level, draw you want to with rect functions and For Expressions!

mission: draw anything by coding, and click 'done' button
"""
level5.set(code: "", desc: desc5, rnd: 5)
PlaygroundPage.current.liveView = level5
