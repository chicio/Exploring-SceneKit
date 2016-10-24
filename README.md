# Exploring-SceneKit

[![Build Status](https://travis-ci.org/chicio/Exploring-SceneKit.svg?branch=master)](https://travis-ci.org/chicio/Exploring-SceneKit)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/chicio/Exploring-SceneKit/master/LICENSE.md)
![Supported platform] (https://img.shields.io/badge/platforms-iOS-orange.svg)

A simple demo created to get confident with SceneKit and explore the capability of the framework. <a href="https://developer.apple.com/reference/scenekit">What is SceneKit</a>? 

> SceneKit combines a high-performance rendering engine with a descriptive API for import, manipulation, and rendering of 3D assets. Unlike lower-level APIs such as Metal and OpenGL that require you to implement in precise detail the rendering algorithms that display a scene, SceneKit only requires descriptions of your scene’s contents and the actions or animations you want it to perform.


###Description

In the first scene I explore the primitive contained in the framework. I created a simple scene using SCNode and SCNFloor. Some gesture attached to the SCNView let the user play with the objects inside the scene.

![Scene 1](https://raw.githubusercontent.com/chicio/Exploring-SceneKit/master/Screenshots/scene1.png)

In the second scene I try to import a model in collada format created with Blender. I added some animation using CAAnimation to move the camera in the scene.

![Scene 2](https://raw.githubusercontent.com/chicio/Exploring-SceneKit/master/Screenshots/scene2.png)
