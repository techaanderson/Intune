$url = "https://graph.microsoft.com/beta/deviceManagement/cloudCertificationAuthority"

$json = @"
{
	"certificateKeySize": "rsa2048",
	"certificationAuthorityIssuerId": null,
	"cloudCertificationAuthorityHashingAlgorithm": "sha256",
	"cloudCertificationAuthorityType": "rootCertificationAuthority",
	"commonName": "C",
	"displayName": "My Root CA",
	"extendedKeyUsages": [
		{
			"name": "Server auth",
			"objectIdentifier": "1.3.6.1.5.5.7.3.1"
		}
	],
	"organizationName": "",
	"roleScopeTagIds": [
		"0"
	],
	"validityPeriodInYears": 20
}
"@

$rootca = Invoke-MgGraphRequest -Method POST -Uri $url -Body $json -ContentType "application/json"