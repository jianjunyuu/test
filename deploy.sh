#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

dir=vue-admin
repository=mryujianjun.github.io
repositoryAddr=https://github.com/mryujianjun/mryujianjun.github.io.git
target=${repository}/${dir}


# 生成静态文件
vue-cli-service build --dest ${dir}

# 判断目录是否存在，是的话要先删除
if test -e ${repository}
then
    echo "仓库${repository}已存在"
else
    git clone ${repositoryAddr}
fi

# 判断目录是否存在，是的话要先删除
if test -e ${target}
then
    rm -r ${target}
    echo ${target}' is deleted!!!'
fi
mv ${dir} ${repository}

# 部署到远程仓库 https://github.com/mryujianjun/mryujianjun.github.io.git
cd ${repository}
git add ${dir}
git commit -m "deploy ${dir}"
git pull
git push origin master
echo "部署成功!"
echo "https://mryujianjun.cn/${dir}/"
exit 0
