### Record the docker development environment where the work has been done


## How to build 
  
```js
       # git clone git@github.com:ltjsj/lapis-centos.git
       # cd lapis-centos && docker build -t ltjsj/lap-centos:tagname . 
       # docker tag lapis-centos ltjsj/lapis-centos:tagname 
       # docker push ltjsj/lapis-centos:v1.0
```



## The build script is as follows

[The wrong image of docker after packaging is here](https://hub.docker.com/u/ltjsj)
  

## How to run 
  
```js
       # docker pull ltjsj/lapis-centos:v1.0    
       # dorcker run  -v /i/workProject/lua/project-name:/data/www/program -p 9444:8010  ltjsj/lapis-centos:v1.0
```

## Explanation   

**/i represents the i disk under windows, such as the location where the i: \, d: \, c: \ disk Your project is stored in the windows environment, just mount it out, 9444 is the port of windows,  8010 is the port in the container**
