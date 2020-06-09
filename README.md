# vRAN_srsLTE
vRAN emulator (vUE + vENB) for LTE network using srsLTE software deployed with Docker containers

## Steps to deploy scenario 
Only two steps are neccesary to deploy this scenario:
```
sudo docker-compose -f docker-compose.yml build --no-cache
sudo docker-compose -f docker-compose.yml up
```

These steps are compulsory if Docker images are not downloaded yet. If they are:
```
sudo docker-compose -f docker-compose-prebuilt.yml up
```
