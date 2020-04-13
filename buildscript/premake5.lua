-- premake5.lua

projectDir = ".."
include("conanbuildinfo.premake.lua")

workspace "Template"
    conan_basic_setup()
    architecture "x64"
    configurations { "Debug", "Release" }
    location (projectDir .. "build")
    toolset "clang"

project "TemplateApp"
    location (projectDir .. "build")
    kind "ConsoleApp"
    language "C++"
    targetdir (projectDir .. "bin/%{cfg.buildcfg}")
    cppdialect "C++17"

    linkoptions { conan_exelinkflags }

    files 
    {
        (projectDir .. "/**.hpp"), 
        (projectDir .. "/**.cpp")
    }
    
    includedirs 
    {
        (projectDir .. "src")
    }

    filter "configurations:Debug"
        defines {"DEBUG"}
        symbols "On"

    filter "configurations:Release"
        defines {"NDEBUG"}
        optimize "On"