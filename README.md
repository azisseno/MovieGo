

# MovieGo

MovieGo is the codename of this project :D
This project is built in clean architecture with SOLID Principle. 

## Architecture
Everyone is comparing architectures, but that's not what people should do. As far as I can see, an MVP is good for a small app with a few screens. But let's take a look to the assignment number two **Maintainability**

![enter image description here](https://github.com/azisseno/MovieGo/blob/master/Resources/Maintainability.png)

Let's assume that this project will be real big project. Then yes! the real problem starts if your app grows and more and more components get into the game. So I choose Viper as a design pattern for this project to achieve this requirement.

## Proejcts
Let's take a look to the picture above (again). I'm assuming that this project is initial project for a growing company. So I have to start this project with **Non Monolithic** workplace to cut off technical debt in the future as well. This project is seperated by 3 projects namely, `Api`, `Storage`, and `MovieGo`:

 **1. Api** - All about api requests are placed here

 **2. Storage** - All about device database management
 
 **3. MovieGo** - The main module a.k.a our apps, or we may say **The Launcher** !!
 

## Module Generator
As we all know, Viper is a design pattern that implements ‘separation of concern’ paradigm. Mostly like MVP or MVC it follows a modular approach. One feature, one module. For each module VIPER has five (sometimes four) different classes with distinct roles. They are `View`, `Presenter`, `Interactor`, `Router`, and `Entity`.

Never start to create a VIPER project by hand, you should always use a code generator, because you'll need lots of boilerplate code for each module. There are many generator solutions, but I made my own little Swift script, which completely simple. But i made it with a reason.

> I build a generator base on my needs *(read: my application company needs)

Here is **ModuleGenerator.swift** on the project. Just fire it up with this command
```
./ModuleGenerator.swift <Directory/ModuleName> <BaseViewController you want to conform>
```
It'll generate a module template with the given name in the current directory.

## MovieGo Target Overview
Okay, let's take a look the foldering stuff. I seperate MovieGo into 4 main folders.

 1. **Application** - All about application level management (AppDelegate). Why ? it's only 1 class! Okay, let's take a look to all methods inside AppDelegate, this is super complex.. You may add remote notification handler, setup key, user activity handler, and a lot more complexity in the real world. So yaps. preparing for the complexity from a very beginning is not a crime :)
 2. **Core** - This folder is to accomodate helpers, managers, global constants, or we may say base type stuff!!
 3. **Modules** - The modules in the target (the apps itself)
 4. **Resources** - All about target resources without 3 classifications above :D

Why I made `BaseTableViewController` ? Yaps, it's a part of my sense of long term vision. Have you ever think that someday business requirement changes our app radically? So .... instead of doing massive refactoring with copy paste stuff, why don't we prepare a base controller to simplify our job? Of course! since it's only for an assignment, I only create 1 base controllers. But in the real life, we should *"Base-rized"* all of controllers

