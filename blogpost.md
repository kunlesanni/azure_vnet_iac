# Azure Virtual Network Infrastructure as Code(Terraform)

## What I Built and Why

As a cloud infrastructure engineer, I constantly found myself wrestling with one of Terraform's biggest pain points: **managing complex, nested data structures for Azure networking configurations**. Every time I needed to deploy multiple VNets with different subnets and security groups, I'd end up with massive, repetitive Terraform files that were a nightmare to maintain.

I faced this challenge repeatedly in my work - copying and pasting resource blocks, maintaining multiple variable files, and watching my colleagues struggle to make simple network changes because they had to dig through complex HCL syntax. There had to be a better way.

**So I built this solution**: A YAML-driven Infrastructure as Code approach that completely transforms how we handle complex Azure networking deployments. Instead of wrestling with Terraform's variable limitations, I created a system where anyone can define entire network topologies in simple, readable YAML files.

## The Problem I Solved

In my experience with enterprise Terraform deployments, I kept running into these frustrating issues:

-**Repetitive Code Everywhere**: I was writing the same subnet and NSG blocks over and over, just with different values

-**Complex Variable Management**: Passing nested data structures through Terraform modules felt like solving a puzzle every time

-**Team Collaboration Friction**: My non-infrastructure colleagues couldn't make simple network changes without learning HCL syntax

-**Environment Scaling Nightmares**: Creating new environments meant copying and modifying dozens of variable definitions

I realized that most teams face these same challenges, but there wasn't a clean, reusable pattern to solve them effectively.

## How I Solved It

After experimenting with different approaches, I developed a **YAML-first infrastructure pattern** that separates configuration data from infrastructure logic. Here's what I built:

### My YAML Configuration Layer

Instead of complex Terraform variables, I created a simple YAML structure that anyone can understand:

```yaml

vnets:

  - name: workload1

rg: rg-network

location: uksouth

address_space: ["10.60.0.0/19"]

subnets:

      - name: sn1

cidr: "10.60.0.0/24"

nsgs:

          - name: nsg1

nsgrules:

              - name: AllowHTTP

priority: 100

direction: Inbound

access: Allow

protocol: Tcp

```

### My Advanced Data Transformation Engine

The real magic happens in how I process this YAML. I built a sophisticated data transformation pipeline using advanced Terraform techniques:

```hcl

# My approach to flattening complex nested structures

all_subnets = {

  for subnet in flatten([

    for vnet in local.vnets : [

      for subnet in vnet.subnets : {

        vnet_name    = "vnet-${vnet.name}-${var.env_prefix}"

        subnet_name  = "sn-${subnet.name}-${var.env_prefix}"

        # My custom transformation logic

      }

    ]

  ]) : "${subnet.vnet_name}-${subnet.subnet_name}" => subnet

}

```

This took me several iterations to get right - handling Terraform's state key conflicts while maintaining logical naming was particularly challenging!

## What Makes This Special

### For Infrastructure Engineers Like Me

-**90% Less Code Duplication**: I can define 50 subnets in 20 lines of YAML instead of 500 lines of HCL

-**Consistent Deployments**: My standardized patterns eliminate configuration drift across environments

-**Version Control Friendly**: I track all infrastructure changes through simple YAML file commits

### For My Team Members

-**Self-Service Capability**: My colleagues can now modify network configurations without needing to understand Terraform

-**Rapid Environment Creation**: We spin up new environments in minutes, not hours

-**Standardized Security**: Everyone gets the same tested, secure NSG configurations

### For Business Impact

-**Faster Delivery**: What used to take me days of Terraform coding now takes minutes of YAML editing

-**Reduced Errors**: Standardized patterns mean fewer misconfigurations and faster troubleshooting

-**Team Productivity**: My entire team can now contribute to infrastructure changes

## The Technical Skills I Demonstrated

Through building this solution, I showcased several advanced capabilities:

### Complex Terraform Mastery

I implemented sophisticated data manipulation techniques that most Terraform users struggle with:

- Multi-level nested `for` expressions with `flatten()` operations
- Dynamic resource generation from hierarchical data structures
- Advanced state key management to prevent conflicts
- Clean module architecture with proper separation of concerns

### Infrastructure Design Thinking

I designed this system with enterprise scalability in mind:

- Configuration-driven infrastructure patterns
- Environment-agnostic design principles
- Azure naming convention best practices
- Modular, reusable architecture

### Problem-Solving Approach

I identified a real pain point and built a comprehensive solution that addresses root causes, not just symptoms.

## How You Can Use This

I've made this entire solution available in my repository so you can either use it directly or build upon it for your own needs:

### Quick Start for Your Projects

```bash

# Clone my repository

gitclone <repository-url>

cdazure_vnet_iac


# Customize the YAML for your network requirements

vimvnets.yaml


# Deploy with your environment prefix

terraformplan-var="env_prefix=dev"

terraformapply-var="env_prefix=dev"

```

### Extending My Solution

I built this with extensibility in mind. You can easily:

- Add new Azure resource types to the YAML schema
- Implement multi-region deployments
- Integrate with your CI/CD pipelines
- Extend the naming conventions for your organization

## What I Learned and What's Next

Building this solution taught me a lot about the intersection of infrastructure automation and developer experience. I discovered that the most powerful Infrastructure as Code isn't necessarily the most complex - it's the most accessible.

I'm currently working on extending this pattern to include:

-**Route Table Automation**: Dynamic routing configuration through YAML

-**Multi-Region Support**: Cross-region network topology management

-**Compliance Integration**: Automated policy-as-code validation

-**CI/CD Templates**: Ready-to-use pipeline configurations

## Why This Matters

In my experience, the best infrastructure solutions are the ones that make complex tasks simple, not simple tasks complex. This project represents my approach to infrastructure engineering: **solve real problems with elegant solutions that teams actually want to use**.

If you're facing similar challenges with Terraform data structures or Azure networking automation, I'd encourage you to check out my repository. Feel free to use it, extend it, or reach out if you'd like to collaborate on making it even better.

**Repository**: [Link to your repo]

**Technical Questions**: [Your contact info]

**Collaboration**: Always open to discussing infrastructure automation challenges and solutions!
