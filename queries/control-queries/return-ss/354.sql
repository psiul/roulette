select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 547 and cd.cd_hash <= 947 and hd.hd_hash >= 309 and hd.hd_hash <= 642 and c.c_hash >= 65 and c.c_hash <= 815
;
