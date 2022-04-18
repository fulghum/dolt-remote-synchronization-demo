# dolt-remote-synchronization-demo

This demo shows an approach for synchronizing two Dolt Database remotes: DoltHub and a running Dolt SQL server process. 

## Setup
### DoltHub Remote
Create a DoltHub database with the following tables:
```sql
CREATE TABLE `configuration` (
    `name` text NOT NULL,
    `value` text NOT NULL,
    PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    
CREATE TABLE `app_data` (
    `id` int NOT NULL AUTO_INCREMENT,
    `d` datetime,
    `n` int,
    `t` text,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

### Dolt DB SQL Server
Clone your new DoltHub database to your local disk, turn on dolt_transaction_commit, create the stored procedure for synchronization, and start a SQL server:
```shell
dolt clone <your database identifier>
dolt config --global --add dolt_transaction_commit 1
dolt sql < create-sync-procedure.sql
dolt sql-server 
```

In a separate terminal, launch the synchronization script to synchronize the Dolt DB SQL instance with the ```main``` branch on the ```origin``` remote (i.e. DoltHub):
```shell
./sync-remotes.sh
```

### Test Data Generator
Launch the data inserter script to create test data in the ```app_data``` table:
```shell
./insert-data.sh
```

## Demo
After completing the setup steps above, you can demo the system by:
* Making a change to data in the ```configuration``` table on the DoltHub remote of your database.
* Opening a MySQL shell to the local Dolt DB instance and verify that your DoltHub configuration changes automatically appear in the local Dolt DB remote within a few minutes, after the synchronization logic has run.  
* Open a browser to your database on DoltHub and verify that the changes to the ```app_data``` table are also appearing on the DoltHub remote.  

