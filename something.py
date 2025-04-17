python generate_schema.py \
  --project dubsrepo \
  --dataset dubsrepo_stg \
  --output models/stg/schema.yml

python generate_schema.py \
  --project dubsrepo \
  --dataset dubsrepo_int \
  --output models/int/schema.yml

python generate_schema.py \
  --project dubsrepo \
  --dataset dubsrepo_mrt \
  --output models/mrt/schema.yml
