
# MovieGo

MovieGo is the codename of this project :D
This project is built in clean architecture with SOLID Principle. 

## Architecture
Everyone is comparing architectures, but that's not what people should do. As far as I can see, an MVP is good for a small app with a few screens. But let's take a look the the assignment number 2 **Maintainability**


Let's assume that this project will be real big project. Then yes! the real problem starts if you app grows and more and more components get into the game. So I choose Viper as a design pattern for this project to achieve this requirement

## Modules
Let's take a look the picture abocve (again and again). I'm assuming that this project is initial project for a growing company. So I have to start this project with **Non Monolithic** workplace to cut off technical debt in the future as well. This project is seperated by 3 projects namely, `Api`, `Storage`, and `MovieGo`:
 **1. Api** 
 All about api request is placed here

 **2. Storage** 
 All about device database management
 
 **3. MovieGo** 
 The main module a.k.a our apps, or we may say **The Launcher** !!
 
