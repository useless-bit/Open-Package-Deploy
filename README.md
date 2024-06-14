# Open Package Deploy

OPD (Open Package Deploy) allows you to deploy almost everything, everywhere, in an easy way.

The Code for the [Backend (Server and Agent)](https://github.com/useless-bit/Open-Package-Deploy-Backend) and
the [Frontend](https://github.com/useless-bit/Open-Package-Deploy-Frontend) is available on GitHub.

You can find some Screenshots of the UI in the [User Guide](Documentation/User_guide.md) or
this [Image Folder](Documentation/images/OPD).

![Image of Dashboard](Documentation/images/OPD/OPD_Dashboard.png)

<!-- TOC -->
* [Open Package Deploy](#open-package-deploy)
* [Features](#features)
* [What can be deployed](#what-can-be-deployed)
* [Installation](#installation)
* [User Guide](#user-guide)
* [Agent Functionality](#agent-functionality)
  * [When will the Agent contact the Server](#when-will-the-agent-contact-the-server)
  * [Update Request Content](#update-request-content)
* [Security](#security)
  * [Agent-Server Communication](#agent-server-communication)
  * [Packages](#packages)
  * [Agent Registration](#agent-registration)
<!-- TOC -->

# Features

- Simple
- Fast
- Cross Platform Agent (macOS, Linux, Windows)
- Secure (Agent - Server communication is fully encrypted and signed)
- Multi-User capable
- Web-App is mobile friendly
- Agent Auto-Update

# What can be deployed

OPD was designed to be usable for many different use cases.

The Agent will execute a script (`start.sh` for Linux and macOS and `start.bat` for Windows) that you provide inside a
Package. From there, you can do almost anything.

You can get more infos in the Guide: [Create a Package]()

Examples:

* Install Software through a package manager or included installer-file
* Copy included files to a destination
* Change System-configurations

Example Packages will be provided in
this [GitHub Repository](https://github.com/useless-bit/Open-Package-Deploy-Packages).

# Installation

To get OPD up and running, follow the [Quickstart Guide](Documentation/Quickstart.md).
There you will set up OPD, Keycloak and the required Databases using Docker and Docker Compose.

Don't forget to check out the [Recommended Keycloak Settings](Documentation/Keycloak_recommended_settings.md)

# User Guide

If you want to learn more on how to use OPD, head over to the [User Guide](Documentation/User_guide.md).

# Agent Functionality

This is a short description on how and when the Agent will contact the Server and what information is transmitted.

## When will the Agent contact the Server

The Agent will contact and ask the Server for Updates in three scenarios:

- Agent Startup
- `Update Interval` timer is expired
- After successfully processing a Package

## Update Request Content

When the Agent asks the Server for Updates, it will get and process the following data:

- Agent Checksum (for Auto Update): <br>
  Start Auto Update for Agent if Checksum is different
- `Update Interval`: <br>
  Update the value in the local config-file and restart the Agent
- Is a deployment available: <br>
  Start the Package download and installation process

# Security

## Agent-Server Communication

The communication between the Agent(Endpoint/Client) and the Server is fully encrypted and signed.

Every request is first signed and then encrypted using Asymmetric Cryptography.
The Signature is using the `SHA512withECDSA`-Algorithm while the encryption uses `ECIES/None/NoPadding`.

If a request is received, the content is first decrypted and then verified with the signature. If an error occurs, the
request gets dropped.

Every Agent will generate its own Public- and Private-Keypair. During the registration process, the Agent will send its
Public-Key to the Server and gets the Servers' Public-Key.

## Packages

All uploaded Packages will be encrypted before they can/will be delivered to Agents.
A Package will never be sent in plaintext to an Agent.

Every Package is encrypted using a unique Key and IV for the `AES/GCM/NoPadding`-Algorithm.

After the Package is uploaded, checksums will be calculated and the Package will get encrypted. The Plaintext-Package
will be deleted afterward.

## Agent Registration

To initiate the registration process, a `Registration Token` needs to be sent. This Token is auto-generated on first
start, and can be seen and updated/regenerated in the Settings.

