# Exploring-SceneKit

[![Build Status](https://travis-ci.org/chicio/Exploring-SceneKit.svg?branch=master)](https://travis-ci.org/chicio/Exploring-SceneKit)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/chicio/Exploring-SceneKit/master/LICENSE.md)
[![Supported platform](https://img.shields.io/badge/platforms-iOS-orange.svg)](https://img.shields.io/badge/platforms-iOS-orange.svg)

An app created to explore the features of SceneKit, an iOS framework. [What is SceneKit?](https://developer.apple.com/reference/scenekit "What is Scenekit?")
> SceneKit combines a high-performance rendering engine with a descriptive API for import, manipulation, and rendering of 3D assets. Unlike lower-level APIs such as Metal and OpenGL that require you to implement in precise detail the rendering algorithms that display a scene, SceneKit only requires descriptions of your scene’s contents and the actions or animations you want it to perform.


### Description

The app contains three example. In each one of them multiple features of SceneKit has been explored. The main features tested in this app are:
* loading of assets using art assets and Model I/O
* loading of Collada files from SCNAssets folder
* rendering capabilities (lighting models and techniques)
* animation and interaction supported

#### Scene 1
The first scene contains some meshes generated using the ones already integrated in SceneKit. This one is able to render sphere, plane, box, pyramid, cone, cylinder, capsule, tube and torus. In this scene we use SCNSphere and SCNBox customized with some physic property to simulated different collision behavious and interaction. 

![Scene 1](https://raw.githubusercontent.com/chicio/Exploring-SceneKit/master/Screenshots/blinn-phong-scene.jpg)

#### Scene 2
In the second scene I tried to import a model, lights and camera from a collada file created with Blender. I added some animation using CAAnimation to move the camera in the scene. All textures are automatically loaded within the model (as consequence of the fact that also its material are automatically loaded).

![Scene 2](https://raw.githubusercontent.com/chicio/Exploring-SceneKit/master/Screenshots/collada-scene.jpg)

#### Scene 3
The third scene contains an example of the Physically based rendering engine contained in SceneKit. In this scene the following PBR features of in SceneKit have been used:

* physically based light with customizable intensity and temperature
* physically based material using ad-hoc textures and values
* HDR post processing

The mesh used for the scene are taken from the [stanford scan repository](http://graphics.stanford.edu/data/3Dscanrep/ "stanford scan repository"). You can find more information about this scene in [my post blog "SceneKit and physically based rendering"](http://www.fabrizioduroni.it/2018/01/03/scene-kit-physically-based-rendering/ "SceneKit and physically based rendering" )

![Scene 3](https://raw.githubusercontent.com/chicio/Exploring-SceneKit/master/Screenshots/physically-based-rendering-scene.jpg)

![Scene 3 right](https://raw.githubusercontent.com/chicio/Exploring-SceneKit/master/Screenshots/physically-based-rendering-scene-right.jpg)

![Scene 3 back](https://raw.githubusercontent.com/chicio/Exploring-SceneKit/master/Screenshots/physically-based-rendering-scene-back.jpg)
