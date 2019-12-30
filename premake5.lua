-- premake5.lua
workspace "LearningOpenGL"
    configurations { "Debug", "Release" }

outputdir = "%{cfg.buildcfg}-%{cfg.system}"

project "LearningOpenGL"
    kind "ConsoleApp"
    language "C++"
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files { 
        "%{prj.name}/src/**.h", 
        "%{prj.name}/src/**.cc"
    }

    configuration "macosx"
        links {
            "Cocoa.framework", 
            "IOKit.framework", 
            "CoreVideo.framework",
            "OpenGL.framework"
        }

    -- including GLFW headers
    includedirs { 
        "%{prj.name}/vender/GLFW/include",
        "%{prj.name}/vender/GLEW/include"
    }

    -- linking with GLFW
    libdirs {
        "%{prj.name}/vender/GLFW/lib-macos",
        "%{prj.name}/vender/GLEW/lib"
    }

    links {
        "glfw3",
        "GLEW"
    }

    defines {
        "GLEW_STATIC"
    }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"