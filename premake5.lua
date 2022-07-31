-----------------------
-- [ PROJECT CONFIG] --
-----------------------
project "HeliosEngine.GLFW"
	kind          "StaticLib"
	architecture  "x86_64"
	language      "C"
	cppdialect    "C++20"
	staticruntime "On"
	targetname     "GLFW3"
	
	targetdir ("%{wks.location}/bin/client/"   .. outputdir .. "/heliosengine/%{string.lower(prj.name)}")
	objdir    ("%{wks.location}/build/client/" .. outputdir .. "/heliosengine/%{string.lower(prj.name)}")
	
	includedirs {
		"include",
		"src"
	}
	
	files {
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/internal.h",
		"src/platform.h",
		"src/mappings.h",
		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/platform.c",
		"src/vulkan.c",
		"src/window.c",
		"src/egl_context.c",
		"src/osmesa_context.c",
		"src/null_platform.h",
		"src/null_joystick.h",
		"src/null_init.c",
		"src/null_monitor.c",
		"src/null_window.c",
		"src/null_joystick.c"
	}

--[[
	TODO: >>>>>> I CAN'T TEST THIS PART <<<<<<
	TODO: >>>>>> I CAN'T TEST THIS PART <<<<<<
	TODO: >>>>>> I CAN'T TEST THIS PART <<<<<<

	filter "system:linux"
		pic "On"
		systemversion "latest"
		staticruntime "On"

		files {
			-- !APPLE && !WIN32
			"posix_time.h",
			"src/posix_thread.h",
			"src/posix_module.c",
			"src/posix_time.c",
			"src/posix_thread.c".
			-- GLFW_BUILD_X11
			"x11_platform.h",
			"src/xkb_unicode.h",
			"src/x11_init.c",
			"src/x11_monitor.c",
			"src/x11_window.c",
			"src/xkb_unicode.c",
			"src/glx_context.c",
			-- "Linux"
			"src/linux_joystick.c",
			-- GLFW_BUILD_X11 OR GLFW_BUILD_WAYLAND
			"posix_poll.h",
			"src/posix_poll.c"
		}

		defines {
			"_GLFW_X11",
			"_DEFAULT_SOURCE"
		}

	TODO: >>>>>> I CAN'T TEST THIS PART <<<<<<
	TODO: >>>>>> I CAN'T TEST THIS PART <<<<<<
	TODO: >>>>>> I CAN'T TEST THIS PART <<<<<<
]]--

	filter "system:windows"
		systemversion "latest"
		staticruntime "On"

		files {
			-- WIN32
			"src/win32_time.h",
			"src/win32_thread.h",
			"src/win32_module.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			-- GLFW_BUILD_WIN32
			"src/win32_platform.h",
			"src/win32_joystick.h",
			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_monitor.c",
			"src/win32_window.c",
			"src/wgl_context.c"
		}

		defines {
			"_GLFW_WIN32",
			"UNICODE", "_UNICODE",
			"_CRT_SECURE_NO_WARNINGS"
		}

--[[
	TODO: >>>>>> I CAN'T TEST THIS PART <<<<<<
	TODO: >>>>>> I CAN'T TEST THIS PART <<<<<<
	TODO: >>>>>> I CAN'T TEST THIS PART <<<<<<

	filter "system:macosx"

		files {
			-- APPLE
			cocoa_time.h cocoa_time.c posix_thread.h posix_module.c posix_thread.c
			-- GLFW_BUILD_COCOA
			cocoa_platform.h cocoa_joystick.h cocoa_init.m cocoa_joystick.m cocoa_monitor.m cocoa_window.m nsgl_context.m
		}

		defines {
			_GLFW_COCOA
		}

	TODO: >>>>>> I CAN'T TEST THIS PART <<<<<<
	TODO: >>>>>> I CAN'T TEST THIS PART <<<<<<
	TODO: >>>>>> I CAN'T TEST THIS PART <<<<<<
]]--

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"
		
	filter "configurations:Release"
		runtime "Release"
		optimize "On"
