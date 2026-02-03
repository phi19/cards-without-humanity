/*
  Warnings:

  - A unique constraint covering the columns `[gameId,roomUserId]` on the table `player` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `Player_gameId_roomUserId_key` ON `player`(`gameId`, `roomUserId`);

-- AddForeignKey
ALTER TABLE `round` ADD CONSTRAINT `Round_gameId_fkey` FOREIGN KEY (`gameId`) REFERENCES `game`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
