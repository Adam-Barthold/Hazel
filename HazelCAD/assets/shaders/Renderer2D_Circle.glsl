// Renderer2D_Circle Shader

#type vertex
#version 450 core

layout(location = 0) in vec3 a_Position;
layout(location = 1) in vec4 a_Color;
layout(location = 2) in vec2 a_TexCoord;
layout(location = 3) in float a_TexIndex;
layout(location = 4) in float a_TilingFactor;
layout(location = 5) in int a_EntityID;

layout(std140, binding = 0) uniform Camera
{
	mat4 u_ViewProjection;
};

struct VertexOutput
{
	vec3 LocalPosition;
	vec4 Color;
	float Thickness;
};

layout (location = 0) out VertexOutput Output;
layout (location = 4) out flat int v_EntityID;

void main()
{
	Output.LocalPosition = a_LocalPosition;
	Output.Color = a_Color;
	Output.Thickness = a_Thickness;
	v_EntityID = a_EntityID;

	gl_Position = u_ViewProjection * vec4(a_WorldPosition, 1.0);
}



#type fragment
#version 450 core

layout(location = 0) out vec4 o_color;
layout(location = 1) out int o_EntityID;

struct VertexOutput
{
	vec3 LocalPosition;
	vec4 Color;
	float Thickness;
};

layout (location = 0) in VertexOutput Input;
layout (location = 3) in flat int v_EntityID;

void main()
{
	//calculate distance and fill circle with white
	float distance = 1.0 - length(Input.LocalPosition);
	float circle = vec3(smoothstep(0.0, 0.005, distance));
	circle *= smoothstep(Input.Thickness + 0.005, Input.Thickness, distance);
	
	if (circle == 0.0)
		discard;

	//set output color
	o_Color = Input.Color;
	o_Color.a *= circle;
	o_Color.rgb *= color;

	o_EntityID = v_EntityID;
}
