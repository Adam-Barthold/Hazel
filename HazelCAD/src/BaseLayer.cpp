#include "BaseLayer.h"


BaseLayer::BaseLayer()
{
}

BaseLayer::~BaseLayer()
{
}

void BaseLayer::OnAttach()
{
	// Init here
}

void BaseLayer::OnDetach()
{
	// Shutdown here
}

void BaseLayer::OnEvent(Hazel::Event& event)
{
	// Events here
}

void BaseLayer::OnUpdate(Hazel::Timestep ts)
{
	// Render here
	
}

void BaseLayer::OnImGuiRender()
{
	// ImGui here
}
