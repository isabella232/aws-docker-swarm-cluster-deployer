create_docker_swarm: setup_env
	.venv/bin/ansible-playbook -i "localhost," -c local aws_create_swarm_cluster.yml

destroy_docker_swarm: setup_env
	.venv/bin/ansible-playbook -i "localhost," -c local aws_destroy_swarm_cluster.yml

setup_env:
	virtualenv .venv
	.venv/bin/pip install ansible awscli boto
