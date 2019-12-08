Lightning
=========

One way to simulate lightning is with a random walk. In this assignment you will create a program that uses a random walk to seemingly shoot lightning from one side of the screen to the other every time the mouse is pressed. You may find the PowerPoint sides 142 to 170 of the [PDF](https://drive.google.com/file/d/0ByC9Jv9OkYcJWGFxbXV3aXJiazA/view?usp=sharing) presentation and pages 177-190 of this [PDF](https://drive.google.com/file/d/0ByC9Jv9OkYcJenVSZjJMZEMxQUE/view?usp=sharing)  and/or the [Math.random worksheet](https://drive.google.com/file/d/0Bz2ZkT6qWPYTSU84X3FSOGYwdFU/view?usp=sharing) helpful.  Here are some steps to get you started:

1. Read this thoroughly.
2. Then, open the Lightning.pde file. You'll need to add some code
At the top of the program, declare 4 `int` variables `startX`, `startY`, `endX` and `endY`. Initialize `startX` to 0, `startY` to 150, `endX` to 0 and `endY` to 150
3. `void setup()` needs to set the `strokeWeight()` and `background()` of your applet
4. `void draw()` needs to do two things:  
  -set the `stroke()`color of the lightning bolt to some random value using `Math.random()`   
  -a `while` loop that repeats the following until the `endX` is off the screen:    
    1. set `endX` to `startX` plus a random integer from 0 to 9  
    2. set `endY` to `startY` plus a random integer from -9 to 9  
    3. draw a `line()` with endpoints `startX`,`startY`,`endX`,`endY`    
    4. set `startX` equal to `endX` 
    5. set `startY` equal to `endY`
5. `void mousePressed()` needs to set `startX`,`startY`,`endX`,`endY` back to their original values.  
5. You will need to modify `index.html` to customize your website with it's own title, headline and footer. When you are happy with your program, push your finished project up to GitHub
6. The final step is to submit the URL for your website via the Google Form for the assignment on Schoology. Don't hesitate to ask for help if your aren't sure how something is supposed to work.

