# 🌐 Azure VNet IaC

![Azure](https://img.shields.io/badge/Azure-blue?logo=microsoft-azure&logoColor=white)
![IaC](https://img.shields.io/badge/Infrastructure%20as%20Code-HCL-green)
![Terraform](https://img.shields.io/badge/Terraform-v1.x-purple?logo=terraform&logoColor=white)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)

---

```
         _    _      _                        _   _      _   
        / \  | | ___| |__   ___  _ __   ___  | \ | | ___| |_ 
       / _ \ | |/ __| '_ \ / _ \| '_ \ / _ \ |  \| |/ _ \ __|
      / ___ \| | (__| | | | (_) | | | |  __/ | |\  |  __/ |_ 
     /_/   \_\_|\___|_| |_|\___/|_| |_|\___| |_| \_|\___|\__|
```

---

Welcome to the **Azure VNet IaC** repo!  
Easily deploy and manage Azure Virtual Networks using simple, repeatable code.

---

## 🚀 What is this?

This project helps you **quickly spin up Azure Virtual Networks (VNets)** using [Terraform](https://www.terraform.io/).  
It's designed for **simplicity, reusability, and speed** — so you can focus on building, not wiring up infrastructure.

---

## 📦 Features

- 🌈 **Easy-to-read HCL**: No cryptic code. Just clear and modular Terraform.
- 🧩 **Modular Design**: Reuse and combine as you wish!
- 🚦 **Quick Start**: Up & running in minutes.
- 🔒 **Secure Defaults**: Follows Azure best practices.

---

## ⚡ Quick Start

1. **Clone this repo**
    ```sh
    git clone https://github.com/kunlesanni/azure_vnet_iac.git
    cd azure_vnet_iac
    ```

2. **Initialize Terraform**
    ```sh
    terraform init
    ```

3. **Customize your variables**
    - Edit the `terraform.tfvars` or override in CLI.

4. **Plan & Apply 🚀**
    ```sh
    terraform plan
    terraform apply
    ```

---

## 🛠️ Customization

- Edit `variables.tf` for your VNet settings (name, address space, subnets, etc).
- Use `terraform.tfvars` for your environment-specific values.

---

## 📁 Folder Structure

```
azure_vnet_iac/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example
└── README.md
```

---

## 💡 Example

```hcl
module "vnet" {
  source              = "./modules/vnet"
  vnet_name           = "myVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  resource_group_name = "my-rg"
}
```

---

## 🤝 Contributing

- Found a bug or have an idea? [Open an issue!](https://github.com/kunlesanni/azure_vnet_iac/issues)
- Pull requests are super welcome!

---

## 👩‍💻 Author

- **Kunle Sanni**  
  [![GitHub](https://img.shields.io/badge/GitHub-kunlesanni-blue?logo=github)](https://github.com/kunlesanni)

---

## 📜 License

[MIT](LICENSE)

---

<p align="center">
  <img src="https://user-images.githubusercontent.com/994701173/227116438-azure-vnet.png" width="150" alt="Azure VNet">
</p>

---

> _Happy automating! ☁️🚀_
