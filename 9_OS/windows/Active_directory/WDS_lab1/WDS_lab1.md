# WDS Lab 1

## Usage (content)

- Boot process on windows :
    - electrical start from power supply and convert 220V to 3.3V, 5V, 12V
    - CPU load UEFI BIOS and Start the POST process (Power On Self Test) : checking devices, allocate memory and cpu ressources in CMOS.
    - EFI boot loader : read the boot sequence and GPT partition to find BOOTMGFW.efi (boot manager) and showing OS available (BCD database) and loading the OS winload.efi (windows loader program) which start the windows kernel (ntoskernel.exe), the loadin the libary hal.dll (Hardware Abstraction Layer)
    - The kernl load the drivers, registry and SMSS.exe (Session Manager Sub system) which load user login interface and process (winlogon.exe).

- PXE : Preboot Execution Environment, is a client-server interface used to boot a computer from a server before deploying an image. PXE is based on DHCP and TFTP.

    - DHCP part : Option 66 (TFTP server IP address) and 67 (network boot program file name) are used to defined what boot file name to use and where to find it.
    - TFTP part (UDP 69) : Server that will transfer Windows PE boot files to the PXE client.

- Boot.wim : is the first file to be read which start the windows PE.

- Install.wim : file that contain the windows base os (which will be installed on the choosen partition).

- WDS : Windows Deployment Service is the PXE widows server.

    - How to install WDS role on Active Directory Domain Controller (following https://www.youtube.com/watch?v=22Tf5_bxsBg) : 
        - Install the WDS role : From server manager menu, go to Add feature and choose WDS role. Then Go to "tools" and choose the WDS service. Then start the WDS config wizard, choose to add the WDS to the domain, choose the path where the PXE files, install images, management tools for windows deployment are. Other options are simple (DHCP, and clients allowed to PXE). Finally start the service by clicking on the server -> all tasks -> Start.
        - Add a boot image : From a install file (i.e : windows install CV) get the "boot.wim" file and "install.wim". Get back to the WDS service (By going to tools), and click on "boot image" and choose the path to the "boot.wim" file. This file will be use to deploy a specific windows version, configure metadata according.
        - Add installation image : Still in WDS menu, click on "installation image" and create a new group for better organization, click on the created group and add a new installation image, choose the path to the "install.wim" file.

        - Multicast communication to accelerate multiple deployement : Under WDS menu, go to "Multicast diffusion", click on it and chosse create new.

- Windows PE (Preinstallation Environnement) : Windows PE (WinPE) is a small operating system used to install, deploy, and repair Windows desktop editions, Windows Server, and other Windows operating systems.

- Sysprep : The System Preparation (Sysprep) tool is used to change Windows images from a generalized state to a specialized state, and then back to a generalized state. A generalized image can be deployed on any computer. A specialized image is targeted to a specific computer. You must reseal, or generalize, a Windows image before you capture and deploy the image. For example, when you use the Sysprep tool to generalize an image, Sysprep removes all system-specific information and resets the computer. 

- DISM (Deployment Imaging and Servicing Management) : DISM is a command-line tool that can be used to service and prepare Windows images, including those used for Windows PE, Windows Recovery Environment (Windows RE) and Windows Setup. DISM can be used to service a Windows image (.wim) or a virtual hard disk (.vhd or .vhdx).

- MSCCM (Microsoft System Center 2012 R2 Configuration Manager) : Tools that permit to make zerotouch Deployement. The name as change starting to windows 2019 to Microsoft Endpoint Manager.

- MDT (Microsoft Deployment Toolkit): A tool to create Lightouch deployement. Adding Task sequences with answer file which add configure option (language package, user config, drivers ...). These task sequence are configurable from the WSIM (Windows System Image Manager) tool that help to create the answer file.

    - How to install and configure MDT service : Go to windows website and download the .msi file which will install MDT. After installing it launch the Deployment Workbench from the Microsoft Deployment Toolkit menu.

## sources :

- video tutorial on WDS (10 min) : https://www.youtube.com/watch?v=22Tf5_bxsBg
- video about windows deployment with MDT and WDS (50 min) : https://www.youtube.com/watch?v=_uECcxjiuM8&t=1088s
- Sysprep usage with windows 10 (tutorial video) : https://www.youtube.com/watch?v=xfr-x9zGXC4
- PXE explain : https://www.manageengine.com/products/os-deployer/pxe-preboot-execution-environment.html
- PXE configuration (microsoft official doc) : https://learn.microsoft.com/en-us/windows/deployment/configure-a-pxe-server-to-load-windows-pe
- What is Windows PE : https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/winpe-intro?view=windows-11
- Process of startup windows PC (video) : https://www.youtube.com/watch?v=VDKvngQXFfU
- very good MDT presentation : https://www.youtube.com/watch?v=Ds733iuWw6o
- Multicast WDS video : https://www.youtube.com/watch?v=svaozN_AqTI