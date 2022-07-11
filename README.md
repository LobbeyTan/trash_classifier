# Littering Observation Intelligent (LOI)

## Project Description

Littering Observation Intelligent (LOI) is a robot that helps people clean up the environments by collecting rubbish and promote recycling by classifying rubbish into recyclable categories. It is equipped with advanced object recognition capability with integrated Artificial Intelligence (AI) module to detect wastes and classify them into different types of garbage. Besides, it is able to manipulate its arm to grab different types of rubbish.

## Getting Started

Navigate to the catkin_ws/src folder

> `cd ~/catkin_ws/src`

Clone the repository in the src directory

> `git clone https://github.com/LobbeyTan/trash_detector`

Build the clone package

> `catkin_make`

## Run the Robot Navigation Script

To run this script, make sure you are using the **Jupiter Robot** and not the **Juno IO robot**.

First you need to lauch the minimal.launch to ready the robot for movement

> `roslaunch turtlebot_bringup minimal.launch`

The you also need to launch the joints_bringup.launch to ready the robot for arm movement

> `roslaunch jupiterobot_arm_bringup joints_bringup.launch`

After all the robot setups, you can run the navigation scripts. This script hardcoded the robot movements and make you you remove all the obstacles surround the robot.

> `source arm_movement.sh`

## Run the Modified Openvino Yolo

We have modified the pre-built robot_vision_openvino module and use it for our object detection and trash classification tasks. In specific, we modified the yolov3/yolov3.names to map the object to respective recycle categories.

First run the roscore which is the pre-requisites of a ROS-based system

> `roscore`

Then open the robot camera

> `roslaunch usb_cam usb_cam-test.launch`

Then run the modified robot_vision_openvino

> `roslaunch robot_vision_openvino yolo_ros.launch`

## Run the Pre-Trained YoloV5x Model

Our rubbish detector system is implemented with transfer learning, which is a pre-trained CNN model and we further fine tune the model with our additional data. The pretrained model that we used is called YoloV5x which is the one of the YOLO architecture family.

Make sure you are in the correct directory

> `cd ~/catkin_ws/src/trash_detector`

Firstly, create a new virtual environment

> `virtualenv venv`

Activate the environment

> `source venv\bin\activate`

Install required dependencies / packages

> `pip install -r requirements.txt`

Navigate to the src folder

> `cd src/`

Run the YoloV5x detection to detect and classify objects into recycle categories

> `python3 trash_detector.py`
