# Bomb-Likes

## SYNOPSIS  
This is probably the most nonesense thing you can do with Powershell. LIke a friend's every single post in facebook.

## HOW-TO
Login to Facebook using Internet explorer and run the command. This doesn't do authentication so you need to login first. 
Things run at the background ($ie.Visible = $false) so you won't see things in action. Set it to True if you'd like IE to pop up doing the automation. 

## EXAMPLE
```
Invoke-BombLikes -ProfileURL https://www.facebook.com/Profil -Count 100 -Interval 5
```