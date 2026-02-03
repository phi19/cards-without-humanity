-- AddForeignKey
ALTER TABLE `roundpick` ADD CONSTRAINT `RoundPick_roundId_fkey` FOREIGN KEY (`roundId`) REFERENCES `round`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
