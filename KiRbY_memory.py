# This file handles saving and loading of the KiRbY agent's memory.

memory = {} 

def set_favorite_color(color):
    memory["favorite_color"] = color

def get_favorite_color():
    return memory.get("favorite_color")


