#This Project will be about displaying the capacity and free space of each hard drive in your system and eventually ask if you would like to see what folders are using up the most amount of space on your machine.
#
#Created by Zach Moffett
Get-CimInstance -Class CIM_LogicalDisk | Select-Object DeviceID, @{Name="Size(GB)"; Expression={$_.size/1gb}}, 
@{Name="Free Space(GB)";Expression={$_.freespace/1gb}},
@{Name="Free (%)";Expression={"{0,6:P0}" -f(($_.freespace/1gb) / ($_.size/1gb))}}, DriveType | Where-Object DriveType -EQ '3';