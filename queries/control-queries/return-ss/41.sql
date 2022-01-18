select count(ss.ss_item_sk)
from store_sales ss,customer c,store_returns sr,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 372 and ss.ss_hash <= 772 and c.c_hash >= 70 and c.c_hash <= 820 and hd.hd_hash >= 117 and hd.hd_hash <= 450
;
