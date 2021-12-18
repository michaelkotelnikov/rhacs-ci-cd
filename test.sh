declare -a "POLICIES=($(curl -k --silent --no-buffer -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6Imp3dGswIiwidHlwIjoiSldUIn0.eyJhdWQiOlsiaHR0cHM6Ly9zdGFja3JveC5pby9qd3Qtc291cmNlcyNhcGktdG9rZW5zIl0sImV4cCI6MTY3MTIwMjkzOCwiaWF0IjoxNjM5NjY2OTM4LCJpc3MiOiJodHRwczovL3N0YWNrcm94LmlvL2p3dCIsImp0aSI6ImNmZTM3ZjE2LWFkY2ItNGFiZi05NjExLWMyYTY0OWQzMTBlMSIsIm5hbWUiOiJjaS1jZCIsInJvbGVzIjpbIkFkbWluIl19.QW9OuqO1XsyEOuI06u9bcudKOLJuer22RrJSqd59vMUsBNUm8MKPgUpOAFgrKJjoiruMHYU34fHDuUl6mWDHtyPurhe0YqXH6RhLd6R-YWFX5j_Ffw1tgoWfB_03ApJs96En2ZDFyzmsCmBp2-a0kXr6jsUJZugi-dKUED4FnPUIVXRyoA5V8hWOkTzt2oaQIQkP19YhZq9_ggtmvLgj2ACsoqBSLt0rfIJcC9pimTrF074ES8XNx8bykZ1DYFUdo5VRLzt2q33pHFkz46PF-8gYlRE-Z62AZu4z-y_lQ54Kebpllu-3xkQReAGG4tmvikY3-VtUHnaNPAx95pvnkWf53u6KYHlg5ZSBzVvVvNOTeu-Ekd59HLx2JiTTUkQvNh3brFElimExEJgzlOBQtnLO92-mcVM8sNL13i1ky6cxnckMbiDeCerwXC-8nVMiMbNQCbBIlJX8ZgWij9k7_IPcfBNnYL8mH9-SkxT3W1as827fHWm557Tv-ofN7SSI97CPwIcpGvdf9at8gYVbVXgb29MhguikXNlGopjkaA9jQc61MJtGjvw9tjS3yjFXcW9aTl0dra09H7NcK82xFXRVCrb0U6dd0VD7bBE10WHgT6qXuVxtKZlUuRMGLJKnP21lYTosuA4Jz2SSbERyAoskn72pax9Nex0vl2MJDLs" -X GET https://central-stackrox.apps.cluster-rz5bc.rz5bc.sandbox514.opentlc.com/v1/policies | jq '.policies | .[].name | @sh'))"

GITHUB_POLICIES=$(ls -l policies/ | grep -v total | awk {'print $9'})

for github_policy in $GITHUB_POLICIES;do
	github_policy_content=$(cat policies/$github_policy | jq '.name' | sed "s/\"/\'/g")
	echo $github_policy_content
	if [[ " ${POLICIES[@]} " =~ " $github_policy_content " ]]; then
	        echo policy is in the array
	else
	        echo policy is not in array
	fi
done