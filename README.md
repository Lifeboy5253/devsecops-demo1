devsecops-demo1 git repository
---
**Goal**- Exploring  DevSecOps with a dotnet sample project

**There are 2 projects** - dotnet WebApi which has restful http get method and a 2nd unit test project with a single unit test. These projects are using default template from dotnet.

---

Initial Dotnet application creation commands 
- dotnet new sln -n Project1
- dotnet new webapi --use-controllers -o Project1Api
- dotnet sln add Project1Api\Project1Api.csproj
- dotnet new mstest -o Project1ApiTest
- dotnet sln add Project1ApiTest\Project1ApiTest.csproj

- _**Credits to my dotnet friend for helping me out with the code**_
---

**Dockerfile created with 2 container **

docker command for the build - docker build . -t project1-api

- **1st container** is an SDK container with a source code compiled in its binary form.
- **2nd container** is the run container where the binary artifacts from the previous container are copied.

---

**Created an initial CI pipeline to build and test the source code.**
Github stores CI pipeline in .github/workflow folder and the name of the CI pipeline file is dotnet.yml

---

**Created CI pipeline to build container image and publish to github container registry completed**
.github/workflow/docker-publish.yml

---
**Added 3 security scan tools**
- 1st tool Dependabot (native github action for dependency scanning and fixing)
- 2nd tool CodeQL (native github action for SAST scan)
- 3rd tool [![Scanned by Frogbot](https://raw.github.com/jfrog/frogbot/master/images/frogbot-badge.svg)](https://docs.jfrog-applications.jfrog.io/jfrog-applications/frogbot)
---
**Added pipeline to upload container image to JFrog Artifactory**

---
**Added Vulnerability to the pipeline**
To evaluate the effectiveness of various security tools, the following vulnerabilities have been intentionally introduced:

- 1st- SBOM-related Vulnerability - Packages: Utilizing versions with known vulnerabilities. Packages- Newton.Json, Azure.Identity, System.Text.Json) - Project1Api.csproj
- 2nd- Secret-related Vulnerability - Added a hardcoded password to the configuration file. File: AppSettings.json
- 3rd- Container Image-related Vulnerability - Changed the base container image from Debian to Ubuntu (Jammy) - File: Dockerfile 
- updated (8/5), Changed the base container base image to Alpine, which has a smaller footprint, to observe if it results in fewer security vulnerabilities. File: Dockerfile 
---
**To run the container**, execute the below docker command and navigate to http://localhost:8080/Weatherforecast
- docker run -p 8080:8080 ghcr.io/lifeboy5253/project1api:20
---
**Link to the slide** - https://docs.google.com/presentation/d/1y9XMi4D8vohxNJt6B7zI379AUNZPdAnZL_vGw1TNSb0/edit?usp=sharing

---
