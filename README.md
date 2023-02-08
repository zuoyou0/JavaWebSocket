# JavaWebSocket内存马
## 环境
使用环境jdk1.8，tomcat7.0.65
## 使用
### 正常启动web端，可以多用户正常发送消息
![image](https://user-images.githubusercontent.com/45226950/217410519-6c1f0369-7fb7-4258-bdd2-90487d6e5a4e.png)
### 正常启动服务端，打印用户数量
![image](https://user-images.githubusercontent.com/45226950/217410623-9c35f98e-58aa-448f-92f4-d53e7898134e.png)
### 访问webshell，注入ws内存马
![image](https://user-images.githubusercontent.com/45226950/217410767-1079cee4-61cc-470b-b966-46c61f9bbcc5.png)
### 链接内存马，执行命令
![image](https://user-images.githubusercontent.com/45226950/217410865-69bd0b0b-923a-4a98-858d-f230ea4ab937.png)
### 访问查找内存马web页，打印所有ws链接以及实体文件
![image](https://user-images.githubusercontent.com/45226950/217411072-70a26c57-87e4-4bec-8813-ca67822fb232.png)

### 参考：
https://www.freebuf.com/vuls/346129.html

https://www.freebuf.com/articles/web/339361.html
