# Vérifiez si FiveM est en cours d'exécution
if (Get-Process -Name "FiveM" -ErrorAction SilentlyContinue) {
    Write-Host("FiveM est en cours d'exécution. Veuillez fermer FiveM avant d'exécuter ce script.")

    
} else {
    # Spécifiez le chemin du dossier du cache de FiveM
    $logs = "C:\Users\ethan\AppData\Local\FiveM\FiveM.app\logs"
    $crashes = "C:\Users\ethan\AppData\Local\FiveM\FiveM.app\crashes"
    $data = "C:\Users\ethan\AppData\Local\FiveM\FiveM.app\data"

    # Logs
    if (Test-Path $logs -PathType Container) {
        Remove-Item -Path $logs -Recurse -Force
        Write-Host "Le dossier des journaux de FiveM a été supprimé."
    } else {
        Write-Host "Le dossier des journaux de FiveM a été supprimé."
    }

    # Crashes
    if (Test-Path $crashes -PathType Container) {
        Remove-Item -Path $crashes -Recurse -Force
        Write-Host "Le dossier des crashs de FiveM a été supprimé."
    } else {
        Write-Host "Le dossier des crashs de FiveM a été supprimé."
    }

    # Data
    #delete all the folders in the data folder except 'game-storage'
    $folders = Get-ChildItem -Path $data -Directory
    foreach ($folder in $folders) {
        Write-Host $folder.Name
        if ($folder.Name -ne "game-storage") {
            Remove-Item -Path $folder.FullName -Recurse -Force
        }
    }
    Write-Host "Le dossier des données de FiveM a été nettoyé."
}
