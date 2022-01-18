select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 46 and ss.ss_hash <= 796 and c.c_hash >= 574 and c.c_hash <= 974 and hd.hd_hash >= 323 and hd.hd_hash <= 656
;
