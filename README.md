# Robot-leg
Repository for Bachelor group E2103 at NTNU. We are four Automation and Robotics students building a test system for a 4 DOF robotic leg. This Repository will include; Arduino code for embedded controllers, our ROS workspace and URDF model, and MATLAB code for calculations such as IK.<br />
The four joints are actuated by Brushed-DC motors.<br />
Joint states are kept track of by incremental encoders, which communicate with the embedded controller on I2C bus.<br />
The embedded controller is Arduino Mega running as a ROS Serial Node.<br />

The complete thesis can be accessed [here](https://ntnuopen.ntnu.no/ntnu-xmlui/handle/11250/2781045).


![3D Model](https://github.com/VegardHovland/E2103-Bachelor/blob/main/163385725_524834042242400_6926905120112491868_n.png)

## 3D model
To facilitate furter work on the project, .stl files are provided for all printed parts. In addition, project files for both the one legged robot and a quadrupedal version is added. To open the .f3z files a project will have to be created in Fusion 360 and the files added to that project using the upload button.
