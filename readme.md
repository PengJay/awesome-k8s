# Kubernetes安装文档
## 1.Kubernetes 服务启动
### 1.1Docker Desktop中要启用 k8s 服务。

> 
> Mac直接在Docker Desktop的设置中找到k8s并启动, 最好更新下docker desktop, k8s版本v1.29.2


### 1.2确认环境中是否有k8s的cli命令行工具
``` shell
kubectl version
``` 
``` shell
kubectl version
Client Version: v1.29.2
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
Server Version: v1.29.2
```

## 2.安装k8s的dashboard
#### 2.1 安装helm工具

``` shell
brew install helm
``` 
#### 2.2 helm工具安装kubernetes-dashboard
``` shell 
# 添加 kubernetes-dashboard 仓库  
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
# 使用 kubernetes-dashboard Chart 部署名为 `kubernetes-dashboard` 的 Helm Release
helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard
```

#### 2.3 dashboard管理员创建
``` shell
# dashboard管理员
kubectl apply -f ./system/dashboard-adminuser.yaml
# 性能指标监控服务 metrics-server
kubectl apply -f ./system/metrics-server.yaml
 ```
#### 2.4 把dashboard端口转发到本地8443端口
``` shell
kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443
 ```
#### 2.5 访问dashboard

https://localhost:8443


#### 2.6 login token获取
``` shell
kubectl -n kubernetes-dashboard create token admin-user
```
