# Promotes system as DC server for domain "it305.cmit305.com" and restarts server
# Will require a password to be set for Directory Services Restore Mode (DSRM)
Install-ADDSForest -DomainName "it305.cmit305.com" -InstallDNS