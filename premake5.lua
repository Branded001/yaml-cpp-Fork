project "YAML"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}") 

	files 
	{
		"src/**.h",
		"src/**.cpp",
		"include/**.h"
	}

	includedirs
	{
		"include"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++20"
		staticruntime "On"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++20"
		staticruntime "On"

    filter "configurations:Debug"
		defines "_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "NDEBUG"
		runtime "Release"
		optimize "On"

	filter "configurations:Dist"
		defines "NDEBUG"
		runtime "Release"
		symbols "On"
