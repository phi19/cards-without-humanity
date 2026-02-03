-- AddForeignKey
ALTER TABLE `roomuser` ADD CONSTRAINT `RoomUser_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
