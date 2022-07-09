# roslaunch jupiterobot_arm_bringup joints_bringup.launch

rostopic pub -1 /elbow_controller/command std_msgs/Float64 -- 0.0
rostopic pub -1 /hand_controller/command std_msgs/Float64 -- 1.0

rostopic pub -1 /elbow_controller/command std_msgs/Float64 -- 2.0

rostopic pub -1 /mobile_base/commands/velocity geometry_msgs/Twist -- '[0.5, 0.0, 0.0]' '[0.0, 0.0, 0.0]'

rostopic pub -1 /hand_controller/command std_msgs/Float64 -- -0.8

rostopic pub -1 /elbow_controller/command std_msgs/Float64 -- 1.0

rostopic pub -1 /mobile_base/commands/velocity geometry_msgs/Twist -- '[-0.5, 0.0, 0.0]' '[0.0, 0.0, 0.0]'

rostopic pub -1 /mobile_base/commands/velocity geometry_msgs/Twist -- '[0.0, 0.0, 0.0]' '[0.0, 0.0, -1.5]'
rostopic pub -1 /mobile_base/commands/velocity geometry_msgs/Twist -- '[0.0, 0.0, 0.0]' '[0.0, 0.0, -1.5]'
rostopic pub -1 /mobile_base/commands/velocity geometry_msgs/Twist -- '[0.0, 0.0, 0.0]' '[0.0, 0.0, -1.5]'


rostopic pub -1 /mobile_base/commands/velocity geometry_msgs/Twist -- '[0.5, 0.0, 0.0]' '[0.0, 0.0, 0.0]'

rostopic pub -1 /elbow_controller/command std_msgs/Float64 -- 2.0


rostopic pub -1 /hand_controller/command std_msgs/Float64 -- 1.0


