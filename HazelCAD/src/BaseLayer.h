#pragma once
#include "Hazel.h"
#include "Hazel/Renderer/EditorCamera.h"

class BaseLayer : public Hazel::Layer
{
public:
	BaseLayer();
	virtual ~BaseLayer();

	virtual void OnAttach() override;
	virtual void OnDetach() override;
	virtual void OnEvent(Hazel::Event& event) override;
	virtual void OnUpdate(Hazel::Timestep ts) override;
	virtual void OnImGuiRender() override;
private:
};
