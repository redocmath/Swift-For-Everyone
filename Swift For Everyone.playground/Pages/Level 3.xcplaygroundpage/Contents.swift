/*:
 ---
 # Swift For Everyone
 ### LEVEL 3 - Repeat One More Time, Please
 ---
 ![level3_intro.png](level3_intro.png)
 
 ## 📜 Snippet
 - **For**: ```for i in 1...10 {}```
 - **Rect Function**: ```rect(<x>, <y>, <width>, <height>, <color>)```
 
 ---
 ### [Next Level](@next)
*/
import PlaygroundSupport

let level3 = MainView()
let desc3 = """
level3> ./desc
When you want to draw three rects,
you may use rect three times

But, there is another way to repeat.
It is 'For Expression'

mission: draw ten rects with for
(draw rect different position from others)

> hint: use variable i
"""
level3.set(code: "for i in 1...10 {\n    <code>\n}", desc: desc3, rnd: 3)
PlaygroundPage.current.liveView = level3
