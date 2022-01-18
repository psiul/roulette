select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,store_returns sr,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and hd.hd_hash >= 42 and hd.hd_hash <= 792 and cd.cd_hash >= 2 and cd.cd_hash <= 335 and c.c_hash >= 102 and c.c_hash <= 502
;
