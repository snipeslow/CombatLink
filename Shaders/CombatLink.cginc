/*
Inspired by AudioLink's method, go see their awesome work! Not affiliated with the AudioLink team in any way.

TODO??: Add channels for other players. Possibly maybe a co-op style game hud could ultilize? Thanks PhaseDragon for the suggestion!
WARNING: If you wish to use this stuff for more than what I made, I reccomend creating a seperate system to avoid conflicts in case I update with more stuff.
*/
#define CLPASS_SIZE int2(64,64)
/*
TODO??: Check if it works like intended
*/
//#define CLPASS_SYSTEMCHECK int2(0,0)
/*
RED: Health
GREEN: Armor
BLUE: Shield
ALPHA: Oxygen
*/
#define CLPASS_LOCALPLAYER_HEALTHDATA1 int2(0,1)

/*
RED: Burning
GREEN: Poison
BLUE: Stun
ALPHA: RESERVED
*/
#define CLPASS_LOCALPLAYER_STATUSEFFECTS1 int2(0,2)

/*
RED: BLEEDING
GREEN: RESERVED
BLUE: RESERVED
ALPHA: RESERVED
*/
#define CLPASS_LOCALPLAYER_STATUSEFFECTS2 int2(0,3)

/*
RED: RESERVED
GREEN: RESERVED
BLUE: RESERVED
ALPHA: RESERVED
*/
#define CLPASS_LOCALPLAYER_STATUSEFFECTS3 int2(0,4)

/*
RED: RESERVED
GREEN: RESERVED
BLUE: RESERVED
ALPHA: RESERVED
*/
#define CLPASS_LOCALPLAYER_STATUSEFFECTS4 int2(0,5)

/*
RED: Tempurature for visual effects
GREEN: Air pressure
BLUE: RESERVED
ALPHA: RESERVED
*/
#define CLPASS_LOCALPLAYER_ENVIROMENTDATA1 int2(0,6)

/*
RED: RESERVED
GREEN: RESERVED
BLUE: RESERVED
ALPHA: RESERVED
*/
#define CLPASS_LOCALPLAYER_ENVIROMENTDATA2 int2(0,7)

/*
RED: RESERVED
GREEN: RESERVED
BLUE: RESERVED
ALPHA: RESERVED
*/
#define CLPASS_LOCALPLAYER_ENVIROMENTDATA3 int2(0,8)

/*
RED: RESERVED
GREEN: RESERVED
BLUE: RESERVED
ALPHA: RESERVED
*/
#define CLPASS_LOCALPLAYER_ENVIROMENTDATA4 int2(0,9)

sampler2D _CombatLinkTexture;
uniform float4 _CombatLinkTexture_TexelSize;

bool DataCord(int2 target, float2 cords)
{
	return (target.x == floor(cords.x * _CombatLinkTexture_TexelSize.z)) && (target.y == floor(cords.y * _CombatLinkTexture_TexelSize.w));
}

float4 GetCombatLinkData(uint position)
{
	return tex2Dlod(_CombatLinkTexture, float4(position*_CombatLinkTexture_TexelSize.zw, 0, 0));
}

bool CombatLinkExists() {//I NEED TO GET THIS TO WORK AT SOME POINT, also is this overkill?
	return GetCombatLinkData(uint2(0,0)).r >= 0.5;
}