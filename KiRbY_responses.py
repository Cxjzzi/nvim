#This file handles the responses of the KiRbY agent.

# Import necessary functions from KiRbY_memory

from KiRbY_memory import get_favorite_color, set_favorite_color

def handle_input(user_input):
        if "how are you" in user_input:
            print("I'm just a bunch of code, but thanks for asking!")

        elif "what is your name" in user_input:
             print("I am TeRm_KiRbY, your friendly AI assistant.")



        # Remembering user preferences

    elif "favorite color" in user_input:

            #Case 1: User says "my favourite color is purple"
            if "my favorite color is" in user_input:
                color = user_input.split("my favorite color is")[-1].strip()
                memory["favorite_color"] = color
                print(f"Got it! I'll remember that your favorite color is {color}.")

            #Color Options:

            elif user_input in ["purple", "blue", "red", "green", "yellow", "pink"]:
                memory["favorite_color"] = user_input
                print(f"Thanks! I'll remember your favorite color is {user_input}.")

            #Case 2: User asks "what is my favourite color?"

            elif "favorite_color" in memory:
                print(f"Your favorite color is {memory['favorite_color']}, right?")

            #Case 3: User asks "what is my favourite color?" but it is not known yet

        else:
             print("I don't know your favorite color yet. What is it?")

    elif "adios" in user_input:
        print(f"Goodbye, {user_name}! It was nice talking to you.")
        break

    else:
        print("Bruh... I'm not sure how to respond to that. Can you ask something else?")

return None # Indicate that the function does not return any value

