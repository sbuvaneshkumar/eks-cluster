# eks-cluster
## Architecture
![aws-devops-test](https://user-images.githubusercontent.com/12863319/164417655-d46794ce-323b-444b-83fa-39c1b99c1e42.png)

## Things to consider when deploying in production
* CI/CD pipeline which consists of: Docker image build, image scanning, push to ECR, changes to image version in Helm chart and deployment to different stages
* AWS Route53 routing rules based on geographic 
* E.g. If clients from Germany visits example.com -> example.de, vise versa for clients from the USA
* Two dedicated EKS clusters for each region (US/ Germany)
* AWS WAF protection rule if we needed to not allow clients from other country (Geo-location based filtering) 
* AWS API Gateway infront of EKS cluster which makes it possible to allow connections within AWS resources, instead of reaching internet
* Monitoring using Prometheus and Grafana
* Elasticache for caching if any database is used for the application
* Elasticsearch for centraly storing logs for different applications and cluster (for each region)
