1、	git查看分支：
git branch ：查看本地分支，并在当前分支用*标记。
Git branch –a: 查看所有分支，包括本地分支和远程分支。
Git bramch –r:查看远程分支。

2、	切换分支
Git branch XXX :创建新的分支。如果分支已经存在会提示分支已经存在。
Git checkout XXX：切换到XXX分支。
git checkout -b XXX: 创建分支并切换到新的分支。这个命令是git branch和git checkout命令的组合，这也是和git branch XXX命令的区别。 
Git checkout –b XXX origin/XXX:基于远程分支创建本地分支，并切换到新的分支。
git checkout –b XXX develop：基于本地develop分支创建新的并切换到新的分支。
3、	更新代码
操作之前要看清分支，清楚操作的是哪个分支，可以使用git branch确定在哪个分支上，使用git pull 更新代码到本地。
Unpacking objects:更新代码时一直处于这个状态
4、	查看远程地址：
Git remote –v  :可以查看远程地址的详细情况
Git remote ：可以查看当前目录下远程地址的引用名称。
