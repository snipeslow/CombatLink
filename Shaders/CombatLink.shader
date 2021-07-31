﻿Shader "CombatLink/Internal/CombatLink"
{
	Properties
	{
		_Active("Active",Range(0.0, 1.0)) = 0

		_Health("Health",Range(0.0, 1.0)) = 1
		_Armor("Armor",Range(0.0, 1.0)) = 1
		_Shield("Shield",Range(0.0, 1.0)) = 1
		_Oxygen("Oxygen",Range(0.0, 1.0)) = 1

		_Burning("Burning",Range(0.0, 1.0)) = 1
		_Poison("Poison",Range(0.0, 1.0)) = 1
		_Stun("Stun",Range(0.0, 1.0)) = 1
		_Bleeding("Bleeding",Range(0.0, 1.0)) = 1

		_Temperature("Temperature",Range(0.0, 1.0)) = 0.5
		_AirPressure("AirPressure",Range(0.0, 1.0)) = 0.5
	}

		SubShader
	{
	   Lighting Off
	   Blend One Zero

	   Pass
	   {

		   Name "CombatLinkPass"
		   CGPROGRAM
		   #include "UnityCustomRenderTexture.cginc"
		   #include "Assets/CombatLink/Shaders/CombatLink.cginc"
		   #pragma vertex CustomRenderTextureVertexShader
		   #pragma fragment frag
		   #pragma target 3.0
			float _Active;

			float _Health;
			float _Armor;
			float _Shield;
			float _Oxygen;

			float _Burning;
			float _Poison;
			float _Stun;
			float _Bleeding;

			float _Temperature;
			float _AirPressure;
			float4 frag(v2f_customrendertexture IN) : COLOR
			{ 
				float4 Result = float4(0,0,0,0);
				if (_Active > 0.5 )
				{
					if (DataCord(CLPASS_SYSTEMCHECK, IN.globalTexcoord.xy))
					{
						Result = float4(1.0, 0.0, 0.0, 0.0);
					}
					if (DataCord(CLPASS_LOCALPLAYER_HEALTHDATA, IN.globalTexcoord.xy))
					{
						Result = float4(_Health, _Armor, _Shield, 1);
					}
					if (DataCord(CLPASS_LOCALPLAYER_STATUSEFFECTS1, IN.globalTexcoord.xy))
					{
						Result = float4(_Burning, _Poison, _Stun, 1);
					}
					if (DataCord(CLPASS_LOCALPLAYER_ENVIROMENTDATA1, IN.globalTexcoord.xy))
					{
						Result = float4(_Temperature, _AirPressure, 1, 1);
					}
				}
				return Result;
			}

			ENDCG
			}
	}
}
