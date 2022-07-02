# import the opencv library
from calendar import c
from statistics import mode
from unittest import result
from matplotlib import image
from detector import model
import cv2
import numpy as np
  
  
if __name__ == "__main__":
    # Import labels
    with open('labels.txt', 'r') as file:
        labels = list(map(lambda x: x.strip(), file.readlines()))

    # define a video capture object
    vid = cv2.VideoCapture(2)

    
    
    while(True):
        
        # Capture the video frame
        # by frame
        ret, frame = vid.read()

        pred = model(frame)

        bboxes = pred.pandas().xyxy

        dict_result = bboxes[0].to_dict()

        n_results = len(dict_result['name'])

        annotated_img = frame

        for i in range(n_results):
            start_point = (int(dict_result['xmin'][i]), int(dict_result['ymin'][i]))
            font_point = (int(dict_result['xmin'][i]), int(dict_result['ymin'][i]) - 20)
            end_point = (int(dict_result['xmax'][i]), int(dict_result['ymax'][i]))
            pred_class = dict_result['class'][i]
            pred_label = labels[pred_class]
            accuracy = dict_result['confidence'][i] * 100

            print("%s %.2f" % (pred_label, accuracy))

            pred_class += 1

            if pred_class in [12, 42, 74]: # Paper (Blue)
                color = (255, 0, 0) 
                pred_label = "paper" 
            elif pred_class in [38, 40, 65, 66, 68]: # Plastic / Can (Orange)
                color = (0, 128, 255) 
                pred_label = "plastic"
            elif pred_class in [43, 44, 45, 77]: # Metal (Brown)
                color = (0, 76, 153)
                pred_label = "metal"
            else:
                continue

            
            label = "%s %.2f" % (pred_label, accuracy)

            thickness = 2
            font = font = cv2.FONT_HERSHEY_COMPLEX_SMALL

            cv2.rectangle(annotated_img, start_point, end_point, color, thickness)
            cv2.putText(annotated_img, label, font_point, font, 0.7, color)
    
        # Display the resulting frame
        cv2.imshow('Trash Detector', annotated_img)
        
        # the 'q' button is set as the
        # quitting button you may use any
        # desired button of your choice
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
    
    # After the loop release the cap object
    vid.release()
    # Destroy all the windows
    cv2.destroyAllWindows()