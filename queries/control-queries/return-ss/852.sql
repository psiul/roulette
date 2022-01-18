select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,store_returns sr,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 14 and ss.ss_hash <= 764 and cd.cd_hash >= 181 and cd.cd_hash <= 514 and hd.hd_hash >= 128 and hd.hd_hash <= 528
;
