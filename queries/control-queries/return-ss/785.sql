select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,store_returns sr
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 60 and ss.ss_hash <= 393 and c.c_hash >= 70 and c.c_hash <= 820 and cd.cd_hash >= 488 and cd.cd_hash <= 888
;
