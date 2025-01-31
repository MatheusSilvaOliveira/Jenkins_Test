

pipeline {
	parameters {
		string defaultValue: 'TC001', description: 'Select TC will be run(e.g TC001)', name: 'include'
		string defaultValue: '10', description: 'Add days for test execution', name: 'days'
		choice choices: ['firefox', 'chrome'], description: 'Select browser to run tests', name: 'browser'
		string defaultValue: 'QLT', description: 'Select environment to run', name: 'environment'
		string defaultValue: '', description: 'Type Test Plan Key', name: 'testPlanK'
		string defaultValue: '', description: 'Type Test Exec Key', name: 'testExec'
		string defaultValue: 'TEX00', description: 'Type the Test Execution Name', name: 'summary'
		choice choices: ['OFF', 'ON'], description: 'Debug Xray', name: 'test'
		choice choices: ['NO', 'YES'], description: 'Same Test Execution', name: 'sameExec'
	}

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