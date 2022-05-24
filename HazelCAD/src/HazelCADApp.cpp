#include <Hazel.h>
#include <Hazel/Core/EntryPoint.h>

#include "BaseLayer.h"

namespace Hazel {

	class HazelCAD : public Application
	{
	public:
		HazelCAD(ApplicationCommandLineArgs args)
			: Application("HazelCAD", args)
		{
			PushLayer(new BaseLayer());
		}

		~HazelCAD()
		{
		}
	};

	Application* CreateApplication(ApplicationCommandLineArgs args)
	{
		return new HazelCAD(args);
	}

}
