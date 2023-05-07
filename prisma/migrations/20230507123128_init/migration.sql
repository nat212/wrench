-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT,
    "roles" TEXT[],

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProcessorSocket" (
    "code" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "manufacturer" TEXT NOT NULL,

    CONSTRAINT "ProcessorSocket_pkey" PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "MemorySlotType" (
    "code" TEXT NOT NULL,
    "label" TEXT NOT NULL,

    CONSTRAINT "MemorySlotType_pkey" PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "MemoryType" (
    "code" TEXT NOT NULL,
    "label" TEXT NOT NULL,

    CONSTRAINT "MemoryType_pkey" PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "RaidType" (
    "code" TEXT NOT NULL,
    "label" TEXT NOT NULL,

    CONSTRAINT "RaidType_pkey" PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "M2FormFactor" (
    "code" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "length" DOUBLE PRECISION,

    CONSTRAINT "M2FormFactor_pkey" PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "SataType" (
    "code" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "speed" DOUBLE PRECISION,

    CONSTRAINT "SataType_pkey" PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "EthernetType" (
    "code" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "speed" DOUBLE PRECISION,

    CONSTRAINT "EthernetType_pkey" PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "WifiStandard" (
    "code" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "speed" DOUBLE PRECISION,

    CONSTRAINT "WifiStandard_pkey" PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "BluetoothStandard" (
    "code" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "speed" DOUBLE PRECISION,

    CONSTRAINT "BluetoothStandard_pkey" PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "USBStandard" (
    "code" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "speed" DOUBLE PRECISION,
    "connectors" TEXT[],

    CONSTRAINT "USBStandard_pkey" PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "MotherboardRearUSBPort" (
    "motherboardId" TEXT NOT NULL,
    "usbStandardCode" TEXT NOT NULL,

    CONSTRAINT "MotherboardRearUSBPort_pkey" PRIMARY KEY ("motherboardId","usbStandardCode")
);

-- CreateTable
CREATE TABLE "MotherboardFrontUSBHeader" (
    "motherboardId" TEXT NOT NULL,
    "usbStandardCode" TEXT NOT NULL,

    CONSTRAINT "MotherboardFrontUSBHeader_pkey" PRIMARY KEY ("motherboardId","usbStandardCode")
);

-- CreateTable
CREATE TABLE "MotherboardFormFactor" (
    "code" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "width" DOUBLE PRECISION,
    "height" DOUBLE PRECISION,

    CONSTRAINT "MotherboardFormFactor_pkey" PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "Motherboard" (
    "id" TEXT NOT NULL,
    "sku" TEXT NOT NULL,
    "manufacturer" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "width" DOUBLE PRECISION,
    "height" DOUBLE PRECISION,
    "length" DOUBLE PRECISION,
    "launchDate" TIMESTAMP(3),
    "processorSocketCode" TEXT NOT NULL,
    "chipset" TEXT NOT NULL,
    "nvmeSupport" BOOLEAN,
    "memorySlots" INTEGER,
    "memorySlotTypeCode" TEXT NOT NULL,
    "maxMemorySize" DOUBLE PRECISION,
    "maxMemorySpeed" DOUBLE PRECISION,
    "memoryTypeCode" TEXT NOT NULL,
    "eccSupport" BOOLEAN,
    "memoryChannels" INTEGER,
    "onboardGraphics" BOOLEAN,
    "displayPortOutputs" INTEGER,
    "vgaOutputs" INTEGER,
    "hdmiOutputs" INTEGER,
    "pcieSlots" INTEGER,
    "formFactorCode" TEXT NOT NULL,

    CONSTRAINT "Motherboard_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Processor" (
    "id" TEXT NOT NULL,
    "sku" TEXT NOT NULL,
    "manufacturer" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "width" DOUBLE PRECISION,
    "height" DOUBLE PRECISION,
    "length" DOUBLE PRECISION,
    "launchDate" TIMESTAMP(3),
    "processorSocketCode" TEXT NOT NULL,

    CONSTRAINT "Processor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_M2FormFactorToMotherboard" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_EthernetTypeToMotherboard" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_BluetoothStandardToMotherboard" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_MotherboardToSataType" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_MotherboardToRaidType" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_MotherboardToWifiStandard" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Motherboard_sku_key" ON "Motherboard"("sku");

-- CreateIndex
CREATE UNIQUE INDEX "Processor_sku_key" ON "Processor"("sku");

-- CreateIndex
CREATE UNIQUE INDEX "_M2FormFactorToMotherboard_AB_unique" ON "_M2FormFactorToMotherboard"("A", "B");

-- CreateIndex
CREATE INDEX "_M2FormFactorToMotherboard_B_index" ON "_M2FormFactorToMotherboard"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_EthernetTypeToMotherboard_AB_unique" ON "_EthernetTypeToMotherboard"("A", "B");

-- CreateIndex
CREATE INDEX "_EthernetTypeToMotherboard_B_index" ON "_EthernetTypeToMotherboard"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_BluetoothStandardToMotherboard_AB_unique" ON "_BluetoothStandardToMotherboard"("A", "B");

-- CreateIndex
CREATE INDEX "_BluetoothStandardToMotherboard_B_index" ON "_BluetoothStandardToMotherboard"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_MotherboardToSataType_AB_unique" ON "_MotherboardToSataType"("A", "B");

-- CreateIndex
CREATE INDEX "_MotherboardToSataType_B_index" ON "_MotherboardToSataType"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_MotherboardToRaidType_AB_unique" ON "_MotherboardToRaidType"("A", "B");

-- CreateIndex
CREATE INDEX "_MotherboardToRaidType_B_index" ON "_MotherboardToRaidType"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_MotherboardToWifiStandard_AB_unique" ON "_MotherboardToWifiStandard"("A", "B");

-- CreateIndex
CREATE INDEX "_MotherboardToWifiStandard_B_index" ON "_MotherboardToWifiStandard"("B");

-- AddForeignKey
ALTER TABLE "MotherboardRearUSBPort" ADD CONSTRAINT "MotherboardRearUSBPort_motherboardId_fkey" FOREIGN KEY ("motherboardId") REFERENCES "Motherboard"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MotherboardRearUSBPort" ADD CONSTRAINT "MotherboardRearUSBPort_usbStandardCode_fkey" FOREIGN KEY ("usbStandardCode") REFERENCES "USBStandard"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MotherboardFrontUSBHeader" ADD CONSTRAINT "MotherboardFrontUSBHeader_motherboardId_fkey" FOREIGN KEY ("motherboardId") REFERENCES "Motherboard"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MotherboardFrontUSBHeader" ADD CONSTRAINT "MotherboardFrontUSBHeader_usbStandardCode_fkey" FOREIGN KEY ("usbStandardCode") REFERENCES "USBStandard"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Motherboard" ADD CONSTRAINT "Motherboard_processorSocketCode_fkey" FOREIGN KEY ("processorSocketCode") REFERENCES "ProcessorSocket"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Motherboard" ADD CONSTRAINT "Motherboard_memorySlotTypeCode_fkey" FOREIGN KEY ("memorySlotTypeCode") REFERENCES "MemorySlotType"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Motherboard" ADD CONSTRAINT "Motherboard_memoryTypeCode_fkey" FOREIGN KEY ("memoryTypeCode") REFERENCES "MemoryType"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Motherboard" ADD CONSTRAINT "Motherboard_formFactorCode_fkey" FOREIGN KEY ("formFactorCode") REFERENCES "MotherboardFormFactor"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Processor" ADD CONSTRAINT "Processor_processorSocketCode_fkey" FOREIGN KEY ("processorSocketCode") REFERENCES "ProcessorSocket"("code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_M2FormFactorToMotherboard" ADD CONSTRAINT "_M2FormFactorToMotherboard_A_fkey" FOREIGN KEY ("A") REFERENCES "M2FormFactor"("code") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_M2FormFactorToMotherboard" ADD CONSTRAINT "_M2FormFactorToMotherboard_B_fkey" FOREIGN KEY ("B") REFERENCES "Motherboard"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EthernetTypeToMotherboard" ADD CONSTRAINT "_EthernetTypeToMotherboard_A_fkey" FOREIGN KEY ("A") REFERENCES "EthernetType"("code") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EthernetTypeToMotherboard" ADD CONSTRAINT "_EthernetTypeToMotherboard_B_fkey" FOREIGN KEY ("B") REFERENCES "Motherboard"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BluetoothStandardToMotherboard" ADD CONSTRAINT "_BluetoothStandardToMotherboard_A_fkey" FOREIGN KEY ("A") REFERENCES "BluetoothStandard"("code") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BluetoothStandardToMotherboard" ADD CONSTRAINT "_BluetoothStandardToMotherboard_B_fkey" FOREIGN KEY ("B") REFERENCES "Motherboard"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MotherboardToSataType" ADD CONSTRAINT "_MotherboardToSataType_A_fkey" FOREIGN KEY ("A") REFERENCES "Motherboard"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MotherboardToSataType" ADD CONSTRAINT "_MotherboardToSataType_B_fkey" FOREIGN KEY ("B") REFERENCES "SataType"("code") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MotherboardToRaidType" ADD CONSTRAINT "_MotherboardToRaidType_A_fkey" FOREIGN KEY ("A") REFERENCES "Motherboard"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MotherboardToRaidType" ADD CONSTRAINT "_MotherboardToRaidType_B_fkey" FOREIGN KEY ("B") REFERENCES "RaidType"("code") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MotherboardToWifiStandard" ADD CONSTRAINT "_MotherboardToWifiStandard_A_fkey" FOREIGN KEY ("A") REFERENCES "Motherboard"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MotherboardToWifiStandard" ADD CONSTRAINT "_MotherboardToWifiStandard_B_fkey" FOREIGN KEY ("B") REFERENCES "WifiStandard"("code") ON DELETE CASCADE ON UPDATE CASCADE;
