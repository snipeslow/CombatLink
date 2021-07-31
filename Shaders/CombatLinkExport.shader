Shader "CombatLink/Internal/CombatLinkExport"
{
    Properties
    {
    }
    SubShader
    {
		// Copied and then modified from AudioLink, I hope you don't guys don't mind!
		Tags { "RenderType" = "Opaque" }
		LOD 100
		GrabPass {"_CombatLinkTexture"}
		Pass {
		CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			float4 vert(float4 v: POSITION) : SV_Position { return 1; }
			float4 frag(float4 f: SV_Position) : SV_Target { return 1; }
		ENDCG
		}
    }
}
