# Create instance template
gcloud compute instance-templates create web-template \
  --machine-type=e2-micro \
  --image-family=ubuntu-2204-lts \
  --image-project=ubuntu-os-cloud \
  --tags=http-server

# Create managed instance group
gcloud compute instance-groups managed create web-mig \
  --base-instance-name=web \
  --template=web-template \
  --size=1 \
  --zone=asia-south1-a

# Configure autoscaling
gcloud compute instance-groups managed set-autoscaling web-mig \
  --max-num-replicas=5 \
  --min-num-replicas=1 \
  --target-cpu-utilization=0.6 \
  --zone=asia-south1-a
