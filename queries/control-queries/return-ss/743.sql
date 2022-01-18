select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 52 and ss.ss_hash <= 452 and cd.cd_hash >= 148 and cd.cd_hash <= 898 and hd.hd_hash >= 379 and hd.hd_hash <= 712
;
