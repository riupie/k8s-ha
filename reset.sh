for i in 1 2 3
do
	ssh vagrant@master$i sudo kubeadm reset -f
	ssh vagrant@master$i rm -rf .kube
done
