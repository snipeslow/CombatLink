Shader "CombatLink/CombatLinkUnlitExample"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
		_HealthColor("HealthColor",Color) = (1,1,1,1)
		_HealthMask("HealthMask", 2D) = "black" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" "Queue" = "Geometry"}
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"
		    #include "Assets/CombatLink/Shaders/CombatLink.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
            };

			sampler2D _MainTex;
            float4 _MainTex_ST;
			fixed4 _HealthColor;
			sampler2D _HealthMask;
            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture
				fixed4 col = tex2D(_MainTex, i.uv);
			if (CombatLinkExists(_CombatLinkTexture))
			{
				fixed4 HealthData = GetCombatLinkData(_CombatLinkTexture, CLPASS_LOCALPLAYER_HEALTHDATA, _CombatLinkTexture_TexelSize.xy);

				fixed4 healthmask = tex2D(_HealthMask, i.uv);
				if (healthmask.r > HealthData.r)
				{
					col *= _HealthColor;
				}
			}
                // apply fog
                UNITY_APPLY_FOG(i.fogCoord, col);
                return col;
            }
            ENDCG
        }
    }
}
