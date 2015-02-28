task :build_debootstrap_env do
  sh "docker build -t debootstrap-env ."
end

task build: [:build_debootstrap_env] do
  sh "docker run -v /var/run/docker.sock:/var/run/docker.sock --privileged debootstrap-env"
end

task :cleanup do
  sh "docker rmi debootstrap-env ."
end

Rake::Task[:build].enhance do
  Rake::Task[:cleanup].invoke
end

task push: [:build] do
  sh "docker push quay.io/assemblyline/ubuntu:14.04.2"
end
