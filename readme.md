### NOT DONE, DO NOT USE. FEEL FREE TO CONTACT TO ASSIST ME TO GET THIS WORKING.
# About
CombatLink is a VRChat UDON prefab built around on the idea of syncing data such as health, status effects, and other details to shader based heads up displays on avatars. It is built using Custom Render Textures and is inspired by https://github.com/llealloo/vrc-udon-audio-link/tree/master/AudioLink 's method of transmitting the data to avatars.

Please read "Assets/CombatLink/Shaders/CombatLink.cginc" for what data you can grab from the texture
## Core Features
- Allows feeding of local player status into avatars for per-avatar HUDs.
- Provides a standard in which world authors can use for providing avatar authors data for combat related endevours.
- In addition, there is support for feeding enviromental data into avatars.

## Shader Development Info
TODO: Write documentation so people can make their own HUDs.

### Warning
 If you wish to use this stuff for more than what I made, I reccomend creating a seperate system with different asset paths to avoid conflicts in case I update with more stuff.

## Prefabs that support CombatLink
- None yet

## Disclaimer
I am not affiliated with the AudioLink Creator/Team.

## Credits
- AudioLink Creator/Team for inspiration
- PhaseDragon and jetdog8808 for ideas
- GoFluffYaself for birthing the SDK2 Avatar PVP community and therefore indirectly leading to the creation of this
- Snipeslow for eventually figuring out that an int type is not an int2 type at some point of writing the code
- Probally others! Will be updating this list once I remember hopefully