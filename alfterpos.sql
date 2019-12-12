ALTER TABLE `business`   
  ADD COLUMN `exchange_rate` TEXT NULL AFTER `sms_settings`;

ALTER TABLE `transactions`   
  ADD COLUMN `paying_with_khr` DECIMAL(22,4) DEFAULT 0.0000  NULL AFTER `final_total`,
  ADD COLUMN `paying_with_usd` DECIMAL(22,4) DEFAULT 0.0000  NULL AFTER `paying_with_khr`,
  ADD COLUMN `paying_khr` DECIMAL(22,4) DEFAULT 0.0000  NULL AFTER `paying_with_usd`,
  ADD COLUMN `exchange_rate_in` DECIMAL NULL AFTER `paying_khr`,
  ADD COLUMN `exchange_rate_khr` DECIMAL NULL AFTER `exchange_rate_in`;

ALTER TABLE `transactions`   
  ADD COLUMN `final_total_khr` DECIMAL(22,4) DEFAULT 0.0000  NULL AFTER `final_total`;

ALTER TABLE `transaction_payments`   
  ADD COLUMN `amount_khr` DECIMAL(22,4) DEFAULT 0.0000  NULL AFTER `amount`;

ALTER TABLE `transaction_payments`   
  ADD COLUMN `paying_khr` DECIMAL(22,4) DEFAULT 0.0000  NULL AFTER `amount_khr`;

ALTER TABLE `transaction_payments`   
  ADD COLUMN `amount_trail` DECIMAL(22,4) DEFAULT 0.0000  NULL AFTER `paying_khr`;
