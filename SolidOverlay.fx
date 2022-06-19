#include "ReShadeUI.fxh"
#include "ReShade.fxh"

uniform float R = 1;
uniform float G = 1;
uniform float B = 1;

float4 whiteBackground(float4 vpos : SV_Position, float2 texcoord : TexCoord) : SV_Target
{
	float4 color = tex2D(ReShade::BackBuffer, texcoord).rgba;
	color.r = R;
	color.g = G;
	color.b = B;
	return color;
}

technique SolidOverlay < timeout=1000; >
{
	pass p0
	{
        VertexShader = PostProcessVS;
		PixelShader = whiteBackground;
	}
}