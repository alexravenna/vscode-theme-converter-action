# VS Code Theme Converter action

This action prints "Hello World" to the log or "Hello" + the name of a person to greet. To learn how this action was built, see "[Creating a Docker container action](https://docs.github.com/en/actions/creating-actions/creating-a-docker-container-action)" in the GitHub Docs.

## Inputs

### `who-to-greet`

**Required** The name of the person to greet. Default `"World"`.

## Outputs

### `time`

The time we greeted you.

## Example usage

```yaml
uses: actions/hello-world-docker-action@main
with:
  who-to-greet: 'Mona the Octocat'
```

## How it works

The steps that this action uses for converting a VS Code theme to a Visual Studio VSIX:

1. Clone ThemeConverter repo <https://github.com/microsoft/theme-converter-for-vs>
2. Build project `dotnet build ThemeConverter.csproj`
3. Run `bin\Debug\net6.0\ThemeConverter.exe` with extension .json file → creates a pkgdef
4. In VS 2022 create new Empty VSIX Project
5. Add converted .pkgdef file(s)
6. Edit Properties of pkgdef file:

    ```
    6. Set `Copy to Output Directory` to `Copy always`.
    7. Set `Include in VSIX` to `true`.
    8. Open the `source.extension.vsixmanifest` file, then select Assets, select New.
    9. Set `Type` to `Microsoft.VisualStudio.VsPackage`, and `Source` to `File on filesystem`.
    10. Select Browse and select the .pkgdef you added. Select OK.
    11. Edit other fields in the vsixmanifest as desired (author, version, company, etc).
    ```

7. Build solution → VSIX is in output folder
