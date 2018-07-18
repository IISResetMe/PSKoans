<#
    PSProviders

    Providers are PowerShell's generial-purpose solution for accessing resources. The default set of
    providers that come with PowerShell on all platforms are listed below:

    Name                 Capabilities                            Drives
    ----                 ------------                            ------
    Alias                ShouldProcess                           {Alias}
    Environment          ShouldProcess                           {Env}
    FileSystem           Filter, ShouldProcess, Credentials      {/}
    Function             ShouldProcess                           {Function}
    Variable             ShouldProcess                           {Variable}

    Several are for accessing internal PowerShell resources (aliases, functions, variables), but the
    rest typically interact with the surrounding environment like the filesystem or OS environment.

    On Windows, PowerShell also comes with a Registry provider, for interacting with the Windows
    registry.
#>
Describe 'Alias:' {
    <#
        Aliases are PowerShell command shortcuts. By querying the Alias: provider, you can get a
        list of all command shortcuts in the current session. The available aliases may increase
        when a new module is imported.
    #>
    It 'can be queried with cmdlets' {
        $Aliases = Get-ChildItem 'Alias:'

        $Aliases.Count | Should -Be __
    }

    It 'maps aliases to the full command' {
        $Alias = '__'
        $AliasObject = Get-Item "Alias:\$Alias" -ErrorAction SilentlyContinue

        $AliasObject.Definition | Should -Be 'Set-Location'
    }

    It 'can be accessed with Get-Alias' {
        $AliasObjects = Get-ChildItem 'Alias:'
        $AliasObjects2 = Get-Alias

        $AliasObjects2.Count | Should -Be __
        $AliasObjects | Should -Be $AliasObjects2
    }
}

Describe 'Environment' {

}

Describe 'FileSystem' {

}

Describe 'Function' {

}

Describe 'Variable' {

}

Describe 'Registry' -Tag 'Windows' {

}


