#!/usr/bin/env python

import rospy
import numpy as np
from std_msgs.msg import Int32
from sensor_msgs.msg import JointState
from control_msgs.msg import FollowJointTrajectoryGoal 
from control_msgs.msg import FollowJointTrajectoryActionGoal
from std_msgs.msg import Float32MultiArray
import time
#A = np.empty((0,4))
#print(A)
class pubsub(object):
    def __init__(self):
        rospy.init_node('Serial_helper')
        self.value = Float32MultiArray()
        self.value.data = [0, 0, 1.57, 0]
        self.jointStates = [0, 0, 1.57, 0]
        self.pub = rospy.Publisher('/setpoint2arduino', Float32MultiArray, queue_size=1000)
        rospy.Subscriber('/robotleg/robotleg_controller/follow_joint_trajectory/goal', FollowJointTrajectoryActionGoal, self.update_value)
        rospy.Subscriber('/joint_states', JointState, self.get_joints)
        rospy.spin()

    def update_value(self, msg):
        self.numViapoints = len(msg.goal.trajectory.points)
        for j in range(4):
            self.value.data[j] = msg.goal.trajectory.points[i].positions[j]
            rospy.loginfo("I received : %f", msg.goal.trajectory.points[i].positions[j])

    def get_joints(self, msg):
        self.jointStates = msg.position
        if(self.tol()):                                                         #Publish setpoints if within tolerance 
           self.pub.publish(self.value)
    
    def tol(self):
        tolerance = True
        for i in range(4):
         if abs(self.value.data[i] - self.jointStates[i]) > 0.01:         ##Check if within tolerance curently 10 degrees
            tolerance = False
        return tolerance

    def self.main():
        x = pubsub()
        rospy.spin




if __name__ == '__main__':
    x = pubsub()
    x.main()
    rospy.spin