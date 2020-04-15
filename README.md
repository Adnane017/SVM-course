# An introduction to support vector machines with applications in R

### By [Adnane Ez-zizi](https://aezzizi.com) ([@Adnane_E1](https://twitter.com/Adnane_E1))

---

## Description

I taught this 1.5 hour-long course as part of the social analytics & visualisation workshop, which was organised by the Data Analytics and Society centre for doctoral training (University of Sheffield) in June 2018. It covers the basics of support vector machines with hands-on activities in R. The content of the tutorial was slightly modified post delivery to make it as a stand-alone public ressource.     

## Outline

* Maximal margin classifier
     - Intuition
     - Maximal margin classifier as an optimisation problem
     - Geometric view of the optimisation problem
     - Application in R
* Soft margin classifier
     - Motivation
     - Soft margin classifier as an optimisation problem
     - Parameter interpretation
     - Application in R
* Parameter tuning and model evaluation using cross-validation 
     - K-fold cross validation
     - Training/Test division
     - Application in R
* Support vector machines
     - Motivation
     - Kernels
     - Application in R
     - Support vector machines with more than two classes    
* Practical application in R: Predicting survey responses

## Necessary materials
     
The tutorial package contains the powerpoint slides that I used to teach the course, an R script that contains the R code used during the lecture and the answers to the questions that students had to do during the lecture, as well as an R script that provides the solutions to the questions of the final task. The necessary data for doing the final task is also included. The following table summarises the contents of the course package:

<table border="0" cellspacing="1" cellpadding="0">
    <tbody>
        <tr>
            <td width="140">
                <p align="left">
                    File
                </p>
            </td>
            <td width="229">
                <p align="left">
                    Description
                </p>
            </td>
        </tr>
        <tr>
            <td width="140" valign="top">
                <p>
                    Lecture_SVM.pptx
                </p>
            </td>
            <td width="229" valign="top">
                <p> 
                    Lecture slides with notes.
                </p>
            </td>
        </tr>
        <tr>
            <td width="140" valign="top">
                <p>
                    RcodeForLecture.R
                </p>
            </td>
            <td width="229" valign="top">
                <p>
                    R script containg the code that was demonstrated during the lecture. It also provides solutions to the lecture questions/tasks.  
                </p>
            </td>
        </tr>
        <tr>
            <td width="140" valign="top">
                <p>
                    PracticalApplication.R
                </p>
            </td>
            <td width="229" valign="top">
                <p>
                    Solution to the practical application that students had to solve after the lecture.
                </p>
            </td>
        </tr>
    </tbody>
</table>
<br>

**Notes:** 

\- The R scripts that were provided to the participants of the course did not contain the solutions to the tasks that participants had to complete. 

\- The powerpoint template and a few figures that I used in the lecture were taken (often with modifications) from Lecture 14 of the "introduction to information retrieval" course by C. Manning and P. Nayak.
