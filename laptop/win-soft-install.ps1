# Ensure winget is available
if (-not (Get-Command "winget" -ErrorAction SilentlyContinue)) {
    Write-Host "winget is not installed. Please install it from the Microsoft Store or upgrade to the latest Windows version." -ForegroundColor Red
    exit 1
}

# List of apps to install (you can customize this list)
$appsToInstall = @(
    "Google.Chrome",
    "Microsoft.VisualStudioCode",
    "Notepad++",
    "GitHub.GitHubDesktop",
    "JGraph.Draw",
    "Hashicorp.Terraform",
    "Docker.DockerDesktop",
    "winget install syft",
    "Kubernetes.kubectl",
    "winget install --id=RedHat.OpenShift-Client -e",
    "Postman.Postman",
    "7zip.7zip",
    "VLC.VLC",
    "SlackTechnologies.Slack",
    "Microsoft.PowerToys",
    "Microsoft.WindowsTerminal",
    "Microsoft.Edge"
)

# Loop through each app and install it
foreach ($app in $appsToInstall) {
    Write-Host "`nInstalling $app..." -ForegroundColor Cyan
    try {
        winget install --id $app --silent --accept-source-agreements --accept-package-agreements -e
        Write-Host "$app installed successfully." -ForegroundColor Green
    }
    catch {
        Write-Host "Failed to install $app. Error: $_" -ForegroundColor Red
    }
}

Write-Host "`nAll installations complete." -ForegroundColor Yellow
