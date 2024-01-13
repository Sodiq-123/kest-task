-- CreateEnum
CREATE TYPE "DroneModel" AS ENUM ('LIGHTWEIGHT', 'MIDDLEWEIGHT', 'CRUISERWEIGHT', 'HEAVYWEIGHT');

-- CreateEnum
CREATE TYPE "DroneState" AS ENUM ('IDLE', 'LOADING', 'LOADED', 'DELIVERING', 'DELIVERED', 'RETURNING');

-- CreateTable
CREATE TABLE "drones" (
    "id" TEXT NOT NULL,
    "serial_no" TEXT NOT NULL,
    "model" "DroneModel" NOT NULL,
    "weight_limit" DECIMAL(10,2) NOT NULL,
    "remaining_weight" DECIMAL(10,2) NOT NULL,
    "battery_capacity" INTEGER NOT NULL,
    "remaining_battery" INTEGER NOT NULL,
    "state" "DroneState" NOT NULL DEFAULT 'IDLE',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "drones_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "medications" (
    "id" TEXT NOT NULL,
    "drone_id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "weight" DECIMAL(10,2) NOT NULL,
    "code" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "medications_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "drones_serial_no_key" ON "drones"("serial_no");

-- CreateIndex
CREATE UNIQUE INDEX "medications_name_key" ON "medications"("name");

-- CreateIndex
CREATE UNIQUE INDEX "medications_code_key" ON "medications"("code");

-- AddForeignKey
ALTER TABLE "medications" ADD CONSTRAINT "medications_drone_id_fkey" FOREIGN KEY ("drone_id") REFERENCES "drones"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
