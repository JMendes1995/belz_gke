# belz_gke


### clone beelzebub repo 
git clone https://github.com/JMendes1995/beelzebub.git

### clone belz_gke repo 
git clone https://github.com/JMendes1995/belz_gke.git

### enter in belz_gke dir
cd belz_gke/terraform

### build tfstate bucket
cd tf_state_bucket
terraform destroy -var-file=../env.tfvars

### execute terraform modules
cd ..
./executor.sh base apply
./executor.sh belz_k8s apply


### Install using "apt-get install" for DEB based systems
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin


### Install using "yum install" for RPM based systems
sudo yum install google-cloud-sdk-gke-gcloud-auth-plugin

### Verify installation

gke-gcloud-auth-plugin --version 


### install gke-gcloud-auth-plugin
gcloud components install gke-gcloud-auth-plugin

### install kubectl 
gcloud components install kubectl

### Authenticate into GKE cluster
gcloud container clusters get-credentials belz-gke --region europe-west4 --project sysadmcephcluster

### Check kubernetes context
kubectl config get-contexts


### deploy beelzebub helm chart
helm install -f ../beelzebub/beelzebub-chart/values.yaml beelzebub ../beelzebub/beelzebub-chart

### check running pods
kubectl get pods -n beelzebub

### check network loadbalancer ip
kubectl get services -n beelzebub

### ssh using the loadbalancer public ip 
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@NLB_PUB_IP

#### Enjoy the hack
