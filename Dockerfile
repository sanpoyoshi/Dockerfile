#20200627 https://datawokagaku.com/startjupyternote/

#アナコンダのバージョン
# https://docs.anaconda.com/anaconda/install/hashes/lin-3-64/
#Anaconda3-2020.02-Linux-x86_64.sh
#Anaconda3-2019.10-Linux-x86_64.sh
#Anaconda3-2019.03-Linux-x86_64.sh
pAnacnd3=Anaconda3-2020.02-Linux-x86_64.sh

 
FROM ubuntu:latest

# update
RUN apt-get -y update && apt-get install -y \
sudo \
wget \
vim

#install anaconda3
WORKDIR /opt
# download anaconda package and install anaconda
# archive -> https://repo.continuum.io/archive/
RUN wget https://repo.continuum.io/archive/${pAnacnd3} && \
sh /opt/${pAnacnd3} -b -p /opt/anaconda3 && \
rm -f ${pAnacnd3}
# set path
ENV PATH /opt/anaconda3/bin:$PATH

# update pip and conda
RUN pip install --upgrade pip

WORKDIR /
RUN mkdir /work

# execute jupyterlab as a default command
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]
