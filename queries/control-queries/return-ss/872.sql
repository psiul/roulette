select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,store_returns sr
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_hash >= 131 and c.c_hash <= 881 and cd.cd_hash >= 390 and cd.cd_hash <= 790 and hd.hd_hash >= 92 and hd.hd_hash <= 425
;
