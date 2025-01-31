

pipeline {

	agent {
    node {
        label 'Medtronic'
        customWorkspace 'C:\\Pipeline\\Jenkins'
    }
}

    stages {
        stage("Run Robot") {
            steps {
                script{
                    bat "robot --nostatusrc -d reports ROBOT/flygroups/test/flygroups.robot"
                }
            }
        }
		stage("Import Reports") {
			steps {
				script {
                    step([$class: 'XrayImportBuilder', endpointName: '/robot/multipart', importFilePath: 'reports/*.xml', importToSameExecution: 'false', projectKey: 'DIS', serverInstance: 'CLOUD-0259adf3-6a60-4e7e-8e5b-60902496c23e', importInParallel: 'false', testImportInfo: 'ROBOT/flygroups/imports/import-test.json', inputTestInfoSwitcher: 'filePath', inputInfoSwitcher: 'fileContent', importInfo: '''{
                            "fields": {
                                "project": {
                                    "key": "DIS"
                                },
                                "summary": "Test",
                                "issuetype": {
                                    "name": "Test Execution"
                                }
                            },
                            "xrayFields": {
                                    "testPlanKey": "DIS-53"
                            }
                        }'''])
                }
			}
		}
    }
}