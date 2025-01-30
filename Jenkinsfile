

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
                echo "Ola"
            }
        }
		stage("Import Reports") {
			steps {
				echo "Tchau"
			}
		}
    }
}