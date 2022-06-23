#include "ReShadeUI.fxh"
#include "ReShade.fxh"




float4 blockScreen(float4 vpos : SV_Position, float2 p : TexCoord) : SV_Target
{
	float2 p1 = float2(.45, .45);
	float2 p2 = float2(.55, .55);
	float4 p9 = tex2D(ReShade::BackBuffer, p);
	//float4 p = tex2D(ReShade::BackBuffer, texcoord);
	if (((p1.x <= vpos.x / 1920)) && (vpos.x / 1920 <= p2.x) && (p1.y <= vpos.y / 1080) && (vpos.y / 1080 <= p2.y)  )  {
		return p9;
	} 
	else {
		p9.r = 0;
		p9.b = 0;
		p9.g = 0;
		return p9;
	}
}

technique ScreenBlock <  >
{
	pass p
	{
        VertexShader = PostProcessVS;
		PixelShader = blockScreen;
	}
}