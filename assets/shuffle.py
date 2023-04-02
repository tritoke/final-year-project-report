#!/usr/bin/env python

import numpy as np
from PIL import Image
import random

orig = np.asarray(Image.open("key.png"))

# crop to 800x800 because why the fuck is it 803 by 801???
img = orig[1:,3:,:]

split_x = split_y = 4

w,h,_ = img.shape
cw,ch = w // split_x, h // split_y

chunks = [
    img[x*cw:(x+1)*cw,y*cw:(y+1)*cw,:]
    for y in range(4)
    for x in range(4)
]

# consistency is key 🤪
random.seed(10)
random.shuffle(chunks)

new_img = np.zeros((w,h,4), dtype="uint8")
for i,chunk in enumerate(chunks):
    y,x = divmod(i, 4)
    new_img[x*cw:(x+1)*cw,y*cw:(y+1)*cw,:] = chunk

Image.fromarray(new_img).save("shuffled_key.png")
