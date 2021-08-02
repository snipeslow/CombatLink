/*
Copyright 2021 llealloo, cnlohr, lox9973

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


"Sludge Bath" provided by Lamp DX under Creative Commons: BY-NC-ND 4.0
*/

// Copied and then modified from AudioLink, I hope you don't guys don't mind!
Shader "CombatLink/Internal/CombatLinkExport"
{
    Properties
    {
    }
    SubShader
    {
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
