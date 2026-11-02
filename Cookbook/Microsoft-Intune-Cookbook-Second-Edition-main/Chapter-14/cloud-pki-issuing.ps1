$rootid = $rootca.ID

$url = "https://graph.microsoft.com/beta/deviceManagement/cloudCertificationAuthority"

$json = @"
{
	"certificateKeySize": "rsa2048",
	"certificationAuthorityIssuerId": "$rootid",
	"cloudCertificationAuthorityHashingAlgorithm": "sha256",
	"cloudCertificationAuthorityType": "issuingCertificationAuthority",
	"commonName": "MYCOMMONNAME",
	"displayName": "My intermediate CA",
	"extendedKeyUsages": [
		{
			"name": "Server auth",
			"objectIdentifier": "1.3.6.1.5.5.7.3.1"
		}
	],
	"roleScopeTagIds": [
		"0"
	],
	"validityPeriodInYears": 2
}
"@

Invoke-MgGraphRequest -Method POST -Uri $url -Body $json -ContentType "application/json"