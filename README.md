# Hand-Joint-Detection-using-CV-and-DL
1. Introduction
Osteoarthritis (OA) is a prevalent form of arthritis affecting the knees, hips, and hand joints. Currently, manual screening and classification of hand OA involve a trained radiologist marking finger joints on X-ray images and performing measurements to assess disease severity. Due to the time-consuming nature of manual labeling, there is a pressing need for automatic computer-aided methods. The initial step in hand OA identification is to locate hand joints, including the Metacarpophalangeal (MCP), Proximal Interphalangeal (PIP), and Distal Interphalangeal (DIP) joints on each finger. This project aims to develop an algorithm that automates the detection of twelve joints in each hand X-ray image. The identified joints serve as regions of interest for subsequent OA severity assessment, including Kellgren and Lawrence (KL) grade and Joint Space Width (JSW) determination. Fig. 1 illustrates an example X-ray image with joint labels and angled bounding boxes.

![image](https://github.com/shriyaharal7/Hand-Joint-Detection-using-CV-and-DL-/assets/67820562/dab2f964-6fc2-41d5-936b-0c81ee68d630)

Fig. 1: Hand X-ray with joint labels (the dots) and angled bounding boxes

2. Task
The primary task of this project is to devise an algorithm capable of automatically detecting the positions of twelve joints in each hand X-ray image. The input to the algorithm is an image, and the expected output is the coordinates of the center of the twelve joints. Two distinct solution approaches are outlined:

Solution 1: Computer Vision Algorithm
Develop a computer vision algorithm leveraging image features such as edges, shapes, and intensity ranges. The algorithm should progress through image processing steps, including binarization, morphological operations, edge detection, etc., to accurately locate the joints. The goal is to create a step-by-step image analysis pipeline that robustly identifies hand joints.

Solution 2: Deep Learning for Object Detection
This repository contains the code for developing a convolutional neural network (CNN) for X-ray joint detection. The model aims to accurately locate joint positions in X-ray images, providing valuable information for medical imaging applications.

Instructions for Usage
Follow the instructions provided in the subsequent sections to implement Solution 1 or Solution 2 based on your preference. Detailed steps for data preparation, code execution, and result interpretation will be provided within each solution's dedicated section.

Dependencies
The implementation of both solutions relies on MATLAB with the Image Processing Toolbox for Solution 1 and on a suitable deep learning framework for Solution 2. Ensure to have the required dependencies installed before proceeding.

Feel free to explore either solution based on your expertise and preferences, aiming to contribute to the automation of hand joint detection for improved efficiency in Osteoarthritis screening.
