def plan = "${testPlanK}"

def info = '''{
                            "fields": {
                              "project": {
                                  "key": "SQTP"
                              },
                              "summary": "${summary}",
                              "issuetype": {
                                  "name": "Test Execution"
                              }
                            },
                            "xrayFields": {
                                "testPlanKey": "${testPlanK}"                                                  
                            }
                      }'''

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

	agent any

    stages {
        stage("Run Robot") {
            steps {
                script{
                    if(params.test == "ON"){
                        bat "robot --nostatusrc -d reports -v BROWSER:${browser} -v days:${days} -v env:${environment} -i ${include} ROBOT/flygroups/test/flygroups.robot"            
                    }else if(params.test == "OFF"){
                        bat "robot --nostatusrc -d reports -v BROWSER:${browser} -v days:${days} -v env:${environment} -v debug:${test} -i ${include} ROBOT/flygroups/test/flygroups.robot"
                    }
                }
            }
        }
		stage("Import Reports") {
			steps {
				script {
                    if(params.sameExec == "YES"){
                        step([$class: 'XrayImportBuilder', endpointName: '/robot', importFilePath: 'reports/*.xml', importInParallel: 'false', importToSameExecution: 'true', projectKey: 'SQTP', serverInstance: 'CLOUD-9775b630-4ac9-4fa1-93d8-f2bcbbcacc5e', testExecKey: '${testExec}', testPlanKey: '${testPlanK}'])
                    }else{ 
                        if(params.test == "ON"){
                            step([$class: 'XrayImportBuilder', endpointName: '/robot/multipart', importFilePath: 'reports/*.xml', importToSameExecution: 'false', projectKey: 'XRAY', serverInstance: 'CLOUD-9775b630-4ac9-4fa1-93d8-f2bcbbcacc5e', importInParallel: 'false', testImportInfo: 'ROBOT/flygroups/imports/import-test.json', inputTestInfoSwitcher: 'filePath', inputInfoSwitcher: 'fileContent', importInfo: '''{
                            "fields": {
                                "project": {
                                    "key": "XRAY"
                                },
                                "summary": "${summary}",
                                "issuetype": {
                                    "name": "Test Execution"
                                }
                            },
                            "xrayFields": {
                                    "testPlanKey": "XRAY-1637"
                            }
                        }'''])                
					    }else if(params.test ==  "OFF"){
                            step([$class: 'XrayImportBuilder', endpointName: '/robot/multipart', importFilePath: 'reports/*.xml', importToSameExecution: 'true', projectKey: 'SQTP', serverInstance: 'CLOUD-9775b630-4ac9-4fa1-93d8-f2bcbbcacc5e', importInParallel: 'false', importInfo: info, inputInfoSwitcher: 'fileContent', testImportInfo: 'ROBOT/flygroups/imports/import-test.json', inputTestInfoSwitcher: 'filePath'])
					    }
                    }
				}
			}
		}
    }

	post {
		always {
			robot outputPath: 'reports/', logFileName: 'log.html', outputFileName: 'output.xml', reportFileName: 'report.html', passThreshold: 100, unstableThreshold: 75.0
		}
	}
}