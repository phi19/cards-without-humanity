-- DropForeignKey
ALTER TABLE `room` DROP FOREIGN KEY `Room_hostId_fkey`;

-- AddForeignKey
ALTER TABLE `room` ADD CONSTRAINT `Room_hostId_fkey` FOREIGN KEY (`hostId`) REFERENCES `roomuser`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
