---
title: "Data Cleaning Assignment Codebook"
author: "Jack Israel"
date: "28/06/2020"
output:
  html_document: default
  pdf_document: default
---


# Notes on Cleaning

Note that in order to create final_dataset, several smaller provided data sets were merged together. In this process, cleaning was done on X_Test.txt and X_Training.txt in order to read them properly; specifically, all multiple-spaces in the text files were replaced with single spaces. Without this cleaning, the resulting data frames had more columns than there were variables and many instances of NA values.

# Notes on Variables

## Two Types of Variables in final_dataset
 1. Label Variables - "Subject Number" & "Activity Type"
 2. Measurement Variables - All other variables

## Describing the Label Variables:

Subject Number - Which (experimental) subject performed the action that generated the measurements on that row. The group of 30 subjects is labelled from 1-30.

Activity Type - Which of six prescribed activities the subject was performing while the measurements on that row were taken.

 * Walking - Walking on a flat surface
 * Walking_Upstairs - Walking up stairs
 * Walking_Downstairs - Walking down stairs
 * Sitting - Sitting down
 * Standing - Standing in place
 * Laying - Lying down

## Describing the Measurement Variables:

Note that the 'measurement data' in final_dataset are averages of several measurements taken from a specific subject performing a particular activity.

* The variables labelled with "Time Domain" are measurements of signals captured at a constant rate of 50 Hz. 

* The variables labelled with "Frequency Domain" are transformations of their associated "Time Domain" counterparts, calculated using a Fast Fourier Transform.

* Variables labelled with "Mean" are the means of several measurements taken within the same session. (This averaging process was performed prior to the second average, taken over multiple instances of the same person performing the same activity, which was used to create final_dataset)

* Variables labelled with "Std. Dev." are the standard deviations of those ranges of measurements taken within the same session.

* Measurements taken from the "Accelerometer" are signals that correspond to acceleration.

* Measurements taken from the "Gyroscope" are signals that correspond to angular velocity.

* Variables labelled with "Body" and "due to Gravity" are two sections of the original measured acceleration signal, that were divided in order to distinguish the movements of the subject from the constant effects of gravity.

* Variables labelled with "X/Y/Z Direction" are parts of a singal measurement divided along XYZ-directional axes.

* Variables labelled with "Magnitude" are calculations of the actual value of the measurement in question, combinging the triaxial directional signals using the Euclidean Norm.

* Varibales labelled with "Jerk" are transformations of the linear acceleration and angular velocity measurements, which were created by deriving the original signals in time.

* The variables labelled with "Mean Frequency" are a weighted average of the frequency components to obtain a mean frequency. (This averaging process was performed prior to the second average, which was used to create final_dataset)

## List of Measurement Variables

3. Time Domain - Mean Body Accelerometer Signal – X Direction
4. Time Domain - Mean Body Accelerometer Signal – Y Direction
5. Time Domain - Mean Body Accelerometer Signal – Z Direction
6. Time Domain - Std. Dev. of Body Accelerometer Signal – X Direction
7. Time Domain - Std. Dev. of Body Accelerometer Signal – Y Direction
8. Time Domain - Std. Dev. of Body Accelerometer Signal – Z Direction  
9. Time Domain - Mean Accelerometer Signal due to Gravity – X Direction  
10. Time Domain - Mean Accelerometer Signal due to Gravity – Y Direction  
11. Time Domain - Mean Accelerometer Signal due to Gravity – Z Direction   
12. Time Domain - Std. Dev. of Accelerometer Signal due to Gravity – X Direction  
13. Time Domain - Std. Dev. of Accelerometer Signal due to Gravity – Y Direction  
14. Time Domain - Std. Dev. of Accelerometer Signal due to Gravity – Z Direction  
15. Time Domain - Mean Body Linear Accel. Jerk – X Direction  
16. Time Domain - Mean Body Linear Accel. Jerk – Y Direction  
17. Time Domain - Mean Body Linear Accel.  Jerk – Z Direction  
18. Time Domain - Std. Dev. of Body Linear Accel.  Jerk – X Direction  
19. Time Domain - Std. Dev. of Body Linear Accel.  Jerk – Y Direction  
20. Time Domain - Std. Dev. of Body Linear Accel.  Jerk – Z Direction  
21. Time Domain - Mean Body Gyroscope Signal – X Direction  
22. Time Domain - Mean Body Gyroscope Signal – Y Direction  
23. Time Domain - Mean Body Gyroscope Signal – Z Direction  
24. Time Domain - Std. Dev. of Body Gyroscope Signal – X Direction  
25. Time Domain - Std. Dev. of Body Gyroscope Signal – Y Direction  
26. Time Domain - Std. Dev. of Body Gyroscope Signal – Z Direction  
27. Time Domain - Mean Angular Velocity Jerk – X Direction  
28. Time Domain - Mean Angular Velocity Jerk – Y Direction  
29. Time Domain - Mean Angular Velocity Jerk – Z Direction  
30. Time Domain - Std. Dev. of Angular Velocity Jerk – X Direction  
31. Time Domain - Std. Dev. of Angular Velocity Jerk – Y Direction  
32. Time Domain - Std. Dev. of Angular Velocity Jerk – Z Direction  
33. Time Domain - Mean of Body Accelerometer Signal Magnitude  
34. Time Domain - Std. Dev. of Accelerometer Signal Magnitude  
35. Time Domain - Mean of Accelerometer Signal Magnitude due to Gravity  
36. Time Domain - Std. Dev. of Accelerometer Signal Magnitude due to Gravity  
37. Time Domain - Mean of Body Linear Accel. Jerk Magnitude  
38. Time Domain - Std. Dev. of Magnitude of Body Linear Accel. Jerk  
39. Time Domain - Mean of Body Gyroscope Signal Magnitude  
40. Time Domain - Std. Dev. of Body Gyroscope Signal Magnitude  
41. Time Domain - Mean of Body Angular Velocity Jerk Magnitude  
42. Time Domain - Std. Dev. of Body Angular Velocity Jerk Magnitude  
43. Freq. Domain - Mean Body Accelerometer Signal – X Direction  
44. Freq. Domain - Mean Body Accelerometer Signal – Y Direction  
45. Freq. Domain - Mean Body Accelerometer Signal – Z Direction  
46. Freq. Domain - Std. Dev. of Body Accelerometer Signal – X Direction  
47. Freq. Domain - Std. Dev. of Body Accelerometer Signal – Y Direction  
48. Freq. Domain - Std. Dev. of Body Accelerometer Signal – Z Direction  
49. Freq. Domain - (Weighted) Average of the Body Accelerometer Signal Frequency – X Direction
50. Freq. Domain - (Weighted) Average of the Body Accelerometer Signal Frequency – Y Direction
51. Freq. Domain - (Weighted) Average of the Body Accelerometer Signal Frequency – Z Direction
52. Freq. Domain - Mean Body Linear Accel. Jerk – X Direction  
53. Freq. Domain - Mean Body Linear Accel. Jerk – Y Direction  
54. Freq. Domain - Mean Body Linear Accel.  Jerk – Z Direction  
55. Freq. Domain - Std. Dev. of Body Linear Accel.  Jerk – X Direction  
56. Freq. Domain - Std. Dev. of Body Linear Accel.  Jerk – Y Direction  
57. Freq. Domain - Std. Dev. of Body Linear Accel.  Jerk – Z Direction  
58. Freq. Domain - (Weighted) Average of the Linear Accel. Jerk Frequency – X Direction
59. Freq. Domain - (Weighted) Average of the Linear Accel. Jerk Frequency – Y Direction
60. Freq. Domain - (Weighted) Average of the Linear Accel. Jerk Frequency – Z Direction
61. Freq. Domain - Mean Body Gyroscope Signal – X Direction
62. Freq. Domain - Mean Body Gyroscope Signal – Y Direction
63. Freq. Domain - Mean Body Gyroscope Signal – Z Direction
64. Freq. Domain - Std. Dev. of Body Gyroscope Signal – X Direction
65. Freq. Domain - Std. Dev. of Body Gyroscope Signal – Y Direction
66. Freq. Domain - Std. Dev. of Body Gyroscope Signal – Z Direction
67. Freq. Domain - (Weighted) Average of the Body Gyroscope Signal Frequency – X Direction
68. Freq. Domain - (Weighted) Average of the Body Gyroscope Signal Frequency – Y Direction
69. Freq. Domain - (Weighted) Average of the Body Gyroscope Signal Frequency – Z Direction
70. Freq. Domain - Mean of Body Accelerometer Signal Magnitude
71. Freq. Domain - Std. Dev. of Accelerometer Signal Magnitude
72. Freq. Domain - (Weighted) Average of the Accelerometer Signal Magnitude Frequency
73. Freq. Domain - Mean of Body Linear Accel. Jerk Magnitude
74. Freq. Domain - Std. Dev. of Body Linear Accel. Jerk Magnitude
75. Freq. Domain - (Weighted) Average of the Body Linear Accel. Jerk Magnitude Frequency
76. Freq. Domain - Mean of Body Gyroscope Signal Magnitude  
77. Freq. Domain - Std. Dev. of Body Gyroscope Signal Magnitude  
78. Freq. Domain - (Weighted) Average of the Body Gyroscope Signal Magnitude Frequency
79. Freq. Domain - Mean of Body Angular Velocity Jerk Magnitude  
80. Freq. Domain - Std. Dev. of Magnitude of Body Angular Velocity Jerk  
81. Freq. Domain - (Weighted) Average of the Body Angular Velocity Jerk Magnitude Frequency