select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and hd.hd_hash >= 102 and hd.hd_hash <= 502 and cd.cd_hash >= 114 and cd.cd_hash <= 864 and c.c_hash >= 398 and c.c_hash <= 731
;
