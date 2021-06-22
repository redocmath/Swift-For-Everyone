/*:
 ---
 # Swift For Everyone
 ### LEVEL 3 - 'For' Needs Mutable-Range for Flexible Coding
 ---
 ![level4_intro.png](level4_intro.png)
 
 ## 📜 Snippet
 - **For**: ```for i in 1...<count> {}```
 - **Rect Function**: ```rect(<x>, <y>, <width>, <height>, <color>)```
 
 ---
 ### [Next Level](@next)
*/
import PlaygroundSupport

let level4 = MainView()
let desc4 = """
level4> ./desc
for i in 1...10
we know what that means, right?
It let code repeat ten times.

Meanwhile, how can we repeat a hundred times? Think about how we do and write a code that repeats 100 times.

At this level, you can add more rect functions in the code parameter.

mission: change placeholder and let code repeat a hundred times.
(you should draw something)
"""
level4.set(code: "for i in 1...<count> {\n    <code>\n}", desc: desc4, rnd: 4)
PlaygroundPage.current.liveView = level4
