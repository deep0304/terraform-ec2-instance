# Terraform EC2 

This project provisions an AWS EC2 instance using **Terraform**, with support for both **Terraform Cloud** and **local CLI** execution.

---

## 🧰 Prerequisites

- Terraform installed on your local machine
- If using AWS locally:
  - Set up **AWS CLI**
  - Add your AWS credentials using `aws configure`
- If using **Terraform Cloud**:
  - Set your AWS Access Keys in the workspace variables (Terraform UI)
  - Add your **Terraform Cloud API token** in local machine:

```bash
terraform login
```

---

## 📦 Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/deep0304/terraform-ec2-instance.git
cd terraform-ec2-instance
```

### 2. Choose Execution Mode

- If using **Terraform Cloud** → **Uncomment the `cloud` block** in `terraform.tf`.
- **Terraform Cloud** uses the aws credentials saved in the environmental variables
- If using **local Terraform**, leave the cloud block commented.
  - Local mode uses credentials from your AWS CLI configuration.

---

## ⚙️ Usage

```bash
terraform init
```

> After `init`, the output should show Terraform connecting to the correct backend (cloud or local).


```bash
terraform validate
terraform plan
```

- If any error occurs, make sure:
  - All files are present
  - Cloud block (if any) is correctly uncommented
  - AWS credentials are valid

```bash
terraform apply
```
![terraform apply](https://github.com/user-attachments/assets/7eb35c6b-50f2-47e2-9d61-389cfe0e7346)

- Confirm changes with `yes` when prompted.

  ![yes input ](https://github.com/user-attachments/assets/72e97644-f8be-4598-bcba-9a3a30346127)


---

## 🌐 Output

- On success, Terraform creates:
  - 1 EC2 instance
  - 1 Security Group (opens port 80)
  - 1 Key Pair
- It will also output the **public IP address** of the EC2 instance.
![output ip](https://github.com/user-attachments/assets/c92370b1-5636-43b6-93cb-af9029297287)

---

## 🔐 SSH into EC2

Use the provided IP and your private key:

```bash
ssh -i "your-key.pem" ec2-user@<public-ip>
```

![ssh into instance ](https://github.com/user-attachments/assets/f48cd0d4-f53a-4411-a18d-1b59f39d524d)

---

## 🧪 Bonus: Optional VPC Setup

If you want to provision a **custom VPC**, simply **uncomment** the contents of `vpc_instance.tf` and run:

```bash
terraform apply
```

This will create a separate VPC setup on AWS.

---

## 🧠 Author

**Lakshya**  
[GitHub](https://github.com/deep0304) 
