#!/bin/sh

git clone https://github.com/microsoft/theme-converter-for-vs

cp theme.json theme-converter-for-vs/ThemeConverter/ThemeConverter

cd theme-converter-for-vs/ThemeConverter/ThemeConverter
dotnet dotnet build ThemeConverter.csproj

cd bin/Debug/net6.0

# Install template for VSIX project and
dotnet new install Microsoft.VisualStudio.Sdk.Templates

# Create new empty VSIX project
dotnet new vsix