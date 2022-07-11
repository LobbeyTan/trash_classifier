# roslaunch jupiterobot_arm_bringup joints_bringup.launch

rostopic pub -1 /elbow_controller/command std_msgs/Float64 -- 0.0                                             # Move the robot elbow to default origin position
rostopic pub -1 /hand_controller/command std_msgs/Float64 -- 1.0                                              # Open the robot hand

rostopic pub -1 /elbow_controller/command std_msgs/Float64 -- 2.0                                             # Move the robot elbow with position set to 2.0

rostopic pub -1 /mobile_base/commands/velocity geometry_msgs/Twist -- '[0.5, 0.0, 0.0]' '[0.0, 0.0, 0.0]'     # Command to move the robot foward

rostopic pub -1 /hand_controller/command std_msgs/Float64 -- -0.8                                             # Closs the hand of the robot to take something

rostopic pub -1 /elbow_controller/command std_msgs/Float64 -- 1.0                                             # Move the robot elbow upward at position 1.0

rostopic pub -1 /mobile_base/commands/velocity geometry_msgs/Twist -- '[-0.5, 0.0, 0.0]' '[0.0, 0.0, 0.0]'    # Command to move the robot backward

rostopic pub -1 /mobile_base/commands/velocity geometry_msgs/Twist -- '[0.0, 0.0, 0.0]' '[0.0, 0.0, -1.5]'    # Turn the robot for 15 degree
rostopic pub -1 /mobile_base/commands/velocity geometry_msgs/Twist -- '[0.0, 0.0, 0.0]' '[0.0, 0.0, -1.5]'    # Turn the robot for another 15 degree
rostopic pub -1 /mobile_base/commands/velocity geometry_msgs/Twist -- '[0.0, 0.0, 0.0]' '[0.0, 0.0, -1.5]'    # Turn the robot for another 15 degree


rostopic pub -1 /mobile_base/commands/velocity geometry_msgs/Twist -- '[0.5, 0.0, 0.0]' '[0.0, 0.0, 0.0]'     # Command to move the robot foward

rostopic pub -1 /elbow_controller/command std_msgs/Float64 -- 2.0                                             # Move the robot elbow downward


rostopic pub -1 /hand_controller/command std_msgs/Float64 -- 1.0                                              # Release the item on hand


