/*
Inspired by AudioLink's method, go see their awesome work! Not affiliated with the AudioLink team in any way.

TODO??: Add channels for other players. Possibly maybe a co-op style game hud could ultilize? Thanks PhaseDragon for the suggestion!
WARNING: If you wish to use this stuff for more than what I made, I reccomend creating a seperate system to avoid conflicts in case I update with more stuff.
*/
//#define CLPASS_SIZE int2(10,10)
/*
TODO??: Check if it works like intended
*/
#define CLPASS_SYSTEMCHECK int2(0,0)
/*
RED: Health
GREEN: Armor
BLUE: Shield
ALPHA: Oxygen
*/
#define CLPASS_LOCALPLAYER_HEALTHDATA1 int2(0,1)

/*
RED: RESERVED
GREEN: RESERVED
BLUE: RESERVED
ALPHA: RESERVED
*/
#define CLPASS_LOCALPLAYER_HEALTHDATA2 int2(0,2)

/*
RED: Burning
GREEN: Poison
BLUE: Stun
ALPHA: BLEEDING
*/
#define CLPASS_LOCALPLAYER_STATUSEFFECTS1 int2(0,3)

/*
RED: RESERVED
GREEN: RESERVED
BLUE: RESERVED
ALPHA: RESERVED
*/
#define CLPASS_LOCALPLAYER_STATUSEFFECTS2 int2(0,4)

/*
RED: Tempurature for visual effects
GREEN: Air pressure
BLUE: RESERVED
ALPHA: RESERVED
*/
#define CLPASS_LOCALPLAYER_ENVIROMENTDATA1 int2(0,5)

/*
RED: RESERVED
GREEN: RESERVED
BLUE: RESERVED
ALPHA: RESERVED
*/
#define CLPASS_LOCALPLAYER_ENVIROMENTDATA2 int2(0,6)

sampler2D _CombatLinkTexture;
uniform float4 _CombatLinkTexture_TexelSize;


//Use this to get CombatLink data, but check if it is enabled first!
float4 GetCombatLinkData(float2 position)
{
	return tex2Dlod(_CombatLinkTexture, float4((position * float2(0.1, 0.1))+ float2(0.05, 0.05),0,0));
}

//Use this to check if CombatLink is enabled
bool CombatLinkExists() {
	return GetCombatLinkData(uint2(CLPASS_SYSTEMCHECK)).r > 0.5;
}