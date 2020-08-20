# ディレクトリ作成
mkdir workspace/vagrant

cd vagrant

vagrant init centos/7

https://vagrantcloud.com/centos/7

# SELinuxを停止
/etc/selinux/config

# Index symbolic


管理者権限でhostsファイルを開く
powershell -NoProfile -ExecutionPolicy unrestricted -Command "start notepad C:\Windows\System32\drivers\etc\hosts -verb runas"