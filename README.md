# belz_gke

### prerequesits
* enable compute engine api https://console.cloud.google.com/apis/library/compute.googleapis.com
* enable kubernetes engine api https://console.cloud.google.com/apis/library/container.googleapis.com
### clone beelzebub repo 
```bash
git clone https://github.com/JMendes1995/beelzebub.git
```

### clone belz_gke repo 
```bash
git clone https://github.com/JMendes1995/belz_gke.git
```

### enter in belz_gke dir
```bash
cd belz_gke/terraform
```

### build tfstate bucket
```bash
cd tf_state_bucket
terraform apply -var-file=../env.tfvars
```

### execute terraform modules
```bash
cd ..
./executor.sh base apply
./executor.sh belz_k8s apply
```

### Install using "apt-get install" for DEB based systems
```bash
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
```

### Install using "yum install" for RPM based systems
```bash
sudo yum install google-cloud-sdk-gke-gcloud-auth-plugin
```

### Verify installation
```bash
gke-gcloud-auth-plugin --version 
```

### install gke-gcloud-auth-plugin
```bash
gcloud components install gke-gcloud-auth-plugin
```

### install kubectl 
```bash
gcloud components install kubectl
```

### Authenticate into GKE cluster
```bash
gcloud container clusters get-credentials belz-gke --region europe-west4 --project belz-406915
```

### Check kubernetes context
```bash
kubectl config get-contexts
```

### deploy beelzebub helm chart
```bash
helm install -f ../beelzebub/beelzebub-chart/values.yaml beelzebub ../beelzebub/beelzebub-chart
```

### check running pods
```bash
kubectl get pods -n beelzebub
```

### check network loadbalancer ip
```bash
kubectl get services -n beelzebub
```

### ssh using the loadbalancer public ip 
```bash
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@NLB_PUB_IP
```

#### Enjoy the hack



### http honeypot log


```{"event":{"DateTime":"2023-12-02T16:46:17Z","RemoteAddr":"192.168.65.1:40883","Protocol":"HTTP","Command":"","CommandOutput":"","Status":"Stateless","Msg":"HTTP New request","ID":"b553436f-54bd-4f44-b95e-fbba4882d3d7","Environ":"","User":"","Password":"","Client":"","Headers":"[Key: Sec-Fetch-User, values: ?1],[Key: Connection, values: keep-alive],[Key: Cache-Control, values: max-age=0],[Key: Accept, values: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7],[Key: Upgrade-Insecure-Requests, values: 1],[Key: Content-Type, values: application/x-www-form-urlencoded],[Key: Sec-Fetch-Dest, values: document],[Key: Accept-Language, values: pt-PT,pt;q=0.9,en-US;q=0.8,en;q=0.7],[Key: Cookie, values: token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjZXBoLWRhc2hib2FyZCIsImp0aSI6IjNmMjVmYTMwLThjNWUtNGVmNy1hNjJlLTRkZjQ1YWE5NjRlOCIsImV4cCI6MTcwMDk2OTQwNiwiaWF0IjoxNzAwOTQwNjA2LCJ1c2VybmFtZSI6InNlcnZlcndvcmxkIn0.Ry0PfKI_nnq_KsyaKPe4LVMWlOGJNLLVuWxE_aqWnlg; PVEAuthCookie=PVE%3Aup202308811@alunos%3A6563DD75%3A%3A3Ov6PtiW0mqB+p9SXeESEYCs2y1P+rRwLKOmsk/Co3o/n131VKm7Me0IT+I7u2PNrpyulQ8A0EDDvvew95troEuIRAP/8nju4zDhloaiFVCJHWdScYBX5VUbMv9fJmrb4XGUSDrxjnwr6MMUTiY4VUDc3Hwt7cspWCefjWpMi3EWEvHFuTBchyBn/R+zUHqT9qEYHaY6CdUfXm4MKGqwLnEaQnF4f1TKc5IflFXCZh/rZORQcKddMUtPZgv0YpozTXwQK1rnvp1jnljC5m0KFfL7L3Ppl48WVbXfyMtnjJ1FDB4CTDxXdzZVeMHRf1gS1Mp0XZYzbmv/NxSaV/+ISA%3D%3D],[Key: Sec-Ch-Ua-Platform, values: \"macOS\"],[Key: Sec-Fetch-Site, values: same-origin],[Key: Sec-Fetch-Mode, values: navigate],[Key: Referer, values: http://localhost/wp-admin],[Key: User-Agent, values: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36],[Key: Accept-Encoding, values: gzip, deflate, br],[Key: Content-Length, values: 19],[Key: Sec-Ch-Ua, values: \"Google Chrome\";v=\"119\", \"Chromium\";v=\"119\", \"Not?A_Brand\";v=\"24\"],[Key: Sec-Ch-Ua-Mobile, values: ?0],[Key: Origin, values: http://localhost],","Cookies":"token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjZXBoLWRhc2hib2FyZCIsImp0aSI6IjNmMjVmYTMwLThjNWUtNGVmNy1hNjJlLTRkZjQ1YWE5NjRlOCIsImV4cCI6MTcwMDk2OTQwNiwiaWF0IjoxNzAwOTQwNjA2LCJ1c2VybmFtZSI6InNlcnZlcndvcmxkIn0.Ry0PfKI_nnq_KsyaKPe4LVMWlOGJNLLVuWxE_aqWnlgPVEAuthCookie=PVE%3Aup202308811@alunos%3A6563DD75%3A%3A3Ov6PtiW0mqB+p9SXeESEYCs2y1P+rRwLKOmsk/Co3o/n131VKm7Me0IT+I7u2PNrpyulQ8A0EDDvvew95troEuIRAP/8nju4zDhloaiFVCJHWdScYBX5VUbMv9fJmrb4XGUSDrxjnwr6MMUTiY4VUDc3Hwt7cspWCefjWpMi3EWEvHFuTBchyBn/R+zUHqT9qEYHaY6CdUfXm4MKGqwLnEaQnF4f1TKc5IflFXCZh/rZORQcKddMUtPZgv0YpozTXwQK1rnvp1jnljC5m0KFfL7L3Ppl48WVbXfyMtnjJ1FDB4CTDxXdzZVeMHRf1gS1Mp0XZYzbmv/NxSaV/+ISA%3D%3D","UserAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36","HostHTTPRequest":"localhost","Body":"uname=test\u0026psw=test","HTTPMethod":"POST","RequestURI":"/wp-admin","Description":"Wordpress 6.0"},"level":"info","msg":"New Event","status":"Stateless"}```