
DELIMITER //
CREATE PROCEDURE SynchronizeWithRemote(
    IN remote VARCHAR(255),
    IN branch VARCHAR(255)
)
BEGIN
select dolt_fetch(remote, branch);
select dolt_merge(CONCAT(remote, "/", branch));
select dolt_commit('-am', "Merging DoltHub Configuration Changes");
select dolt_push(remote);
END //
DELIMITER ;
