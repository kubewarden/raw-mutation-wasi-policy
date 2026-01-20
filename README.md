> [!IMPORTANT]
> **Notice:**
> Starting from Kubewarden release 1.32.0, all code from this repository has been merged into [github.com/kubewarden/policies](https://github.com/kubewarden/policies), which is now a monorepo containing policies.
> Please refer to that repository for future updates and development.
> **This repository is now archived. Development continues in the new location.**




[![Kubewarden Policy Repository](https://github.com/kubewarden/community/blob/main/badges/kubewarden-policies.svg)](https://github.com/kubewarden/community/blob/main/REPOSITORIES.md#policy-scope)
[![Stable](https://img.shields.io/badge/status-stable-brightgreen?style=for-the-badge)](https://github.com/kubewarden/community/blob/main/REPOSITORIES.md#stable)

# Kubewarden policy raw-mutation-wasi-policy

## Description

This is a WASI test policy that mutates raw requests.

The policy accepts requests in the following format:

```json
{
  "request": {
    "user": "tonio"
    "action": "eats",
    "resource": "banana",
  }
}
```

The policy mutates the resource to a default resource defined by the settings
if the resource is contained in the list of forbidden resources.

## Settings

This policy has configurable settings:

- `forbiddenResources`: a list of resources that cannot be accessed by the user.
- `defaultResource`: the default resource to use if a resource is forbidden.
