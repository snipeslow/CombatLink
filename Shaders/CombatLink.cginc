/*
Inspired by AudioLink's method, go see their awesome work! Not affiliated with the AudioLink team in any way.

TODO??: Add channels for other players. Possibly maybe a co-op style game hud could ultilize? Thanks PhaseDragon for the suggestion!
WARNING: If you wish to use this stuff for more than what I made, I reccomend creating a seperate system to avoid conflicts in case I update with more stuff.
*/
#define CLPASS_SIZE int2(64,64)
/*
If Red is pure white, CombatLink does not exist in world and
*/
#define CLPASS_SYSTEMCHECK int2(0,0)
/*
RED: Health
GREEN: Armor
BLUE: Shield
ALPHA: DO NOT USE
*/
#define CLPASS_LOCALPLAYER_HEALTHDATA int2(0,1)

/*
RED: Burning
GREEN: Poison
BLUE: Stun
ALPHA: DO NOT USE
*/
#define CLPASS_LOCALPLAYER_STATUSEFFECTS1 int2(0,2)

/*
RED: BLEEDING
GREEN: RESERVED
BLUE: RESERVED
ALPHA: DO NOT USE
*/
#define CLPASS_LOCALPLAYER_STATUSEFFECTS2 int2(0,3)

/*
RED: RESERVED
GREEN: RESERVED
BLUE: RESERVED
ALPHA: DO NOT USE
*/
#define CLPASS_LOCALPLAYER_STATUSEFFECTS3 int2(0,4)

/*
RED: RESERVED
GREEN: RESERVED
BLUE: RESERVED
ALPHA: DO NOT USE
*/
#define CLPASS_LOCALPLAYER_STATUSEFFECTS4 int2(0,5)

/*
RED: Tempurature for visual effects
GREEN: Air pressure
BLUE: RESERVED
ALPHA: DO NOT USE
*/
#define CLPASS_LOCALPLAYER_ENVIROMENTDATA1 int2(0,6)

/*
RED: RESERVED
GREEN: RESERVED
BLUE: RESERVED
ALPHA: DO NOT USE
*/
#define CLPASS_LOCALPLAYER_ENVIROMENTDATA2 int2(0,7)

/*
RED: RESERVED
GREEN: RESERVED
BLUE: RESERVED
ALPHA: DO NOT USE
*/
#define CLPASS_LOCALPLAYER_ENVIROMENTDATA3 int2(0,8)

/*
RED: RESERVED
GREEN: RESERVED
BLUE: RESERVED
ALPHA: DO NOT USE
*/
#define CLPASS_LOCALPLAYER_ENVIROMENTDATA4 int2(0,8)

sampler2D _CombatLinkTexture;
uniform float4 _CombatLinkTexture_TexelSize;

//Please feed a float2(_CustomRenderTextureWidth, _CustomRenderTextureHeight) as the last parameter. Message me if that is not needed or something
bool DataCord(int2 target, float2 cords)
{
	return (target.x == floor(cords.x * CLPASS_SIZE.x)) && (target.y == floor(cords.y * CLPASS_SIZE.y));
}

bool CombatLinkExists(sampler2D renderTexture) {
	return floor(tex2D(renderTexture, CLPASS_SYSTEMCHECK).r) > 0.5;
}

float4 GetCombatLinkData(sampler2D renderTexture, fixed2 position, fixed2 texeldata)
{
	return tex2D(renderTexture, (fixed2(position) + fixed2(0.5, 0.5))*texeldata);
}