# devsecops-demo1
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