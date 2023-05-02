
# Script to crate a sample file and add numbers between 1 to 100
with open('/home/ec2-user/hello_world.txt', 'w') as f:
    for i in range(100):
        f.write(f"Writing - {i}\n")
f.close
