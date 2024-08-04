devsecops-demo1 git repository
---
Exploring  DevSecOps with a dotnet sample project
There are 2 projects - dotnet WebApi which has restful http get method and a 2nd unit test project which has a single unit test. These projects are using default template from dotnet.
---
Initial Dotnet application creation commands 
- dotnet new sln -n Project1
- dotnet new webapi --use-controllers -o Project1Api
- dotnet sln add Project1Api\Project1Api.csproj
- dotnet new mstest -o Project1ApiTest
- dotnet sln add Project1ApiTest\Project1ApiTest.csproj
---
Dockerfile created with 2 container 
docker command for the build - docker build . -t project1-api
- 1st container is a SDK container with a source code compiled in its binary form.
- 2nd container is the run container where the binary artifacts from the previous container are copied.
---
Created initial CI pipeline to build and test the source code.
github stores CI pipeline in .github/workflow folder and the name of the CI pipeline file is dotnet.yml
---
CI pipeline to build container image and publish to github container registry completed
.github/workflow/docker-publish.yml
---
Added 3 security scan tools 
- 1st tool Dependabot (native github action for dependency scanning and fixing)
- 2nd tool CodeQL (native github action for SAST scan)
- 3rd tool Frogbot scan and fix (Xray)
---
Added pipeline to upload container image to JFrog Artifactory
---
Added Vulnerability to the pipeline
- 1st SBOM - using 3 package version which has vulnerability (Newton.Json, Azure.Identity, System.Text.Json) - Project1Api.csproj
- 2nd Secret - added password - AppSettings.json
- 3rd Container image - changed the base container image from debian to ubuntu (jammy) - Dockerfile
---
To run the container, execute the below docker command and navigate to http://localhost:8080/Weatherforecast
- docker run -p 8080:8080 ghcr.io/lifeboy5253/project1api:20
---
Link to the slide - https://docs.google.com/presentation/d/1MQtn1BIOUtnIYJ8qws_kMO-e8R9Xp-Bj1k0QzyhskdQ/edit?usp=sharing

---