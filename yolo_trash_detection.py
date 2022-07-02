from unittest import result
import torch

model = torch.hub.load('ultralytics/yolov5', 'yolov5s')

imgs = ['https://ultralytics.com/images/zidane.jpg',
        'https://miro.medium.com/max/600/1*0ttFuc9a8RMCQxCbrNeMNg.png']

print(dir(model))

print(model.names)