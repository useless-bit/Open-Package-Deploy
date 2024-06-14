# User Guide

<!-- TOC -->
* [User Guide](#user-guide)
* [Filter Options](#filter-options)
* [Dashboard](#dashboard)
* [Agents](#agents)
  * [Add a new Agent](#add-a-new-agent)
  * [Agent Details](#agent-details)
* [Groups](#groups)
  * [Create new Group](#create-new-group)
  * [Group Details](#group-details)
* [Packages](#packages)
  * [Add new Package](#add-new-package)
  * [Package Details](#package-details)
* [Deployments](#deployments)
  * [Deployment Details](#deployment-details)
<!-- TOC -->

# Filter Options

Most Pages have `Filter Options`. These Options are stored in the Browsers local storage. In the `Filter Options` you
can select which fields of tables are shown. When you use the Search, it will only search across visible columns in the
tables.

# Dashboard

The Dashboard provides an easy way to get an overview of all important Data.

The dashboard auto-refreshes (the green progressbar under the `Options`-Panel shows when the next refresh happens and
can be configured in the `Options`-Panel).

You can click on:

* Agent Status:
    * Inactive
    * Outdated
* Package Status
    * Unprocessed
    * Error
* Deployment Status
    * Outstanding
    * Error

This will open a popup, that also auto-refreshes when the dashboard does and shows you the relevant infos.

![Dashboard](images/OPD/OPD_Dashboard.png)

# Agents

You can see the status of Agents, as well as add new ones.

![Agent Overview](images/OPD/OPD_Agents_with_filter.png)

## Add a new Agent

When you press the `Add Agent`-Button, a popup will open where you can select your OS and it will show you a script that
you can copy and execute on the Endpoint.

![Add Agent popup](images/OPD/OPD_add_new_agent_empty.png)

The Script will:

* Install Java
* Download the Agent
* Set up a Service to auto(re)start the Agent
* Set up required config to allow the Agent to register

## Agent Details

When you click on an Agent in the table, a popup with detailed information about it will be opened. You also have some
settings for it.

The Button `Reset Deployments` will reset the status for all deployments for this Agent. The next time it will contact
the Server, the available Packages will be deployed again.

![Agent Detail popup](images/OPD/OPD_agent_details.png)

You can also create/remove deployments and add/remove the Agent to/from Groups.

# Groups

OPD has support for groups, to make deployment of multiple Packages simpler. A group is for a specific OS and can have
multiple Packages and Agents.

![Group Overview](images/OPD/OPD_Groups.png)

## Create new Group

To create a new group, simply use the `New Group`-Button. You have to select an OS and a Name with an optional
description.

![Create Group](images/OPD/OPD_Groups.png)

## Group Details

When you click on a group, you will get an popup, similar to [Agent Details](#agent-details).

![Group Detail popup](images/OPD/OPD_group_details.png)

# Packages

Here you can manage all of your Packages.

![Package Overview](images/OPD/OPD_Packages.png)

## Add new Package

If you want to add a new Package, press the `Add Package`- Button.

In this popup, you have to specify a Name, the Checksum, the OS and a file. You can optionally specify an expected
return
value.

If you want more information on how to create and add/update a Package, head over to the [Create a Package Guide]().

![Add new Package](images/OPD/OPD_add_new_package.png)

## Package Details

When opening the details of a Package,

The Button `Reset Deployments` will reset the status for all deployments for this Package.

The Button `Update Content` allows you to upload a Package, that will replace the current one.

![Package Details](images/OPD/OPD_package_details.png)

# Deployments

Here you have an overview of all deployments.

Explanation of values:

* `Direct Deployment`: If `true` the Package was manually(directly) deployed to the Agent. If `false`, the Package is
  deployed through at minimum one group.
* 

![Deployment Overview](images/OPD/OPD_Deployments.png)

## Deployment Details

![Deployment Details](images/OPD/OPD_deployment_details.png)

