#include "ReShadeUI.fxh"
#include "ReShade.fxh"

uniform float timer < source = "timer"; >;
uniform float PI = 3.141592653;


float4 fadeOpacity(float4 vpos : SV_Position, float2 texcoord : TexCoord) : SV_Target
{
	float4 color = tex2D(ReShade::BackBuffer, texcoord).rgba;
	float alpha = tan(timer * 2 * PI / 8000);
	if (alpha < 0){
		//color.x = 1.0 - alpha;
	
		//color.y = 1.0 - alpha;
		
		//color.z = 1.0 - alpha;
		color = (color.rgba * (1.0-alpha));
		return color;
	}
	return color;
	
}

technique FlashBang < timeout=4000; >
{
	pass p1
	{
        VertexShader = PostProcessVS;
		PixelShader = fadeOpacity;
	}
}