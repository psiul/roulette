select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and cd.cd_hash >= 532 and cd.cd_hash <= 932 and hd.hd_hash >= 172 and hd.hd_hash <= 505 and c.c_hash >= 135 and c.c_hash <= 885
;
