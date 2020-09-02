# Overview

Today we have Instagram, Facebook, Tumblr, Snapchat as the most used social networking sites and apps. Most of these are image based social networks. Due to the advent of such sites the raw data available for image processing has increased substantially. Now we have millions of images that are readily available. 

### Problem Statement

A hard problem that has received considerable attention is the batch alignment problem of images. Here you take multiple batches of images and align them to a fixed canonical template. This problem becomes harder to solve when we consider the difference in illumination, partial occlusion (presence of sunglasses, hats etc.) between the images of the same object. 

### Implementation & Verification

We implemented Robust Alignment by Sparse and Low-Rank Decomposition and simplified this challenging optimization problem into a sequence of convex programs with guaranteed fast convergence by applying the most efficient sequence of image-based transformations to breakdown the image matrix as a cumulation of a sparse matrix of errors plus a low-rank matrix of retrieved alignments. 
We will verify the efficacy of the proposed algorithm with extensive experiments with datasets

### Resources

- [RASL testing with controlled dataset](https://www.youtube.com/watch?v=sIVQzAH0jBg&t).
