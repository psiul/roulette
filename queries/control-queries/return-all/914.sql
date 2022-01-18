select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,household_demographics hd,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and cd.cd_hash >= 180 and cd.cd_hash <= 930 and hd.hd_hash >= 597 and hd.hd_hash <= 997 and c.c_hash >= 123 and c.c_hash <= 456
;
