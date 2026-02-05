

'''NEW TERMS CLAIFICATION

.split

    - Takes a sentence and cuts it into pieces based on a specified separator. It returns a list of the pieces.

    EXAMPLE 1: "My favorite color is blue"
          ↓
    .split("my favorite color is")
          ↓
    ["", " blue"]

    EXAMPLE 2: color = user_input.split("my favorite color is")[-1]
    - This takes the last piece from the list, which is " blue", and assigns it to the variable 'color'.


.strip()  
    - Removes any extra spaces from the beginning and end of        a string.

    EXAMPLE: " blue ".strip()
    "blue"

Putting .split and .strip() together:
    - In the code, we use:
        user_input.split("my favorite color is")[-1].strip()        
        to get the color the user mentioned without any extra       spaces.

.lower()  
    - Converts all letters in a string to lowercase.

    EXAMPLE: "Hello World".lower()
    "hello world"
    Question: Why is this useful?
      - It helps the program understand user input regardless of how they type it (e.g., "Blue", "blue", or "BLUE" all become "blue").


WEEK 1 AI CONCEPT: 
    - Normalize user input to make it easier for the AI to un       derstand and respond correctly.
      
'''
