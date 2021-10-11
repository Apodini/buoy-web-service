import Apodini
import ApodiniHTTP
import ArgumentParser
import DeploymentTargetIoTRuntime
import ApodiniDeploy
import DeploymentTargetIoTRuntime

@main
struct BuoyWebService: WebService {
    
    var configuration: Configuration {
        HTTPConfiguration(port: 8080)
        HTTP()
        ApodiniDeploy(runtimes: [IoTRuntime<Self>.self])
    }

    var content: some Component {
        Group("sensors") {
            Sensor()
        }.metadata(DeploymentDevice(.default))

        Group("data") {
            SensorData()
        }
    }
}
