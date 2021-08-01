Shader "CombatLink/Internal/CombatLink"
{
	Properties
	{
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
			#pragma vertex CustomRenderTextureVertexShader
			#pragma fragment frag
			#pragma target 3.0
			float4 frag(v2f_customrendertexture IN) : COLOR
			{
				return float4(1, 1, 1, 1);
			}
			/*
			#include "Assets/CombatLink/Shaders/CombatLink.cginc"
			#pragma vertex CustomRenderTextureVertexShader
			#pragma fragment frag
			#pragma target 3.0
			uniform float _Active;

			uniform float _Health;
			uniform float _Armor;
			uniform float _Shield;
			uniform float _Oxygen;

			uniform float _Burning;
			uniform float _Poison;
			uniform float _Stun;
			uniform float _Bleeding;

			uniform float _Temperature;
			uniform float _AirPressure;
			float4 frag(v2f_customrendertexture IN) : COLOR
			{
				float4 Result = float4(0,0,0,0);
				if (DataCord(uint2(0,0), IN.globalTexcoord.xy))
				{
					Result = float4(1, 1, 1, 1);
				}
				if (DataCord(CLPASS_LOCALPLAYER_HEALTHDATA1, IN.globalTexcoord.xy))
				{
					Result = float4(_Health, _Armor, _Shield, _Oxygen);
				}
				if (DataCord(CLPASS_LOCALPLAYER_STATUSEFFECTS1, IN.globalTexcoord.xy))
				{
					Result = float4(_Burning, _Poison, _Stun, _Bleeding);
				}
				if (DataCord(CLPASS_LOCALPLAYER_ENVIROMENTDATA1, IN.globalTexcoord.xy))
				{
					Result = float4(_Temperature, _AirPressure, 1, 1);
				}
				return Result;
			}
			*/
		ENDCG
		}
		Pass
		{

			Name "CombatLinkPass_Active"
			CGPROGRAM
			#include "UnityCustomRenderTexture.cginc"
			#pragma vertex CustomRenderTextureVertexShader
			#pragma fragment frag
			#pragma target 3.0

			float4 frag(v2f_customrendertexture IN) : COLOR
			{
				return float4(1, 1, 1, 1);
			}

			ENDCG
		}
		Pass
		{

			Name "CombatLinkPass_LOCALPLAYER_HealthData1"
			CGPROGRAM
			#include "UnityCustomRenderTexture.cginc"
			#include "Assets/CombatLink/Shaders/CombatLink.cginc"
			#pragma vertex CustomRenderTextureVertexShader
			#pragma fragment frag
			#pragma target 3.0

			uniform float _Health;
			uniform float _Armor;
			uniform float _Shield;
			uniform float _Oxygen;
			float4 frag(v2f_customrendertexture IN) : COLOR
			{ 
				return float4(_Health, _Armor, _Shield, _Oxygen);;
			}

			ENDCG
		}
		Pass
		{

			Name "CombatLinkPass_LOCALPLAYER_STATUSEFFECTS1"
			CGPROGRAM
			#include "UnityCustomRenderTexture.cginc"
			#include "Assets/CombatLink/Shaders/CombatLink.cginc"
			#pragma vertex CustomRenderTextureVertexShader
			#pragma fragment frag
			#pragma target 3.0

			uniform float _Burning;
			uniform float _Poison;
			uniform float _Stun;
			uniform float _Bleeding;

			float4 frag(v2f_customrendertexture IN) : COLOR
			{
				return float4(_Burning, _Poison, _Stun, _Bleeding);
			}

			ENDCG
		}
		Pass
		{

			Name "CombatLinkPass_LOCALPLAYER_ENVIROMENTDATA1"
			CGPROGRAM
			#include "UnityCustomRenderTexture.cginc"
			#include "Assets/CombatLink/Shaders/CombatLink.cginc"
			#pragma vertex CustomRenderTextureVertexShader
			#pragma fragment frag
			#pragma target 3.0

			uniform float _Temperature;
			uniform float _AirPressure;

			float4 frag(v2f_customrendertexture IN) : COLOR
			{
				return float4(_Temperature, _AirPressure, 0, 0);
			}

			ENDCG
		}
	}
}
