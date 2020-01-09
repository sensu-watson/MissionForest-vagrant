# MissionForest開発環境
## :warning: Note
- 現在のMissionForestのバージョンはこの開発環境上では動作しない可能性が高いです
- [MissionForest](https://github.com/srmtlab/MissionForest)
  - 現在はDockerを用いた開発に移行をしています
  
## 使い方
1. virtualboxとvagrantをインストールしておく．
2. vagrant upを実行
3. vagrant sshを実行
4. "sudo /usr/local/virtuoso/bin/virtuoso-t -f -c /usr/local/virtuoso/var/lib/virtuoso/db/virtuoso.ini > /dev/null 2>/dev/null &"を実行(virtuoso)
5. MissionForestディレクトリに入る
6. "git clone https://github.com/srmtlab/MissionForest.git ./"を実行してMissionForestをclone
その後、https://github.com/srmtlab/MissionForest を参考に環境構築
