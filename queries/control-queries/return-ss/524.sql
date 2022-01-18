select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and cd.cd_hash >= 45 and cd.cd_hash <= 445 and c.c_hash >= 39 and c.c_hash <= 372 and hd.hd_hash >= 149 and hd.hd_hash <= 899
;
