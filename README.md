# Open Package Deploy

OPD (Open Package Deploy) allows you to deploy almost everything, everywhere, in an easy way.

The Code for the [Backend (Server and Agent)](https://github.com/useless-bit/Open-Package-Deploy-Backend) and the [Frontend](https://github.com/useless-bit/Open-Package-Deploy-Frontend) is available on GitHub.

![Image of Dashboard](Documentation/images/OPD/OPD_Dashboard.png)

<!-- TOC -->
* [Open Package Deploy](#open-package-deploy)
* [Features](#features)
* [Installation](#installation)
* [Security](#security)
  * [Agent-Server Communication](#agent-server-communication)
  * [Packages](#packages)
<!-- TOC -->

# Features

- Simple
- Fast
- Cross Platform Agent (macOS, Linux, Windows)
- Secure (Agent - Server communication is fully encrypted and signed)
- Multi-User capable
- Web-App is mobile friendly
- Agent Auto-Update


# Installation

To get OPD up and running, follow the [Quickstart Guide](Documentation/Quickstart.md).
There you will set up OPD, Keycloak and the required Databases using Docker and Docker Compose.


# Security

## Agent-Server Communication

The communication between the Agent(Endpoint/Client) and the Server is fully encrypted and signed.

Every request is first signed and then encrypted using Asymmetric Encryption. 
The Signature is using the `SHA512withECDSA`-Algorithm while the encryption uses `ECIES/None/NoPadding`.

If a request is received, the content is first decrypted and then verified with the signature. If a error occurs, the request gets dropped.

Every Agent will generate its own Public- and Private-Keypair. During the registration process, the Agent will get the Public-Key from the Server and sends its own Public-Key to it as well.

## Packages

All uploaded Packages will be encrypted before they can/will be delivered to Agents.
A Package will never be sent in plaintext to an Agent.

Every Package is encrypted using a unique Key and IV for the `AES/GCM/NoPadding`-Algorithm.

## Agent Registration

To  initiate the registration process, a `Registration Token` needs to be sent. This Token is auto-generated on first start, and can be seen and updated/regenerated in the Settings.

