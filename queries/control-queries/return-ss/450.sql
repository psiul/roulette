select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,store_returns sr,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 519 and cd.cd_hash <= 852 and c.c_hash >= 113 and c.c_hash <= 863 and hd.hd_hash >= 508 and hd.hd_hash <= 908
;
