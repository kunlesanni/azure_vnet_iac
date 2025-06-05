<p align="center">
  <img src="https://user-images.githubusercontent.com/kunlesanni/azure_vnet_iac-banner.png" alt="Azure VNet IaC Banner" width="600"/>
</p>

# 🌐 Azure VNet IaC

Welcome! 👋  
This repository helps you **automate the creation of Azure Virtual Networks (VNet) using Infrastructure as Code (IaC) with Terraform**.  
Whether you're a beginner or a seasoned cloud engineer, this project is here to make your networking setup in Azure a breeze! 🚀

---

## ✨ Features

- 🔹 **Automated VNet Creation**  
- 🔹 Supports Subnets, NSGs, and Peering  
- 🔹 Modular, Reusable, and Scalable  
- 🔹 Easy to Configure and Deploy  
- 🔹 Follows Best Practices for Security & Organization

---

## 📦 Getting Started

1. **Clone this repo**
   ```bash
   git clone https://github.com/kunlesanni/azure_vnet_iac.git
   cd azure_vnet_iac
   ```

2. **Install [Terraform](https://www.terraform.io/downloads.html)**  
   Make sure you have Terraform installed.

3. **Configure your Azure credentials**  
   - You can use the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/authenticate-azure-cli) to login.

4. **Customize your variables**  
   - Edit `variables.tf` and/or create your own `terraform.tfvars` file.

5. **Deploy!**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

---

## 🛠️ Project Structure

```
azure_vnet_iac/
├── main.tf
├── variables.tf
├── outputs.tf
├── modules/
│   └── vnet/
├── examples/
│   └── simple/
└── README.md
```

---

## 📝 Example Usage

```hcl
module "vnet" {
  source              = "./modules/vnet"
  vnet_name           = "my-vnet"
  resource_group_name = "my-rg"
  address_space       = ["10.0.0.0/16"]
  subnets = [
    {
      name           = "subnet1"
      address_prefix = "10.0.1.0/24"
    }
  ]
}
```

---

## ⚡ Quick Preview

<p align="center">
  <img src="https://user-images.githubusercontent.com/kunlesanni/azure-vnet-diagram.png" alt="Azure VNet Architecture" width="400"/>
</p>

---

## 📚 Resources

- [Terraform Docs](https://www.terraform.io/docs/)
- [Azure Virtual Network Docs](https://docs.microsoft.com/en-us/azure/virtual-network/)

---

## 💡 Contributing

Contributions are welcome!  
Feel free to open issues or submit PRs.  
Make this project even more awesome! 😎

---

## 🙌 Support

If you found this useful, please ⭐️ the repo!

You can reach out on [LinkedIn](https://linkedin.com/in/kunlesanni) or open an issue for suggestions.

---

<p align="center">
  <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExYjFlcnk2Zmp2bHR3Z2k3M3A0czMwNDh6b3N4aWF2Y3R0N2U1d3l0OCZlcD12MV9naWZzX3NlYXJjaCZjdD1n/du3J3cXyzhj75IOgvA/giphy.gif" width="150"/>
</p>

<p align="center">
  <b>Happy Networking!</b> 🚀
</p>

---

**Tip:**  
- Add your own custom banner and architecture diagrams by uploading images to your repo and replacing the image URLs above.
- Consider adding badges (build status, license, etc.) at the top for extra flair.
