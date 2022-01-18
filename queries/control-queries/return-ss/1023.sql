select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 215 and ss.ss_hash <= 965 and cd.cd_hash >= 16 and cd.cd_hash <= 416 and hd.hd_hash >= 397 and hd.hd_hash <= 730
;
